<?php
require_once '../src/DBConnection.php';
require_once '../src/Product.php';
require_once '../src/User.php';
require_once '../src/Bill.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$productManager = new Product($pdo);
$userManager = new User($pdo);
$billManager = new Bill($pdo);

$bills = $billManager->getAllBill();

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
    <title>Admin Dashboard</title>

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
            <!-- <a href="#" class="notif">
                <i class='bx bx-bell'></i>
                <span class="count">12</span>
            </a>
            <a href="#" class="profile">
                <img src="images/logo.png">
            </a> -->
        </nav>

        <!-- End of Navbar -->

        <main>
            <div class="header">
                <div class="left">
                    <h1>Dashboard</h1>
                    <!-- <ul class="breadcrumb">
                        <li><a href="#">
                                Analytics
                            </a></li>
                        /
                        <li><a href="#" class="active">Shop</a></li>
                    </ul> -->
                </div>
                <!-- <a href="#" class="report">
                    <i class='bx bx-cloud-download'></i>
                    <span>Download CSV</span>
                </a> -->
            </div>

            <!-- Insights -->
            <ul class="insights">
                <a href="./show_bill.php">
                    <li>
                        <i class='bx bx-receipt' style="background: var(--light-primary);
                                                            color: var(--primary);">
                        </i>
                        <span class="info">
                            <h3>
                                <?php
                                $billTotal = $billManager->getTotalNumberOfOrders();
                                echo $billTotal;
                                ?>
                            </h3>
                            <p>Paid Order</p>
                        </span>
                    </li>
                </a>
                <a href="./show_user.php">
                    <li>
                        <i class='bx bx-group' style="background: var(--light-warning);
                                                        color: var(--warning);">
                        </i>
                        <span class="info">
                            <h3>
                                <?php
                                $userTotal = $userManager->getTotalNumberOfUsers();
                                echo $userTotal;
                                ?>
                            </h3>
                            <p>Khách hàng</p>
                        </span>
                    </li>
                </a>
                <a href="./show_product.php">
                    <li>
                        <i class='bx bx-package' style="background: var(--light-success);
                                                        color: var(--success);">
                        </i>
                        <span class="info">
                            <h3>
                                <?php
                                $productTotal = $productManager->getTotalNumberOfProduct();
                                echo $productTotal;
                                ?>
                            </h3>
                            <p>Sản phẩm</p>
                        </span>
                    </li>
                </a>
                <li>
                    <i class='bx bx-dollar-circle' style="background: var(--light-danger);
                                                        color: var(--danger);">
                    </i>
                    <span class="info">
                        <h3>
                            <?php
                            $totalAmount = $billManager->getTotalAmountOfAllBills();
                            echo $totalAmount;
                            ?>
                        </h3>
                        <p>Doanh thu</p>
                    </span>
                </li>
            </ul>
            <!-- End of Insights -->

            <div class="bottom-data">
                <div class="orders">
                    <div class="header">
                        <i class='bx bx-receipt'></i>
                        <h3>Recent Orders</h3>

                    </div>
                    <table id="example" class="table table-striped">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Order Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($bills as $bill) : ?>
                                <tr>
                                    <td>
                                        <p><?php echo $bill['name'] ?></p>
                                    </td>
                                    <td><?php echo $bill['bill_date'] ?></td>
                                    <?php
                                    $statusClass = '';
                                    switch ($bill['status']) {
                                        case 'đã giao hàng':
                                            $statusClass = 'completed';
                                            break;
                                        case 'đã xác nhận':
                                            $statusClass = 'process';
                                            break;
                                        default:
                                            $statusClass = 'pending';
                                            break;
                                    }
                                    echo '<td><span class="status ' . $statusClass . '">' . htmlspecialchars($bill['status']) . '</span></td>';
                                    ?>
                                    <td><span class="status completed">Completed</span></td>
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


</body>

</html>