<?php
require_once '../src/DBConnection.php';
// require_once '../partials/check_admin.php';
require_once '../src/Bill.php';
require_once '../src/Product.php';


$bill_id = $_POST['bill_id'];

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$billManager = new Bill($pdo);
$bills_details = $billManager->getBillDetail($bill_id);
?>
<!DOCTYPE html>
<html lang="en">

<?php
require '../partials/header_admin.php';
?>

<body>
    <!-- Sidebar -->
    <?php
    require '../partials/sidebar_admin.php';
    ?>
    <!-- End of Sidebar -->

    <!-- Main Content -->
    <div class="content">
        <!-- Navbar -->
        <?php
        require '../partials/navbar_admin.php';
        ?>
        <!-- End of Navbar -->
        <main>
            <div class="header">
                <div class="left">
                    <h1>Đơn hàng</h1>
                </div>
            </div>
            <div class="bottom-data">
                <div class="orders">
                    <div class="header">
                        <i class='bx bx-receipt'></i>
                        <h3>Thông tin chi tiết đơn hàng</h3>
                    </div>
                    <table id="example" class="table table-striped text-center" style="width:100%">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($bills_details as $bill) : ?>
                                <tr>

                                    <td><img src="<?php echo $bill['img']; ?>" style="height: 100px;"></td>
                                    <td class="text-center"><?php echo $bill['productName']; ?></td>
                                    <td class="text-center"><?php echo $bill['bill_quantity']; ?></td>
                                    <td class="text-center"><span><?php echo number_format($bill['productPrice'] * $bill['bill_quantity'], 0, '.', '.'); ?>đ</span></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

    <script src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap5.min.js"></script>
    <script src="../assets/js/admin_dash_board.js"></script>

    <script>
        document.title = "Đơn hàng";
        //     $(document).ready(function() {
        //         $('#example').DataTable();
        //     });
    </script>
</body>

</html>