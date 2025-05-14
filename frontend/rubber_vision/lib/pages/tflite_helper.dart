import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteHelper {
  static late Interpreter _interpreter;
  static bool _isInitialized = false;
  static final List<String> _labels = [
    'birds_eye_spot',
    'colletotrinchum_leaf_spot',
    'corynespora_leaf',
    'phytopthora_leaf_fall',
    'powdery_mildew',
    'rubber',
    'non_rubber'
  ];

  // Initialize the TFLite interpreter
  static Future<void> initialize() async {
    try {
      // Load the model from assets
      const modelPath = 'assets/rubber_tree_disease_model.tflite';
      _interpreter = await Interpreter.fromAsset(modelPath);

      // Print model input/output details for debugging
      if (kDebugMode) {
        print('Model loaded successfully');
        print('Input details: ${_interpreter.getInputTensors()}');
        print('Output details: ${_interpreter.getOutputTensors()}');
      }

      _isInitialized = true;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to load model: $e');
      }
    }
  }



 
  static Float32List _imageToByteListFloat32(img.Image image, int inputSize) {
    final convertedBytes = Float32List(1 * inputSize * inputSize * 3); 
    final buffer = Float32List.view(convertedBytes.buffer);

    int pixelIndex = 0;
    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = image.getPixel(x, y);
        buffer[pixelIndex++] = (pixel.r - 127.5) / 127.5;  
        buffer[pixelIndex++] = (pixel.g - 127.5) / 127.5;
        buffer[pixelIndex++] = (pixel.b - 127.5) / 127.5;
      }
    }

    if (kDebugMode) {
      print("Image shape: [1, $inputSize, $inputSize, 3]");
      print("Tensor shape: ${convertedBytes.length}");
    }

    return convertedBytes;
  }


    // Classify the input image to detect the disease
static Future<Map<String, dynamic>?> classifyImage(File imageFile) async {
  if (!_isInitialized) {
    throw Exception("Interpreter not initialized.");
  }

  try {
    // Preprocess the image
    final imageBytes = await imageFile.readAsBytes();
    final image = img.decodeImage(imageBytes)!;
    final resizedImage = img.copyResize(image, width: 224, height: 224);
    
    // Create input tensor with correct shape [1, 224, 224, 3]
    final input = _imageToByteListFloat32(resizedImage, 224);

    // Run inference - create properly typed output buffer
    final output = List<double>.filled(_labels.length, 0.0).reshape([1, _labels.length]);
    
    // Reshape input to [1, 224, 224, 3] before running
    final reshapedInput = input.reshape([1, 224, 224, 3]);
    
    if (kDebugMode) {
      print("Input shape before reshape: ${input.length}");
      print("Input shape after reshape: ${reshapedInput.shape}");
    }

    _interpreter.run(reshapedInput, output);

    // Get results with proper type handling
    final outputArray = output[0] as List<double>;
    final confidence = outputArray.reduce((a, b) => a > b ? a : b);
    final index = outputArray.indexOf(confidence);
    final label = _labels[index];

    // Only return results for actual diseases (not "rubber" or "non_rubber")
    if (label == 'rubber' || label == 'non_rubber') {
      return null;
    }

    return {
      'disease': _getDiseaseName(label),
      'confidence': '${(confidence * 100).toStringAsFixed(2)}%',
      'scientificName': _getScientificName(label),
      'description': _getDescription(label),
      'symptoms': _getSymptoms(label),
      'recommendations': _getRecommendations(label),
      'severity': _getSeverity(label),
      'treatment': _getTreatment(label),
    };
    
  } catch (e) {
    // ignore: unrelated_type_equality_checks
    if ( _labels != 'rubber' && _labels != 'non_rubber') {
      if (kDebugMode) {
        print('Error during classification: $e');
      }
    }
   
    return null;
  }
}

  // Helper methods to get disease-specific information
  static String _getDiseaseName(String label) {
    switch (label) {
      case 'birds_eye_spot': return 'Bird\'s Eye Spot';
      case 'colletotrinchum_leaf_spot': return 'Colletotrinchum Leaf Spot';
      case 'corynespora_leaf': return 'Corynespora Leaf Spot';
      case 'phytopthora_leaf_fall': return 'Phytopthora Leaf Fall';
      case 'powdery_mildew': return 'Powdery Mildew';
      case 'rubber': return 'Healthy Rubber Leaf';
      case 'non_rubber': return 'Not a Rubber Leaf';
      default: return 'Unknown';
    }
  }

  static String _getScientificName(String label) {
    switch (label) {
      case 'birds_eye_spot': return 'Helminthosporium heveae';
      case 'colletotrinchum_leaf_spot': return 'Colletotrichum gloeosporioides';
      case 'corynespora_leaf': return 'Corynespora cassiicola';
      case 'phytopthora_leaf_fall': return 'Phytophthora spp.';
      case 'powdery_mildew': return 'Oidium heveae';
      case 'rubber': return 'Hevea brasiliensis (Healthy)';
      default: return 'Unknown';
    }
  }

  static String _getDescription(String label) {
    switch (label) {
      case 'birds_eye_spot':
        return 'Small circular spots with dark margins and light centers, resembling bird\'s eyes.';
      case 'colletotrinchum_leaf_spot':
        return 'Irregular brown spots that may coalesce, often with yellow halos.';
      case 'corynespora_leaf':
        return 'Large irregular spots with concentric rings, causing premature leaf fall.';
      case 'phytopthora_leaf_fall':
        return 'Dark, water-soaked lesions leading to rapid leaf fall during wet weather.';
      case 'powdery_mildew':
        return 'White powdery fungal growth on leaf surfaces, causing distortion.';
      case 'rubber':
        return 'Healthy rubber tree leaf with no signs of disease.';
      case 'non_rubber':
        return 'The image does not appear to be a rubber tree leaf.';
      default:
        return 'Unknown disease description.';
    }
  }

  static List<String> _getSymptoms(String label) {
    switch (label) {
      case 'birds_eye_spot':
        return [
          'Small circular spots (2-5mm diameter)',
          'Dark brown margins with light gray centers',
          'Spots may coalesce in severe infections'
        ];
      case 'colletotrinchum_leaf_spot':
        return [
          'Irregular dark spots with concentric rings',
          'Yellow halos around spots'
        ];
      case 'corynespora_leaf':
        return [
          'Large, irregular, brown lesions',
          'Premature leaf fall'
        ];
      case 'phytopthora_leaf_fall':
        return [
          'Dark, water-soaked lesions',
          'Rapid leaf fall during wet weather'
        ];
      case 'powdery_mildew':
        return [
          'White, powdery fungal growth',
          'Leaf distortion and curling'
        ];
      case 'rubber':
        return [
          'Healthy, green leaves without any symptoms'
        ];
      case 'non_rubber':
        return [
          'Non-rubber tree or no leaf symptoms'
        ];
      default:
        return ['Unknown symptoms'];
    }
  }

  static List<String> _getRecommendations(String label) {
    switch (label) {
      case 'birds_eye_spot':
        return [
          'Apply copper-based fungicides',
          'Remove severely infected leaves',
          'Improve air circulation'
        ];
      case 'colletotrinchum_leaf_spot':
        return [
          'Apply appropriate fungicides',
          'Remove infected leaves'
        ];
      case 'corynespora_leaf':
        return [
          'Use systemic fungicides',
          'Improve drainage in wet conditions'
        ];
      case 'phytopthora_leaf_fall':
        return [
          'Improve drainage',
          'Apply fungicides'
        ];
      case 'powdery_mildew':
        return [
          'Apply sulfur-based fungicides',
          'Ensure proper leaf ventilation'
        ];
      case 'rubber':
        return [
          'No action needed for healthy leaves'
        ];
      case 'non_rubber':
        return [
          'Consult an expert for identification'
        ];
      default:
        return ['Consult an agronomist for specific recommendations'];
    }
  }

  static String _getSeverity(String label) {
    switch (label) {
      case 'birds_eye_spot':
      case 'colletotrinchum_leaf_spot':
        return 'Moderate';
      case 'corynespora_leaf':
      case 'phytopthora_leaf_fall':
        return 'High';
      case 'powdery_mildew':
        return 'Low to Moderate';
      case 'rubber':
        return 'None';
      default:
        return 'Unknown';
    }
  }

  static String _getTreatment(String label) {
    switch (label) {
      case 'birds_eye_spot':
        return 'Fungicide application recommended';
      case 'colletotrinchum_leaf_spot':
        return 'Fungicide and cultural controls';
      case 'corynespora_leaf':
        return 'Immediate fungicide treatment required';
      case 'phytopthora_leaf_fall':
        return 'Systemic fungicides and drainage improvement';
      case 'powdery_mildew':
        return 'Sulfur-based fungicides';
      case 'rubber':
        return 'No treatment needed';
      default:
        return 'Consult specialist';
    }
  }
}
