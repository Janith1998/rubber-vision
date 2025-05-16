<div class="settings-panel">
    <div class="settings-header">
        <h2><i class="fas fa-cog"></i> Settings</h2>
        <p>Configure your application preferences</p>
    </div>

    <div class="settings-container">
        <!-- Navigation Sidebar -->
        <div class="settings-sidebar">
            <div class="sidebar-item active" data-tab="general">
                <i class="fas fa-sliders-h"></i>
                <span>General</span>
            </div>
            <div class="sidebar-item" data-tab="notifications">
                <i class="fas fa-bell"></i>
                <span>Notifications</span>
            </div>
            <div class="sidebar-item" data-tab="appearance">
                <i class="fas fa-palette"></i>
                <span>Appearance</span>
            </div>
            <div class="sidebar-item" data-tab="account">
                <i class="fas fa-user"></i>
                <span>Account</span>
            </div>
            <div class="sidebar-item" data-tab="privacy">
                <i class="fas fa-lock"></i>
                <span>Privacy</span>
            </div>
        </div>

        <!-- Settings Content -->
        <div class="settings-content">
            <!-- General Settings -->
            <div class="settings-tab active" id="general-tab">
                <h3><i class="fas fa-sliders-h"></i> General Settings</h3>
                
                <div class="setting-item">
                    <div class="setting-info">
                        <h4>Language</h4>
                        <p>Select your preferred language</p>
                    </div>
                    <div class="setting-control">
                        <select class="modern-select">
                            <option>English</option>
                            <option>Spanish</option>
                            <option>French</option>
                            <option>German</option>
                        </select>
                    </div>
                </div>
                
                <div class="setting-item">
                    <div class="setting-info">
                        <h4>Default View</h4>
                        <p>Choose how you want the dashboard to appear</p>
                    </div>
                    <div class="setting-control">
                        <div class="toggle-group">
                            <button class="toggle-btn active">Grid</button>
                            <button class="toggle-btn">List</button>
                            <button class="toggle-btn">Compact</button>
                        </div>
                    </div>
                </div>
                
                <div class="setting-item">
                    <div class="setting-info">
                        <h4>Auto-refresh Data</h4>
                        <p>Automatically refresh data every 5 minutes</p>
                    </div>
                    <div class="setting-control">
                        <label class="switch">
                            <input type="checkbox" checked>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>
            </div>

            <!-- Notifications Settings -->
            <div class="settings-tab" id="notifications-tab">
                <h3><i class="fas fa-bell"></i> Notification Settings</h3>
                
                <div class="setting-item">
                    <div class="setting-info">
                        <h4>Email Notifications</h4>
                        <p>Receive important updates via email</p>
                    </div>
                    <div class="setting-control">
                        <label class="switch">
                            <input type="checkbox" checked>
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>
                
                <div class="setting-item">
                    <div class="setting-info">
                        <h4>Push Notifications</h4>
                        <p>Get instant alerts on your device</p>
                    </div>
                    <div class="setting-control">
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>
                
                <div class="setting-item">
                    <div class="setting-info">
                        <h4>Alert Frequency</h4>
                        <p>How often you want to receive notifications</p>
                    </div>
                    <div class="setting-control">
                        <select class="modern-select">
                            <option>Immediately</option>
                            <option>Daily Digest</option>
                            <option>Weekly Summary</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Other tabs would go here -->
            <div class="settings-tab" id="appearance-tab">
                <!-- Appearance settings content -->
            </div>
            
            <div class="settings-tab" id="account-tab">
                <!-- Account settings content -->
            </div>
            
            <div class="settings-tab" id="privacy-tab">
                <!-- Privacy settings content -->
            </div>
        </div>
    </div>
</div>

<style>
    /* Settings Panel Styles */
    .settings-panel {
        background-color: #f8fafc;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        max-width: 1200px;
        margin: 0 auto;
    }

    .settings-header {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 1px solid #e2e8f0;
    }

    .settings-header h2 {
        font-size: 1.75rem;
        font-weight: 700;
        color: #1e293b;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        margin-bottom: 0.5rem;
    }

    .settings-header p {
        color: #64748b;
        font-size: 0.95rem;
    }

    .settings-container {
        display: flex;
        gap: 2rem;
    }

    /* Sidebar Styles */
    .settings-sidebar {
        width: 220px;
        flex-shrink: 0;
        background: white;
        border-radius: 10px;
        padding: 1rem 0;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        height: fit-content;
    }

    .sidebar-item {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.75rem 1.5rem;
        cursor: pointer;
        transition: all 0.2s;
        color: #64748b;
        border-left: 3px solid transparent;
    }

    .sidebar-item:hover {
        background-color: #f1f5f9;
        color: #334155;
    }

    .sidebar-item.active {
        background-color: #f1f5f9;
        color: #3b82f6;
        border-left: 3px solid #3b82f6;
        font-weight: 500;
    }

    .sidebar-item i {
        width: 20px;
        text-align: center;
    }

    /* Settings Content Styles */
    .settings-content {
        flex-grow: 1;
        background: white;
        border-radius: 10px;
        padding: 1.5rem 2rem;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    }

    .settings-tab {
        display: none;
    }

    .settings-tab.active {
        display: block;
    }

    .settings-tab h3 {
        font-size: 1.25rem;
        font-weight: 600;
        color: #1e293b;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .setting-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1.25rem 0;
        border-bottom: 1px solid #f1f5f9;
    }

    .setting-item:last-child {
        border-bottom: none;
    }

    .setting-info h4 {
        font-size: 1rem;
        font-weight: 600;
        color: #1e293b;
        margin-bottom: 0.25rem;
    }

    .setting-info p {
        font-size: 0.875rem;
        color: #64748b;
    }

    /* Form Control Styles */
    .modern-select {
        padding: 0.5rem 1rem;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        background-color: #f8fafc;
        color: #334155;
        min-width: 200px;
        transition: all 0.2s;
    }

    .modern-select:focus {
        outline: none;
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    }

    /* Toggle Switch */
    .switch {
        position: relative;
        display: inline-block;
        width: 50px;
        height: 26px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #e2e8f0;
        transition: .4s;
        border-radius: 34px;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 18px;
        width: 18px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: .4s;
        border-radius: 50%;
    }

    input:checked + .slider {
        background-color: #3b82f6;
    }

    input:checked + .slider:before {
        transform: translateX(24px);
    }

    /* Toggle Button Group */
    .toggle-group {
        display: inline-flex;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        overflow: hidden;
    }

    .toggle-btn {
        padding: 0.5rem 1rem;
        background: none;
        border: none;
        cursor: pointer;
        font-size: 0.875rem;
        color: #64748b;
        transition: all 0.2s;
    }

    .toggle-btn:hover {
        background-color: #f1f5f9;
    }

    .toggle-btn.active {
        background-color: #3b82f6;
        color: white;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .settings-container {
            flex-direction: column;
        }
        
        .settings-sidebar {
            width: 100%;
            display: flex;
            overflow-x: auto;
            padding: 0.5rem;
        }
        
        .sidebar-item {
            flex-direction: column;
            padding: 0.75rem;
            min-width: 80px;
            text-align: center;
            border-left: none;
            border-bottom: 3px solid transparent;
        }
        
        .sidebar-item.active {
            border-left: none;
            border-bottom: 3px solid #3b82f6;
        }
    }
</style>

<script>
    // Tab switching functionality
    document.querySelectorAll('.sidebar-item').forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all items
            document.querySelectorAll('.sidebar-item').forEach(i => {
                i.classList.remove('active');
            });
            
            // Add active class to clicked item
            this.classList.add('active');
            
            // Hide all tabs
            document.querySelectorAll('.settings-tab').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Show selected tab
            const tabId = this.getAttribute('data-tab') + '-tab';
            document.getElementById(tabId).classList.add('active');
        });
    });

    // Toggle button group functionality
    document.querySelectorAll('.toggle-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            // Remove active class from all buttons in group
            this.parentNode.querySelectorAll('.toggle-btn').forEach(b => {
                b.classList.remove('active');
            });
            
            // Add active class to clicked button
            this.classList.add('active');
        });
    });
</script>