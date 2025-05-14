<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        /* CSS styles for the dashboard */
        .dashboard {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 200px;
            background: #f1f1f1;
            padding: 20px;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .panel {
            display: none;
            background: #fff;
            padding: 20px;
            margin-bottom: 20px;
        }

        .active {
            display: block;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="sidebar">
            <h2>Menu</h2>
            <ul>
                <li><a href="#" onclick="togglePanel('panel1')">Panel 1</a></li>
                <li><a href="#" onclick="togglePanel('panel2')">Panel 2</a></li>
                <li><a href="#" onclick="togglePanel('panel3')">Panel 3</a></li>
            </ul>
        </div>
        <div class="content">
            <div id="panel1" class="panel active">
                <h2>Panel 1</h2>
                <p>This is the content of Panel 1.</p>
            </div>
            <div id="panel2" class="panel">
                <h2>Panel 2</h2>
                <p>This is the content of Panel 2.</p>
            </div>
            <div id="panel3" class="panel">
                <h2>Panel 3</h2>
                <p>This is the content of Panel 3.</p>
            </div>
        </div>
    </div>

    <script>
        function togglePanel(panelId) {
            var panel = document.getElementById(panelId);
            panel.classList.toggle('active');
        }
    </script>
</body>
</html>