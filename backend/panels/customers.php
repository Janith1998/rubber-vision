<?php
// Headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: text/html; charset=UTF-8");

// DB connection
require '../db.php';

// Query all users from the database
$sql = "SELECT id, full_name, address, mobile, email, 'active' AS status, NOW() AS last_purchase FROM users ORDER BY id DESC";
$result = $conn->query($sql);
?>

<div class="customer-panel">
    <div class="panel-header">
        <h2>Customer Management</h2>
        <div class="panel-actions">
            <button class="btn btn-primary">
                <i class="fas fa-plus"></i> Add Customer
            </button>
            <div class="search-filter">
                <input type="text" placeholder="Search customers..." class="search-input">
                <select class="status-filter">
                    <option value="all">All Statuses</option>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
        </div>
    </div>

    <div class="table-container">
        <table class="modern-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Last Purchase</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($result && $result->num_rows > 0): ?>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= $row['id'] ?></td>
                            <td>
                                <div class="customer-avatar">
                                    <img src="https://ui-avatars.com/api/?name=<?= urlencode($row['full_name']) ?>&background=random" alt="<?= htmlspecialchars($row['full_name']) ?>">
                                    <?= htmlspecialchars($row['full_name']) ?>
                                </div>
                            </td>
                            <td><?= htmlspecialchars($row['address']) ?></td>
                            <td><?= htmlspecialchars($row['mobile']) ?></td>
                            <td><?= htmlspecialchars($row['email']) ?></td>
                            <td>
                                <span class="status-badge active">Active</span>
                            </td>
                            <td><?= date('M j, Y') ?></td> <!-- You can customize this later -->
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-icon" title="Edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-icon" title="View"><i class="fas fa-eye"></i></button>
                                    <button class="btn-icon danger" title="Delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="8" style="text-align:center;">No customers found.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <div class="table-footer">
        <div class="table-info">
            Showing <?= $result->num_rows ?> of <?= $result->num_rows ?> entries
        </div>
        <div class="pagination">
            <button class="btn-pagination" disabled><i class="fas fa-chevron-left"></i> Previous</button>
            <button class="btn-pagination active">1</button>
            <button class="btn-pagination">2</button>
            <button class="btn-pagination">3</button>
            <button class="btn-pagination">Next <i class="fas fa-chevron-right"></i></button>
        </div>
    </div>
</div>

<style>
.customer-panel {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    padding: 20px;
}

.panel-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.panel-header h2 {
    font-size: 1.5rem;
    color: #333;
}

.panel-actions {
    display: flex;
    gap: 15px;
    align-items: center;
}

.search-filter {
    display: flex;
    gap: 10px;
}

.search-input {
    padding: 8px 15px;
    border: 1px solid #ddd;
    border-radius: 6px;
    width: 250px;
}

.status-filter {
    padding: 8px 15px;
    border: 1px solid #ddd;
    border-radius: 6px;
    background: #fff;
}

.modern-table {
    width: 100%;
    border-collapse: collapse;
}

.modern-table th {
    background: #f8fafc;
    color: #64748b;
    font-weight: 600;
    text-align: left;
    padding: 12px 15px;
    border-bottom: 1px solid #e2e8f0;
}

.modern-table td {
    padding: 12px 15px;
    border-bottom: 1px solid #e2e8f0;
    color: #334155;
}

.customer-avatar {
    display: flex;
    align-items: center;
    gap: 10px;
}

.customer-avatar img {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    object-fit: cover;
}

.status-badge {
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 500;
}

.status-badge.active {
    background: #dcfce7;
    color: #166534;
}

.status-badge.inactive {
    background: #fee2e2;
    color: #991b1b;
}

.action-buttons {
    display: flex;
    gap: 8px;
}

.btn-icon {
    background: transparent;
    border: none;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    color: #64748b;
    transition: all 0.2s;
}

.btn-icon:hover {
    background: #f1f5f9;
    color: #334155;
}

.btn-icon.danger:hover {
    background: #fee2e2;
    color: #dc2626;
}

.table-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
    padding-top: 15px;
    border-top: 1px solid #e2e8f0;
}

.table-info {
    color: #64748b;
    font-size: 0.9rem;
}

.pagination {
    display: flex;
    gap: 5px;
}

.btn-pagination {
    padding: 8px 12px;
    border: 1px solid #e2e8f0;
    background: #fff;
    border-radius: 6px;
    cursor: pointer;
    color: #64748b;
    transition: all 0.2s;
}

.btn-pagination:hover:not(:disabled) {
    background: #f1f5f9;
    color: #334155;
}

.btn-pagination.active {
    background: #3b82f6;
    color: #fff;
    border-color: #3b82f6;
}

.btn-pagination:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}
</style>