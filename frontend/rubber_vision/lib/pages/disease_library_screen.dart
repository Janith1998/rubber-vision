import 'package:flutter/material.dart';

class DiseaseLibraryScreen extends StatelessWidget {
  const DiseaseLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Disease Library',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildSectionTitle('Common Rubber Tree Diseases'),
              const SizedBox(height: 12),
              _buildDiseaseList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search diseases...',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87));
  }

  Widget _buildDiseaseList() {
    final diseases = [
      {
        'name': 'Corynespora Leaf Fall',
        'scientificName': 'Corynespora cassiicola',
        'severity': 'High',
        'color': Colors.red[400]!,
        'icon': Icons.warning_amber,
        'description': 'A serious fungal disease causing circular to irregular leaf spots with concentric rings, leading to premature defoliation.',
        'symptoms': [
          'Large irregular brown spots (1-5 cm diameter)',
          'Yellow halos around lesions',
          'Premature leaf fall',
          'Black fungal spores visible under microscope'
        ],
        'management': [
          'Fungicides containing mancozeb or chlorothalonil',
          'Remove and destroy infected leaves',
          'Improve air circulation in plantations',
          'Avoid overhead irrigation'
        ]
      },
      {
        'name': 'Bird\'s Eye Spot',
        'scientificName': 'Helminthosporium heveae',
        'severity': 'Moderate',
        'color': Colors.orange[400]!,
        'icon': Icons.warning,
        'description': 'Characterized by small circular spots resembling bird eyes, affecting leaf photosynthetic efficiency.',
        'symptoms': [
          'Small circular spots (2-5mm)',
          'Dark brown margins with gray centers',
          'Spots may coalesce in severe cases',
          'Most common in young leaves'
        ],
        'management': [
          'Copper-based fungicides',
          'Proper spacing between trees',
          'Balanced fertilization',
          'Regular monitoring'
        ]
      },
      {
        'name': 'Powdery Mildew',
        'scientificName': 'Oidium heveae',
        'severity': 'Moderate',
        'color': Colors.blue[400]!,
        'icon': Icons.cloud,
        'description': 'White powdery fungal growth on leaf surfaces, more prevalent in dry weather with high humidity.',
        'symptoms': [
          'White powdery patches on leaves',
          'Leaf curling and distortion',
          'Reduced latex yield',
          'Young leaves more susceptible'
        ],
        'management': [
          'Sulfur-based fungicides',
          'Avoid dense planting',
          'Remove severely infected leaves',
          'Maintain proper tree nutrition'
        ]
      },
      {
        'name': 'Phytophthora Leaf Fall',
        'scientificName': 'Phytophthora spp.',
        'severity': 'High',
        'color': Colors.purple[400]!,
        'icon': Icons.water_drop,
        'description': 'Water mold causing rapid leaf fall during wet conditions, can lead to significant yield loss.',
        'symptoms': [
          'Dark, water-soaked lesions',
          'Rapid leaf shedding during rains',
          'Blackened leaf veins',
          'Twig dieback in severe cases'
        ],
        'management': [
          'Phosphorous acid fungicides',
          'Improve drainage in plantations',
          'Remove infected plant material',
          'Avoid wounding trees'
        ]
      },
      {
        'name': 'Colletotrichum Leaf Spot',
        'scientificName': 'Colletotrichum gloeosporioides',
        'severity': 'Moderate',
        'color': Colors.green[400]!,
        'icon': Icons.grass,
        'description': 'Fungal disease causing anthracnose symptoms, particularly problematic in rainy seasons.',
        'symptoms': [
          'Irregular brown leaf spots',
          'Yellow halos around lesions',
          'Black fruiting bodies in centers',
          'Twig dieback in severe infections'
        ],
        'management': [
          'Fungicides containing azoxystrobin',
          'Prune affected branches',
          'Avoid overhead irrigation',
          'Maintain proper tree spacing'
        ]
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: diseases.length,
      itemBuilder: (context, index) {
        final disease = diseases[index];
        return _buildDiseaseCard(
          context,
          name: disease['name'] as String,
          scientificName: disease['scientificName'] as String,
          severity: disease['severity'] as String,
          color: disease['color'] as Color,
          icon: disease['icon'] as IconData,
          description: disease['description'] as String,
          symptoms: disease['symptoms'] as List<String>,
          management: disease['management'] as List<String>,
        );
      },
    );
  }

  Widget _buildDiseaseCard(
    BuildContext context, {
    required String name,
    required String scientificName,
    required String severity,
    required Color color,
    required IconData icon,
    required String description,
    required List<String> symptoms,
    required List<String> management,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDiseaseDetails(
          context,
          name: name,
          scientificName: scientificName,
          severity: severity,
          color: color,
          description: description,
          symptoms: symptoms,
          management: management,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      scientificName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Chip(
                      label: Text(
                        severity,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  void _showDiseaseDetails(
    BuildContext context, {
    required String name,
    required String scientificName,
    required String severity,
    required Color color,
    required String description,
    required List<String> symptoms,
    required List<String> management,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getDiseaseIcon(name),
                      color: color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          scientificName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    label: Text(
                      severity,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: color,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _buildDetailSection('Symptoms', Icons.warning_amber, symptoms),
              const SizedBox(height: 24),
              _buildDetailSection('Management', Icons.medical_services, management),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, IconData icon, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4, right: 8),
                child: Icon(Icons.circle, size: 8, color: Colors.grey),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  IconData _getDiseaseIcon(String name) {
    switch (name) {
      case 'Corynespora Leaf Fall':
        return Icons.warning_amber;
      case 'Bird\'s Eye Spot':
        return Icons.remove_red_eye;
      case 'Powdery Mildew':
        return Icons.cloud;
      case 'Phytophthora Leaf Fall':
        return Icons.water_drop;
      case 'Colletotrichum Leaf Spot':
        return Icons.grass;
      default:
        return Icons.warning;
    }
  }
}