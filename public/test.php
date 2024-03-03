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
