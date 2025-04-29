import 'package:flutter/material.dart';

class CareGuideScreen extends StatelessWidget {
  const CareGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Rubber Tree Care Guide',
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
              const SizedBox(height: 24),
              _buildSectionTitle('Essential Care Practices'),
              const SizedBox(height: 12),
              _buildCareCategories(context),
              const SizedBox(height: 24),
              _buildSectionTitle('Seasonal Maintenance'),
              const SizedBox(height: 12),
              _buildSeasonalGuide(),
              const SizedBox(height: 16), // Added extra space at bottom
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
          hintText: 'Search care tips...',
          prefixIcon:  Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

  Widget _buildCareCategories(BuildContext context) {
    final categories = [
      {
        'title': 'Tapping',
        'icon': Icons.opacity,
        'color': Colors.blue[400]!,
        'items': [
          'Use half-spiral downward tapping system',
          'Tap at 30° angle with proper bark consumption',
          'Maintain 1/2" depth for optimal latex flow',
          'Rest trees during wintering period'
        ]
      },
      {
        'title': 'Fertilization',
        'icon': Icons.grass,
        'color': Colors.green[400]!,
        'items': [
          'Apply NPK 12-6-6 at 3kg/tree/year',
          'Use organic manure (5kg/tree) annually',
          'Micronutrients (Zn, Mg) for high-yield clones',
          'Fertilize after rains for better absorption'
        ]
      },
      {
        'title': 'Pruning',
        'icon': Icons.content_cut,
        'color': Colors.orange[400]!,
        'items': [
          'Remove low branches below 2m height',
          'Prune dead/diseased wood promptly',
          'Maintain single stem for first 3 years',
          'Use sterilized tools to prevent disease'
        ]
      },
      {
        'title': 'Pest Control',
        'icon': Icons.bug_report,
        'color': Colors.red[400]!,
        'items': [
          'Monitor for termites (especially in young trees)',
          'Use neem oil for leaf-eating caterpillars',
          'Biological controls for mites',
          'Avoid broad-spectrum insecticides'
        ]
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _buildCategoryCard(
          context: context,
          title: category['title'] as String,
          icon: category['icon'] as IconData,
          color: category['color'] as Color,
          items: category['items'] as List<String>,
        );
      },
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required List<String> items,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showCategoryDetails(
          context,
          title: title,
          icon: icon,
          color: color,
          items: items,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // ignore: deprecated_member_use
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${items.length} key practices',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeasonalGuide() {
    final seasons = [
      {
        'season': 'Pre-Winter (Oct-Nov)',
        'tasks': [
          'Reduce tapping frequency',
          'Apply potassium-rich fertilizers',
          'Prepare windbreaks for cold spells',
          'Check irrigation systems'
        ],
        'color': Colors.amber[200]!
      },
      {
        'season': 'Wintering (Dec-Feb)',
        'tasks': [
          'Complete tapping rest (6-8 weeks)',
          'Prune dead/diseased branches',
          'Apply organic mulch',
          'Monitor for frost damage'
        ],
        'color': Colors.blue[200]!
      },
      {
        'season': 'Pre-Rainy (Mar-Apr)',
        'tasks': [
          'Resume gradual tapping',
          'Apply balanced NPK fertilizer',
          'Prepare drainage systems',
          'Monitor new leaf development'
        ],
        'color': Colors.green[200]!
      },
      {
        'season': 'Rainy Season (May-Sep)',
        'tasks': [
          'Maintain regular tapping schedule',
          'Monitor for fungal diseases',
          'Ensure proper drainage',
          'Apply micronutrients if needed'
        ],
        'color': Colors.purple[200]!
      },
    ];

    return SizedBox(
      height: 260, // Increased height to accommodate content
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: seasons.length,
        itemBuilder: (context, index) {
          final season = seasons[index];
          return Container(
            width: 240, // Slightly wider to accommodate text
            margin: EdgeInsets.only(
              right: index == seasons.length - 1 ? 0 : 12,
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: season['color'] as Color,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView( // Added scroll for overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        season['season'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...(season['tasks'] as List<String>).map((task) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle, size: 16, color: Colors.black54),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                task,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCategoryDetails(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required List<String> items,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
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
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle, size: 8, color: color),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          items[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Close', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}