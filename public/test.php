<?php
session_start();
require_once '../src/DBConnection.php';
$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu

// Kiểm tra xem người dùng đã đăng nhập chưa
if (isset($_SESSION['user_id'])) {
    // Người dùng đã đăng nhập
    $user_id = $_SESSION['user_id'];
    $name = $_SESSION['name'];
    $role_id = $_SESSION['role_id'];

    // Đây là nơi bạn có thể thực hiện các hành động phù hợp cho người dùng đã đăng nhập, ví dụ: hiển thị nút logout, truy cập các chức năng dành cho người dùng đã đăng nhập, vv.
    echo "Xin chào $name! Bạn đã đăng nhập với vai trò có mã $role_id.";
    echo '<br><a href="logout.php">Đăng xuất</a>';
} else {
    // Người dùng chưa đăng nhập, bạn có thể chuyển hướng hoặc hiển thị một thông báo
    echo "Bạn chưa đăng nhập.";
    echo '<br><a href="login.php">Đăng nhập</a>';
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê doanh thu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <h2 class="text-center mb-4">Thống kê doanh thu theo ngày</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Ngày</th>
                            <th scope="col">Doanh thu (VNĐ)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($results as $row) : ?>
                            <tr>
                                <td>Ngày <?php echo $row['ngay']; ?></td>
                                <td><?php echo number_format($row['tong_doanh_thu'], 0, ',', '.'); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <canvas id="revenueChart" width="800" height="400"></canvas>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS và Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
    <script>
        // Dữ liệu cho biểu đồ
        var chartData = {
            labels: <?php echo json_encode($labels); ?>,
            datasets: [{
                label: 'Doanh thu (VNĐ)',
                data: <?php echo json_encode($data); ?>,
                backgroundColor: 'rgba(75, 192, 192, 0.9)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        };

        // Cấu hình biểu đồ
        var chartOptions = {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        };

        // Vẽ biểu đồ
        var revenueChart = new Chart(document.getElementById('revenueChart').getContext('2d'), {
            type: 'bar',
            data: chartData,
            options: chartOptions
        });
    </script>

</body>

</html>