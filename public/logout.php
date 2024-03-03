<?php
require_once '../src/DBConnection.php';
require_once '../src/User.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$userManager = new User($pdo);
$userManager->logout();
// Chuyển hướng người dùng về trang chủ
header('Location: login.php');
exit;
