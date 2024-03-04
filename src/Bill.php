<?php
class Bill
{
    private $db;

    public function __construct(PDO $pdo)
    {
        $this->db = $pdo;
    }

    public function getAllBill()
    {
        $query = $this->db->query("SELECT bill.*, users.name, users.email, users.phone, users.address
                                    FROM bill
                                    INNER JOIN users ON bill.user_id = users.user_id");
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllBillByBillId($bill_id)
    {
        $query = $this->db->query("SELECT bill.*, users.name, users.email, users.phone, users.address
                                    FROM bill
                                    INNER JOIN users ON bill.user_id = users.user_id
                                    WHERE bill.bill_id = ?");
        $query->execute([$bill_id]);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllBillByUserId($user_id)
    {
        $query = $this->db->prepare("SELECT bill.*, users.name, users.email, users.phone, users.address
                                FROM bill
                                INNER JOIN users ON bill.user_id = users.user_id
                                WHERE bill.user_id = ?");
        $query->execute([$user_id]);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }


    public function confirmOrder($bill_id)
    {
        $query = $this->db->prepare("UPDATE bill SET status = 'Đã xác nhận' WHERE bill_id = ?");
        $query->execute([$bill_id]);
        return $query->rowCount(); // Trả về số dòng đã được cập nhật
    }

    public function notConfirmOrder($bill_id)
    {
        $query = $this->db->prepare("UPDATE bill SET status = 'Chưa xác nhận' WHERE bill_id = ?");
        $query->execute([$bill_id]);
        return $query->rowCount(); // Trả về số dòng đã được cập nhật
    }

    public function markOrderDelivered($bill_id)
    {
        $query = $this->db->prepare("UPDATE bill SET status = 'Đã giao hàng' WHERE bill_id = ?");
        $query->execute([$bill_id]);
        return $query->rowCount(); // Trả về số dòng đã được cập nhật
    }

    public function billReturn($bill_id)
    {
        $query = $this->db->prepare("UPDATE bill SET status = 'Bị hoàn lại' WHERE bill_id = ?");
        $query->execute([$bill_id]);
        return $query->rowCount(); // Trả về số dòng đã được cập nhật
    }

    public function deleteBill($bill_id)
    {
        // Chuẩn bị truy vấn SQL để xóa đơn hàng
        $query = $this->db->prepare("DELETE FROM bill WHERE bill_id = ?");
        $query->execute([$bill_id]);
    }

    public function getBillDetail($bill_id)
    {
        $query = $this->db->prepare("SELECT bill_details.*, product.* FROM bill_details
                                    INNER JOIN product ON bill_details.product_id = product.product_id
                                    WHERE bill_details.bill_id = ?");
        $query->execute([$bill_id]);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getTotalAmountOfAllBills()
    {
        // Chuẩn bị truy vấn SQL để tính tổng số tiền của tất cả các đơn hàng
        $query = $this->db->query("SELECT SUM(total_amount) AS total_amount FROM bill");
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['total_amount'];
    }

    function getTotalNumberOfOrders()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM bill");
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['total'];
    }
}
