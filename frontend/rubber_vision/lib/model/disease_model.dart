class DiseaseData {
  final String disease;
  final String confidence;
  final String scientificName;
  final String description;
  final List<String> symptoms;
  final List<String> recommendations;
  final String severity;
  final String treatment;

  DiseaseData({
    required this.disease,
    required this.confidence,
    required this.scientificName,
    required this.description,
    required this.symptoms,
    required this.recommendations,
    required this.severity,
    required this.treatment,
  });
}