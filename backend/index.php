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
    <link rel="stylesheet" href="style.css">
    
    
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
                <a href="#" class="menu-item active" onclick="loadPanel('dashboard-panel', null,event)">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
                
                <p class="menu-title">Management</p>
                <a href="#" class="menu-item" onclick="loadPanel('Disease-panel', './panels/disease.php', event)">
                    <i class="fas fa-box-open"></i>
                    <span>Disease Library</span>
                </a>
                <a href="#" class="menu-item" onclick="loadPanel('customers-panel' , './panels/customers.php', event)">
                    <i class="fas fa-users"></i>
                    <span>Customers</span>
                </a>
                
                <p class="menu-title">Settings</p>
                <a href="#" class="menu-item" onclick="loadPanel('settings-panel', './panels/settings.php', event)">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </a>
                <a href="#" class="menu-item" onclick="loadPanel('reports-panel')">
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
                            
                            
                        </div>
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
                    </div> 
                </div>

                 <!-- end -->
                    <div id="Disease-panel" class="panel"></div>
                    <div id="orders-panel" class="panel"></div>
                    <div id="customers-panel" class="panel"></div>
                    <div id="settings-panel" class="panel"></div>
                    <div id="reports-panel" class="panel"></div>
                
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
 function loadPanel(panelId, url = null, event = null) {
            // Hide all panels
            document.querySelectorAll('.panel').forEach(panel => {
                panel.classList.remove('active');
            });

    // Show selected panel
    const panel = document.getElementById(panelId);
    if (!panel) {
        console.error(`Panel with ID ${panelId} not found`);
        return;
    }
    panel.classList.add('active');

    // Update active sidebar menu item
    document.querySelectorAll('.menu-item').forEach(item => {
        item.classList.remove('active');
    });

    if (event) {
        event.currentTarget.classList.add('active');
    }

    // Load content dynamically if URL is provided
    if (url) {
        fetch(url)
            .then(response => response.text())
            .then(html => {
                panel.innerHTML = html;
            })
            .catch(error => {
                console.error('Error loading panel:', error);
                panel.innerHTML = '<div class="error-message">Failed to load content. Please try again.</div>';
            });
    }
}


    </script>
    
  
</body>
</html>