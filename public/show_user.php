<?php
require_once '../src/DBConnection.php';
require_once '../src/User.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$userManager = new User($pdo);
$users = $userManager->getAllUser();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/admin_dash_board.css">

    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.min.css">
    <title>Khách hàng</title>

</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="#" class="logo">
            <i class='bx bx-store'></i>
            <div class="logo-name"><span>Figure</span>shop</div>
        </a>
        <ul class="side-menu">
            <li><a href="./admin_dash_board.php"><i class='bx bxs-dashboard'></i>Admin</a></li>
            <li><a href="../index.php"><i class='bx bx-store-alt'></i>Shop</a></li>
            <li class=""><a href="#"><i class='bx bx-analyse'></i>Thống kê</a></li>
            <li><a href="./show_product.php"><i class='bx bx-package'></i>Sản phẩm</a></li>
            <li><a href="./show_user.php"><i class='bx bx-group'></i>Users</a></li>
            <li><a href="./show_bill.php"><i class='bx bx-receipt'></i>Đơn hàng</a></li>
        </ul>
        <ul class="side-menu">
            <li>
                <a href="#" class="logout">
                    <i class='bx bx-log-out-circle'></i>
                    Logout
                </a>
            </li>
        </ul>
    </div>
    <!-- End of Sidebar -->

    <!-- Main Content -->
    <div class="content">
        <!-- Navbar -->
        <nav>
            <i class='bx bx-menu'></i>
            <form action="#">
                <div class="form-input">
                    <input type="search" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                </div>
            </form>
            <input type="checkbox" id="theme-toggle" hidden>
            <label for="theme-toggle" class="theme-toggle"></label>
        </nav>

        <!-- End of Navbar -->
        <main>
            <div class="header">
                <div class="left">
                    <h1>Khách hàng</h1>
                </div>
            </div>
            <div class="bottom-data">
                <div class="orders">
                    <div class="header">
                        <i class='bx bx-receipt'></i>
                        <h3>Thông tin khách hàng</h3>

                    </div>

                    <!-- <main style="min-height: 500px;">
            <div class="container mt-5 mb-5">
                <h1 class="text-center">Thông tin user</h1> -->
                    <a href="./add_user.php" class="btn btn-primary" style="margin-bottom: 30px;">
                        <i class="fa fa-plus"></i> Thêm user
                    </a>
                    <table id="example" class="table table-striped text-center" style="width:100%">
                        <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Đơn hàng</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($users as $user) : ?>
                                <tr>
                                    <td class="td-center"><?php echo $user['name']; ?></td>
                                    <td class="td-center"><?php echo $user['address']; ?></td>
                                    <td class="td-center"><?php echo $user['phone']; ?></td>
                                    <td class="td-center" style="height: auto; text-align: center; line-height: auto;">
                                        <form method="post" action="show_bill_user.php" style="margin-bottom: 5px;">
                                            <input type="hidden" name="user_id" value="<?php echo $user['user_id']; ?>">
                                            <button type="submit" class="btn btn-xs btn-primary" name="detail">
                                                <i alt="Xem" class="bx bx-detail"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td class="td-center" style="height: auto; text-align: center; line-height: auto;">
                                        <form method="post" action="edit_user.php" style="margin-bottom: 5px;">
                                            <input type="hidden" name="user_id" value="<?php echo $user['user_id']; ?>">
                                            <button type="submit" class="btn btn-xs btn-primary" name="detail">
                                                <i alt="Edit" class="bx bx-pencil"></i>
                                            </button>
                                        </form>
                                        <form method="post" action="delete_user.php">
                                            <input type="hidden" name="user_id" value="<?php echo $user['user_id']; ?>">
                                            <button type="submit" class="btn btn-xs btn-danger" name="delete">
                                                <i alt="Delete" class="bx bx-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Tên</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Đơn hàng</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </main>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

        <script src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="../assets/js/admin_dash_board.js"></script>

        <script>
            document.title = "Người dùng";
            //     $(document).ready(function() {
            //         $('#example').DataTable();
            //     });
        </script>
</body>

</html>