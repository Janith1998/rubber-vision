<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rubber Vision - Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
   
    <link rel="stylesheet" href="https://unpkg.com/leaflet.heat@0.2.0/dist/leaflet-heat.css" />
    <style>
        :root {
            --primary: #6c5ce7;
            --primary-dark: #5649c0;
            --secondary: #00cec9;
            --dark: #2d3436;
            --light: #f5f6fa;
            --gray: #dfe6e9;
            --success: #00b894;
            --warning: #fdcb6e;
            --danger: #d63031;
            --sidebar-width: 260px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: #f8fafc;
            color: #333;
            overflow-x: hidden;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: white;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: fixed;
            height: 100vh;
            z-index: 100;
        }

        .sidebar-header {
            padding: 20px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid var(--gray);
        }

        .sidebar-header h2 {
            color: var(--primary);
            font-size: 1.5rem;
            margin-left: 10px;
        }

        .sidebar-logo {
            width: 40px;
            height: 40px;
            background-color: var(--primary);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .menu-title {
            padding: 0 20px 10px;
            font-size: 0.75rem;
            text-transform: uppercase;
            color: #94a3b8;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: #64748b;
            text-decoration: none;
            transition: all 0.2s;
            border-left: 3px solid transparent;
        }

        .menu-item:hover {
            background-color: #f1f5f9;
            color: var(--primary);
        }

        .menu-item.active {
            background-color: #f8fafc;
            border-left: 3px solid var(--primary);
            color: var(--primary);
            font-weight: 500;
        }

        .menu-item i {
            margin-right: 12px;
            font-size: 1.1rem;
            width: 20px;
            text-align: center;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            transition: all 0.3s ease;
        }

        .topbar {
            background: white;
            padding: 15px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .search-bar {
            position: relative;
            width: 300px;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid var(--gray);
            border-radius: 8px;
            outline: none;
            transition: all 0.3s;
            font-size: 0.9rem;
        }

        .search-bar input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(108, 92, 231, 0.1);
        }

        .search-bar i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }

        .user-actions {
            display: flex;
            align-items: center;
        }

        .notification-icon, .user-profile {
            margin-left: 20px;
            cursor: pointer;
            position: relative;
        }

        .notification-icon i {
            font-size: 1.2rem;
            color: #64748b;
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--danger);
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.6rem;
            font-weight: bold;
        }

        .user-profile img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
        }

       
        .content {
            padding: 25px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .page-title h1 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1e293b;
        }

        .page-title p {
            color: #64748b;
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .btn {
            padding: 10px 16px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            font-size: 0.9rem;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
        }

       
        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 25px;
        }

       
        .map-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            padding: 20px;
            height: 500px;
        }

        .map-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .map-header h3 {
            font-size: 1.2rem;
            color: #1e293b;
        }

        .map-controls {
            display: flex;
            gap: 10px;
        }

        .map-controls select {
            padding: 8px 12px;
            border-radius: 6px;
            border: 1px solid var(--gray);
            font-size: 0.9rem;
        }

        #sri-lanka-map {
            height: 400px;
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
        }

     
        .stats-panel {
            background: white;
            border-radius: 10px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            padding: 20px;
            height: 500px;
        }

        .stats-header {
            margin-bottom: 15px;
        }

        .stats-header h3 {
            font-size: 1.2rem;
            color: #1e293b;
        }

        .stat-cards {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 20px;
        }

        .stat-card {
            background: #f8fafc;
            border-radius: 8px;
            padding: 15px;
            border-left: 4px solid var(--primary);
        }

        .stat-card h4 {
            font-size: 0.9rem;
            color: #64748b;
            margin-bottom: 10px;
        }

        .stat-card .value {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1e293b;
        }

        .stat-card .change {
            font-size: 0.8rem;
            margin-top: 5px;
            display: flex;
            align-items: center;
        }

        .change.positive {
            color: var(--success);
        }

        .change.negative {
            color: var(--danger);
        }

        .change i {
            margin-right: 5px;
        }

       
        .heatmap-legend {
            background: white;
            padding: 10px 15px;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            line-height: 1.4;
            font-size: 0.8rem;
        }

        .heatmap-legend h4 {
            margin-bottom: 5px;
            font-weight: 600;
        }

        .legend-scale {
            display: flex;
            margin-bottom: 5px;
        }

        .legend-label {
            flex: 1;
            text-align: center;
        }

        .legend-gradient {
            height: 10px;
            width: 100%;
            background: linear-gradient(to right, #ffffcc, #ffeda0, #fed976, #feb24c, #fd8d3c, #fc4e2a, #e31a1c, #bd0026, #800026);
            border-radius: 3px;
            margin-bottom: 5px;
        }

        
        .chart-container {
            height: 250px;
            margin-top: 20px;
            position: relative;
        }

        @media (max-width: 1200px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .main-content {
                margin-left: 0;
            }
            .search-bar {
                width: 200px;
            }
            .stat-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard">
       
        <div class="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">RV</div>
                <h2>Rubber Vision</h2>
            </div>
            
            <div class="sidebar-menu">
                <p class="menu-title">Main</p>
                <a href="#" class="menu-item active" onclick="showPanel('dashboard-panel')">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                
                <p class="menu-title">Management</p>
                <a href="#" class="menu-item" onclick="showPanel('products-panel')">
                    <i class="fas fa-box-open"></i>
                    <span>Products</span>
                </a>
                <a href="#" class="menu-item" onclick="showPanel('orders-panel')">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Orders</span>
                </a>
                <a href="#" class="menu-item" onclick="showPanel('customers-panel')">
                    <i class="fas fa-users"></i>
                    <span>Customers</span>
                </a>
                
                <p class="menu-title">Settings</p>
                <a href="#" class="menu-item" onclick="showPanel('settings-panel')">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </a>
                <a href="#" class="menu-item" onclick="showPanel('reports-panel')">
                    <i class="fas fa-chart-bar"></i>
                    <span>Reports</span>
                </a>
            </div>
        </div>

        
        <div class="main-content">
          
            <div class="topbar">
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search...">
                </div>
                
                <div class="user-actions">
                    <div class="notification-icon">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </div>
                    <div class="user-profile">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="User">
                    </div>
                </div>
            </div>

           
            <div class="content">
                <div class="page-header">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                        <p>Rubber production heatmap and analytics</p>
                    </div>
                    <button class="btn btn-primary">
                        <i class="fas fa-download"></i> Export Report
                    </button>
                </div>

               
                <div id="dashboard-panel" class="panel active">
                    <div class="dashboard-grid">
                    <div class="stats-panel">
                            <div class="stats-header">
                                <h3>Production Analytics</h3>
                            </div>
                            
                            <div class="stat-cards">
                                <div class="stat-card">
                                    <h4>Total Production</h4>
                                    <div class="value">82,450 MT</div>
                                    <div class="change positive">
                                        <i class="fas fa-arrow-up"></i> 12.5% from last season
                                    </div>
                                </div>
                                <div class="stat-card">
                                    <h4>Avg. Yield</h4>
                                    <div class="value">1,240 kg/ha</div>
                                    <div class="change positive">
                                        <i class="fas fa-arrow-up"></i> 4.3% improvement
                                    </div>
                                </div>
                                <div class="stat-card">
                                    <h4>Active Plantations</h4>
                                    <div class="value">1,842</div>
                                    <div class="change negative">
                                        <i class="fas fa-arrow-down"></i> 2.1% decrease
                                    </div>
                                </div>
                                <div class="stat-card">
                                    <h4>Export Value</h4>
                                    <div class="value">$214M</div>
                                    <div class="change positive">
                                        <i class="fas fa-arrow-up"></i> 8.7% increase
                                    </div>
                                </div>
                            </div>
                            
                            <div class="heatmap-legend">
                                <h4>Heatmap Intensity Legend</h4>
                                <div class="legend-gradient"></div>
                                <div class="legend-scale">
                                    <span class="legend-label">Low</span>
                                    <span class="legend-label">Medium</span>
                                    <span class="legend-label">High</span>
                                </div>
                            </div>
                            
                            <div class="chart-container">
                                
                                <p style="text-align: center; margin-top: 100px; color: #94a3b8;">
                                    [Seasonal Production Trend Chart Would Appear Here]
                                </p>
                            </div>
                        </div>
   <!-- dsjd -->

                        <div class="map-container">
                            <div class="map-header">
                                <h3>Sri Lanka Rubber Production Heatmap</h3>
                                <div class="map-controls">
                                    <select id="map-layer">
                                        <option value="production">Production Volume</option>
                                        <option value="yield">Yield per Hectare</option>
                                        <option value="quality">Quality Index</option>
                                    </select>
                                    <select id="time-period">
                                        <option value="current">Current Season</option>
                                        <option value="last">Last Season</option>
                                        <option value="5year">5-Year Average</option>
                                    </select>
                                </div>
                            </div>
                            <div id="sri-lanka-map"></div>
                        </div>

                     
                       

                        <!-- end -->
                    </div>
                    
                   
                </div>

                
            </div>
        </div>
    </div>

    
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    
    <script src="https://unpkg.com/leaflet.heat@0.2.0/dist/leaflet-heat.js"></script>
    <script>
        // Sri Lanka approximate bounds
        const sriLankaBounds = L.latLngBounds(
            L.latLng(5.919, 79.521), // SW
            L.latLng(9.835, 81.879)  // NE
        );

        // Initialize the map
        let map;
        let heatLayer;
        let sriLankaLayer;

        function initMap() {
            // Create map centered on Sri Lanka
            map = L.map('sri-lanka-map', {
                maxBounds: sriLankaBounds,
                maxBoundsViscosity: 1.0,
                minZoom: 7,
                maxZoom: 12
            }).setView([7.8731, 80.7718], 7);
            
            // Add base tile layer
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);
            
            // Add Sri Lanka boundary
            fetch('https://raw.githubusercontent.com/CodeForAfrica/Country-Boundaries/master/geojson/sri-lanka.geojson')
                .then(response => response.json())
                .then(data => {
                    sriLankaLayer = L.geoJSON(data, {
                        style: {
                            color: '#333',
                            weight: 2,
                            opacity: 1,
                            fillOpacity: 0.1
                        }
                    }).addTo(map);
                });
            
            // Load disease reports (in a real app, this would come from your API)
            loadDiseaseReports();
            
            // Prevent zooming out beyond Sri Lanka
            map.on('drag', function() {
                map.panInsideBounds(sriLankaBounds, { animate: false });
            });
        }
        
        // Sample disease report data (replace with your actual data)
        function getSampleReports() {
            return [
                // Format: [lat, lng, intensity, disease_type]
                [6.9271, 79.8612, 0.8, 'leaf_spot'],    // Colombo
                [7.2964, 80.6350, 0.6, 'powdery_mildew'], // Kandy
                [6.0535, 80.2207, 0.7, 'root_rot'],      // Galle
                [8.3114, 80.4037, 0.9, 'leaf_spot'],      // Anuradhapura
                [6.7056, 80.3847, 0.5, 'other'],         // Ratnapura
                [7.4675, 80.6234, 0.4, 'powdery_mildew'], // Matale
                [6.1248, 81.1185, 0.2, 'leaf_spot'],     // Hambantota
                [7.2510, 81.6747, 0.6, 'root_rot'],      // Batticaloa
                [7.9403, 81.0189, 0.5, 'other']           // Polonnaruwa
            ];
        }
        
        // Load disease reports and create heatmap
        function loadDiseaseReports(filterDays = 30, diseaseType = 'all') {
            // In a real app, you would fetch this from your backend API
            // const response = await fetch(`/api/disease-reports?days=${filterDays}&type=${diseaseType}`);
            // const reports = await response.json();
            
            // For now, we'll use sample data
            const allReports = getSampleReports();
            
            // Filter reports based on selected filters
            const filteredReports = allReports.filter(report => {
                // In real app, you would filter by date and disease type
                return true;
            });
            
            // Prepare heatmap data (lat, lng, intensity)
            const heatData = filteredReports.map(report => [report[0], report[1], report[2]]);
            
            // Clear existing heat layer if it exists
            if (heatLayer) {
                map.removeLayer(heatLayer);
            }
            
            // Create new heat layer
            heatLayer = L.heatLayer(heatData, {
                radius: 25,
                blur: 15,
                maxZoom: 12,
                max: 1.0,
                gradient: {
                    0.3: 'rgba(33, 150, 243, 0.4)',
                    0.6: 'rgba(255, 152, 0, 0.7)',
                    1.0: 'rgba(244, 67, 54, 0.9)'
                }
            }).addTo(map);
            
            // Add markers for each report (with disease type info)
            filteredReports.forEach(report => {
                const diseaseColor = getDiseaseColor(report[3]);
                L.circleMarker([report[0], report[1]], {
                    radius: 8,
                    fillColor: diseaseColor,
                    color: '#fff',
                    weight: 1,
                    opacity: 1,
                    fillOpacity: 0.8
                }).addTo(map)
                .bindPopup(`
                    <b>Disease Report</b><br>
                    Type: ${formatDiseaseName(report[3])}<br>
                    Location: ${report[0].toFixed(4)}, ${report[1].toFixed(4)}<br>
                    Intensity: ${Math.round(report[2] * 100)}%
                `);
            });
        }
        
        // Helper functions
        function getDiseaseColor(diseaseType) {
            switch(diseaseType) {
                case 'leaf_spot': return '#ff5252';
                case 'powdery_mildew': return '#ff9800';
                case 'root_rot': return '#9c27b0';
                default: return '#607d8b';
            }
        }
        
        function formatDiseaseName(diseaseType) {
            switch(diseaseType) {
                case 'leaf_spot': return 'Leaf Spot';
                case 'powdery_mildew': return 'Powdery Mildew';
                case 'root_rot': return 'Root Rot';
                default: return 'Other';
            }
        }
        
        // Initialize the map when the page loads
        document.addEventListener('DOMContentLoaded', initMap);
        
        // Filter button event listener
        document.getElementById('apply-filters').addEventListener('click', function() {
            const days = document.getElementById('time-filter').value;
            const diseaseType = document.getElementById('disease-filter').value;
            loadDiseaseReports(days, diseaseType);
        });
        
        // Panel navigation function
        function showPanel(panelId) {
            // Hide all panels
            document.querySelectorAll('.panel').forEach(panel => {
                panel.classList.remove('active');
            });
            
            // Show selected panel
            document.getElementById(panelId).classList.add('active');
            
            // Update active menu item
            document.querySelectorAll('.menu-item').forEach(item => {
                item.classList.remove('active');
            });
            event.currentTarget.classList.add('active');
        }
    </script>
    
  
</body>
</html>