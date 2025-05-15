// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rubber_vision/pages/scan_history.dart';
// import 'package:rubber_vision/pages/storage_service.dart';
// import '../model/disease_model.dart';

// class AnalysisScreen extends StatelessWidget {
//   final String imagePath;
//   final bool isFromCamera;
//   final DiseaseData diseaseData;

//   const AnalysisScreen({
//     super.key,
//     required this.imagePath,
//     required this.isFromCamera,
//     required this.diseaseData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//         title: const Text('Analysis Results',
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black54),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share_outlined, color: Colors.black54),
//             onPressed: () => _shareResults(context),
//           ),
//           IconButton(
//             icon: const Icon(Icons.bookmark_outline, color: Colors.black54),
//             onPressed: () => _saveToBookmarks(context),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildImagePreview(),
//             _buildDiagnosisCard(context),
//             _buildSectionTitle('Symptoms', Icons.warning_amber_outlined),
//             _buildSymptomsList(),
//             _buildSectionTitle('Recommendations', Icons.medical_services_outlined),
//             _buildRecommendationsList(),
//             _buildAdditionalInfo(),
//             _buildSaveButton(context),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildImagePreview() {
//     return Container(
//       height: 300,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         // ignore: deprecated_member_use
//         color: Colors.black.withOpacity(0.05),
//         border: Border.all(color: Colors.grey[200]!),
//       ),
//       child: Stack(
//         children: [
//            Center(
//             child: Image.file(
//               File(imagePath),
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//               errorBuilder: (context, error, stackTrace) {
//                 // Fallback if image fails to load
//                 return Image.asset(
//                   'assets/leaf_spot_example.jpg',
//                   fit: BoxFit.cover,
//                 );
//               },
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 // ignore: deprecated_member_use
//                 color: Colors.black.withOpacity(0.6),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 isFromCamera ? 'Photo' : 'From Gallery',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// Widget _buildDiagnosisCard(BuildContext context) {
//   return Container(
//     margin: const EdgeInsets.all(16),
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(
//           // ignore: deprecated_member_use
//           color: Colors.grey.withOpacity(0.1),
//           blurRadius: 10,
//           offset: const Offset(0, 4),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: _getDiseaseColor(diseaseData.severity),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Icon(Icons.health_and_safety, color: Colors.white),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     diseaseData.disease,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     diseaseData.scientificName,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 55),
//                 child: Chip(
//                   label: Text(
//                     diseaseData.confidence,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12, // Reduced font size if needed
//                     ),
//                   ),
//                   backgroundColor: _getConfidenceColor(diseaseData.confidence),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Text(
//           diseaseData.description,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[700],
//             height: 1.5,
//           ),
//         ),
//         const SizedBox(height: 16),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               _buildInfoChip('Severity: ${diseaseData.severity}',
//                   _getSeverityColor(diseaseData.severity)),
//               const SizedBox(width: 8),
//               _buildInfoChip(diseaseData.treatment, Colors.blue[100]!),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

//   Widget _buildSectionTitle(String title, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.deepPurple),
//           const SizedBox(width: 8),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSymptomsList() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: diseaseData.symptoms
//             .map((symptom) => _buildListTile(symptom, Colors.orange[50]!))
//             .toList(),
//       ),
//     );
//   }

//   Widget _buildRecommendationsList() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: diseaseData.recommendations
//             .map((recommendation) => _buildListTile(recommendation, Colors.green[50]!))
//             .toList(),
//       ),
//     );
//   }

//   Widget _buildListTile(String text, Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         leading: Container(
//           width: 32,
//           height: 32,
//           decoration: BoxDecoration(
//             color: color,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             Icons.check_circle_outline,
//             color: _getIconColor(color),
//             size: 20,
//           ),
//         ),
//         title: Text(
//           text,
//           style: const TextStyle(fontSize: 14),
//         ),
//         minLeadingWidth: 0,
//       ),
//     );
//   }

//   Widget _buildAdditionalInfo() {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             // ignore: deprecated_member_use
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Additional Information',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           _buildInfoRow('Season', 'Rainy season', Icons.calendar_today),
//           _buildInfoRow('Affected Parts', 'Leaves', Icons.grass),
//           _buildInfoRow('Spread', 'Airborne spores', Icons.air),
//           _buildInfoRow('Prevention', 'Proper spacing', Icons.health_and_safety),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String value, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: Colors.grey[600]),
//           const SizedBox(width: 12),
//           Text(
//             '$label: ',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[700],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSaveButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: SizedBox(
//         width: double.infinity,
//         child: ElevatedButton(
//           onPressed: () => _saveReport(context),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple,
//             foregroundColor: Colors.white,
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             elevation: 0,
//           ),
//           child: const Text('Save Report to History'),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoChip(String label, Color color) {
//     return Chip(
//       label: Text(
//         label,
//         style: TextStyle(
//           color: _getTextColor(color),
//           fontSize: 12,
//         ),
//       ),
//       backgroundColor: color,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: EdgeInsets.zero,
//       labelPadding: const EdgeInsets.symmetric(horizontal: 8),
//     );
//   }

//   Color _getDiseaseColor(String severity) {
//     switch (severity.toLowerCase()) {
//       case 'low':
//         return Colors.green;
//       case 'moderate':
//         return Colors.orange;
//       case 'high':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }

//   Color _getSeverityColor(String severity) {
//     switch (severity.toLowerCase()) {
//       case 'low':
//         return Colors.green[100]!;
//       case 'moderate':
//         return Colors.orange[100]!;
//       case 'high':
//         return Colors.red[100]!;
//       default:
//         return Colors.grey[100]!;
//     }
//   }

//   Color _getConfidenceColor(String confidence) {
//     final percent = int.tryParse(confidence.replaceAll('%', '')) ?? 0;
//     if (percent >= 90) return Colors.green;
//     if (percent >= 70) return Colors.orange;
//     return Colors.red;
//   }

//   Color _getIconColor(Color backgroundColor) {
//     return backgroundColor.computeLuminance() > 0.5 ? Colors.black54 : Colors.white;
//   }

//   Color _getTextColor(Color backgroundColor) {
//     return backgroundColor.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;
//   }

// void _saveReport(context) async {
//   try {
//     final storage = StorageService();
//     await storage.saveScan(ScanHistory(
//       disease: diseaseData.disease,
//       confidence: diseaseData.confidence,
//       scanDate: DateTime.now(),
//       imagePath: imagePath,
//     ));
    
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Report saved to history'),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
    
//     // Navigate back to home with result
//     Navigator.pop(context, true);
//   } catch (e) {
//     if (kDebugMode) {
//       print('Error saving scan: $e');
//     }
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Failed to save report'),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }
// }


//   void _saveToBookmarks(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Added to bookmarks'),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }

//   void _shareResults(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Sharing results...'),
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/disease_model.dart';

class AnalysisScreen extends StatelessWidget {
  final String imagePath;
  final bool isFromCamera;
  final DiseaseData diseaseData;

  const AnalysisScreen({
    super.key,
    required this.imagePath,
    required this.isFromCamera,
    required this.diseaseData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text('Analysis Results',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black54),
            onPressed: () => _shareResults(context),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.black54),
            onPressed: () => _saveToBookmarks(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImagePreview(),
            _buildDiagnosisCard(context),
            _buildSectionTitle('Symptoms', Icons.warning_amber_outlined),
            _buildSymptomsList(),
            _buildSectionTitle('Recommendations', Icons.medical_services_outlined),
            _buildRecommendationsList(),
            _buildAdditionalInfo(),
            _buildSaveButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Stack(
        children: [
           Center(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                // Fallback if image fails to load
                return Image.asset(
                  'assets/leaf_spot_example.jpg',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isFromCamera ? 'Photo' : 'From Gallery',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildDiagnosisCard(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _getDiseaseColor(diseaseData.severity),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.health_and_safety, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diseaseData.disease,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    diseaseData.scientificName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Chip(
                label: Text(
                  diseaseData.confidence,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12, // Reduced font size if needed
                  ),
                ),
                backgroundColor: _getConfidenceColor(diseaseData.confidence),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          diseaseData.description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildInfoChip('Severity: ${diseaseData.severity}',
                  _getSeverityColor(diseaseData.severity)),
              const SizedBox(width: 8),
              _buildInfoChip(diseaseData.treatment, Colors.blue[100]!),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymptomsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: diseaseData.symptoms
            .map((symptom) => _buildListTile(symptom, Colors.orange[50]!))
            .toList(),
      ),
    );
  }

  Widget _buildRecommendationsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: diseaseData.recommendations
            .map((recommendation) => _buildListTile(recommendation, Colors.green[50]!))
            .toList(),
      ),
    );
  }

  Widget _buildListTile(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check_circle_outline,
            color: _getIconColor(color),
            size: 20,
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
        minLeadingWidth: 0,
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Additional Information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Season', 'Rainy season', Icons.calendar_today),
          _buildInfoRow('Affected Parts', 'Leaves', Icons.grass),
          _buildInfoRow('Spread', 'Airborne spores', Icons.air),
          _buildInfoRow('Prevention', 'Proper spacing', Icons.health_and_safety),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _saveReport(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text('Save Report to History'),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: _getTextColor(color),
          fontSize: 12,
        ),
      ),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Color _getDiseaseColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'moderate':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'low':
        return Colors.green[100]!;
      case 'moderate':
        return Colors.orange[100]!;
      case 'high':
        return Colors.red[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  Color _getConfidenceColor(String confidence) {
    final percent = int.tryParse(confidence.replaceAll('%', '')) ?? 0;
    if (percent >= 90) return Colors.green;
    if (percent >= 70) return Colors.orange;
    return Colors.red;
  }

  Color _getIconColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black54 : Colors.white;
  }

  Color _getTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;
  }

  void _saveReport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Report saved to history'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _saveToBookmarks(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to bookmarks'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareResults(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sharing results...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}