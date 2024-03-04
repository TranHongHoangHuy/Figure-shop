<?php
require_once '../src/DBConnection.php';
// require_once '../partials/check_admin.php';
require_once '../src/Bill.php';
$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$billManager = new Bill($pdo);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $bill_id = $_POST["bill_id"];
    $status = $_POST["status"];

    if ($status === 'confirmed') {
        $billManager->confirmOrder($bill_id);
    } elseif ($status === 'delivered') {
        $billManager->markOrderDelivered($bill_id);
    } else {
        $billManager->notConfirmOrder($bill_id);
    }

    header("Location: show_bill.php");
    exit;
}
