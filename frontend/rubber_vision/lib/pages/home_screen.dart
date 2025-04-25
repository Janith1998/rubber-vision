import 'package:flutter/material.dart';
import 'camera_screen.dart'; // We'll create this next

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: _buildBody(context),
      floatingActionButton: _buildScanButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Rubber Vision', 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
      backgroundColor: Colors.white,
      elevation: 1,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.black54),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(),
            const SizedBox(height: 24),
            _buildSectionTitle('Quick Actions'),
            const SizedBox(height: 12),
            _buildActionGrid(context),
            const SizedBox(height: 24),
            _buildSectionTitle('Recent Scans'),
            const SizedBox(height: 12),
            _buildRecentScans(),
          ],
        ),
      ),
    );
  }

Widget _buildWelcomeCard() {
  return Card(
    elevation: 0,
    color: Colors.deepPurple[50], // ✅ correct place
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding( // ✅ correct place
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Farmer!', 
                    style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[800])),
                const SizedBox(height: 8),
                Text(
                  'Scan your rubber trees to detect diseases early and protect your yield.',
                  style: TextStyle(color: Colors.deepPurple[600]),
                ),
              ],
            ),
          ),
          const Icon(Icons.spa, size: 48, color: Colors.deepPurple),
        ],
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

  Widget _buildActionGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: [
        _buildActionItem(
          context,
          icon: Icons.photo_library_outlined,
          color: Colors.blue[400]!,
          label: 'Upload Image',
          onTap: () => _navigateToCameraScreen(context, fromGallery: true),
        ),
        _buildActionItem(
          context,
          icon: Icons.insights,
          color: Colors.green[400]!,
          label: 'Disease Library',
          onTap: () {}, // Navigate to library
        ),
        _buildActionItem(
          context,
          icon: Icons.local_fire_department,
          color: Colors.orange[400]!,
          label: 'Hotspot Alerts',
          onTap: () {}, // Navigate to alerts
        ),
        _buildActionItem(
          context,
          icon: Icons.article_outlined,
          color: Colors.purple[400]!,
          label: 'Care Guide',
          onTap: () {}, // Navigate to guide
        ),
      ],
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
  elevation: 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ), // <- this closing parenthesis was missing
  child: InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  ),
);

  }

  Widget _buildRecentScans() {
    // Placeholder - replace with your actual scan history
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildScanCard('Leaf Spot', '2 days ago', Colors.orange),
          _buildScanCard('Healthy', '1 week ago', Colors.green),
          _buildScanCard('Powdery Mildew', '2 weeks ago', Colors.blue),
        ],
      ),
    );
  }

  Widget _buildScanCard(String result, String date, Color color) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(result,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            Text(date,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildScanButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _navigateToCameraScreen(context),
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.camera_alt, size: 28),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      height: 70,
      padding: EdgeInsets.zero,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home_filled, size: 28),
            onPressed: () {},
            color: Colors.deepPurple,
          ),
          IconButton(
            icon: const Icon(Icons.history, size: 28),
            onPressed: () {},
            color: Colors.grey,
          ),
          const SizedBox(width: 48), // Space for FAB
          IconButton(
            icon: const Icon(Icons.map_outlined, size: 28),
            onPressed: () {},
            color: Colors.grey,
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, size: 28),
            onPressed: () {},
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  void _navigateToCameraScreen(BuildContext context, {bool fromGallery = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(fromGallery: fromGallery),
      ),
    );
  }
}