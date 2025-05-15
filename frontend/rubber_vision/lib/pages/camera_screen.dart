// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rubber_vision/model/disease_model.dart';
// import 'analysis_screen.dart';
// import 'tflite_helper.dart';

// class CameraScreen extends StatefulWidget {
//   final bool fromGallery;

//   const CameraScreen({super.key, required this.fromGallery});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _initializeModel();
//     // Initialize TFLite when screen loads
//     // TFLiteHelper.initialize();
//   }
//   Future<void> _initializeModel() async {
//   await TFLiteHelper.initialize();
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Capture Image'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               color: Colors.black,
//               child: Center(
//                 child: Text(
//                   widget.fromGallery ? 'Image Picker View' : 'Camera Preview',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           _buildControlBar(),
//         ],
//       ),
//     );
//   }

//   Widget _buildControlBar() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       color: Colors.black87,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           if (widget.fromGallery)
//             _buildControlButton(
//               icon: Icons.collections,
//               label: 'Browse',
//               onPressed: _pickFromGallery,
//             )
//           else
//             _buildControlButton(
//               icon: Icons.switch_camera,
//               label: 'Flip',
//               onPressed: _switchCamera,
//             ),
//           _buildCaptureButton(),
//           _buildControlButton(
//             icon: Icons.photo_library,
//             label: 'Gallery',
//             onPressed: () => _navigateToCameraScreen(context, fromGallery: true),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildControlButton({
//     required IconData icon,
//     required String label,
//     required VoidCallback onPressed,
//   }) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(icon, color: Colors.white),
//           onPressed: onPressed,
//         ),
//         Text(label, style: const TextStyle(color: Colors.white)),
//       ],
//     );
//   }

//   Widget _buildCaptureButton() {
//     return GestureDetector(
//       onTap: _captureImage,
//       child: Container(
//         width: 72,
//         height: 72,
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.white, width: 2),
//         ),
//         child: Container(
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _captureImage() async {
//     // Implement camera capture
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       // Process the image with your model
//       _processImage(image.path);
//     }
//   }

//   Future<void> _pickFromGallery() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       _processImage(image.path);
//     }
//   }

//   void _switchCamera() {
//     // Implement camera switching
//   }

// // Update the _processImage method in _CameraScreenState
//   Future<void> _processImage(String imagePath) async {
//     final File imageFile = File(imagePath);
//     final result = await TFLiteHelper.classifyImage(imageFile);

//     if (result != null) {
//       final diseaseData = DiseaseData(
//         disease: result['disease'] ?? 'Unknown',
//         confidence: result['confidence'] ?? '0%',
//         scientificName: result['scientificName'] ?? '',
//         description: result['description'] ?? '',
//         symptoms: result['symptoms'] ?? [],
//         recommendations: result['recommendations'] ?? [],
//         severity: result['severity'] ?? 'Unknown',
//         treatment: result['treatment'] ?? '',
//       );

//      final shouldRefresh = await Navigator.pushReplacement(
//         // ignore: use_build_context_synchronously
//         context,
//         MaterialPageRoute(
//           builder: (context) => AnalysisScreen(
//             imagePath: imagePath,
//             isFromCamera: !widget.fromGallery,
//             diseaseData: diseaseData,
//           ),
//         ),
//       );
//        if (shouldRefresh == true) {
     
//     }
//     } else {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to analyze image')),
//       );
//     }
//   }


//   void _navigateToCameraScreen(BuildContext context, {required bool fromGallery}) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CameraScreen(fromGallery: fromGallery),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rubber_vision/model/disease_model.dart';
import 'analysis_screen.dart';
import 'tflite_helper.dart';

class CameraScreen extends StatefulWidget {
  final bool fromGallery;

  const CameraScreen({super.key, required this.fromGallery});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize TFLite when screen loads
    TFLiteHelper.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  widget.fromGallery ? 'Image Picker View' : 'Camera Preview',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          _buildControlBar(),
        ],
      ),
    );
  }

  Widget _buildControlBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (widget.fromGallery)
            _buildControlButton(
              icon: Icons.collections,
              label: 'Browse',
              onPressed: _pickFromGallery,
            )
          else
            _buildControlButton(
              icon: Icons.switch_camera,
              label: 'Flip',
              onPressed: _switchCamera,
            ),
          _buildCaptureButton(),
          _buildControlButton(
            icon: Icons.photo_library,
            label: 'Gallery',
            onPressed: () => _navigateToCameraScreen(context, fromGallery: true),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildCaptureButton() {
    return GestureDetector(
      onTap: _captureImage,
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _captureImage() async {
    // Implement camera capture
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Process the image with your model
      _processImage(image.path);
    }
  }

  Future<void> _pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _processImage(image.path);
    }
  }

  void _switchCamera() {
    // Implement camera switching
  }

// Update the _processImage method in _CameraScreenState
  Future<void> _processImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final result = await TFLiteHelper.classifyImage(imageFile);

    if (result != null) {
      final diseaseData = DiseaseData(
        disease: result['disease'] ?? 'Unknown',
        confidence: result['confidence'] ?? '0%',
        scientificName: result['scientificName'] ?? '',
        description: result['description'] ?? '',
        symptoms: result['symptoms'] ?? [],
        recommendations: result['recommendations'] ?? [],
        severity: result['severity'] ?? 'Unknown',
        treatment: result['treatment'] ?? '',
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AnalysisScreen(
            imagePath: imagePath,
            isFromCamera: !widget.fromGallery,
            diseaseData: diseaseData,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to analyze image')),
      );
    }
  }


  void _navigateToCameraScreen(BuildContext context, {required bool fromGallery}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(fromGallery: fromGallery),
      ),
    );
  }
}

