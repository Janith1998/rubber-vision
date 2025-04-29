class ScanHistory {
  final String disease;
  final String confidence;
  final DateTime scanDate;
  final String? imagePath; 
  ScanHistory({
    required this.disease,
    required this.confidence,
    required this.scanDate,
    this.imagePath,
  });

  // Convert to/from JSON for storage
  Map<String, dynamic> toJson() => {
    'disease': disease,
    'confidence': confidence,
    'scanDate': scanDate.toIso8601String(),
    'imagePath': imagePath,
  };

  factory ScanHistory.fromJson(Map<String, dynamic> json) => ScanHistory(
    disease: json['disease'],
    confidence: json['confidence'],
    scanDate: DateTime.parse(json['scanDate']),
    imagePath: json['imagePath'],
  );
}