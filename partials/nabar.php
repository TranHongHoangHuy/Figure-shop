<?php
$catalogs = $pdo->query("SELECT * FROM catalog")->fetchAll(PDO::FETCH_ASSOC);
// Tính tổng số lượng sản phẩm trong giỏ hàng
if (!isset($_SESSION['cart']) || empty($_SESSION['cart'])) {
    $totalItems = 0; // Nếu không có sản phẩm trong giỏ hàng, số lượng là 0
} else {
    $totalItems = count($_SESSION['cart']); // Nếu có sản phẩm trong giỏ hàng, tính số lượng
}

?>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="display: block;">
    <div class="container-fluid sidebar">
        <a class="navbar-brand logo" href="../index.php">
            <i class='bx bx-store'></i>
            <div class="logo-name"><span>Figure</span>shop</div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <!-- Search Bar -->
            <form class="d-flex mx-auto custom-search-form" method="get" action="../public/search.php">
                <input class="form-control me-2 " type="text" placeholder="Search" aria-label="Search" id="live_search" autocomplete="off" name="keyword">
                <button class="btn btn-outline-success" type="submit">Search</button>
                <!--Kết quả tìm kiếm-->
                <div id="searchresult"></div>
            </form>

            <ul class="navbar-nav logo mx=0">
                <?php
                if (isset($_SESSION['user_id'])) { // Kiểm tra session
                ?> <li class="nav-item dropdown test mx-2">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bx bx-user"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item d-flex user-setting" href="../public/user_change_info.php?user_id=<?php echo $_SESSION['user_id']; ?>">
                                    Thay đổi thông tin</a></li>
                            <li><a class="dropdown-item d-flex user-setting" href="../public/user_bill_history.php?user_id=<?php echo $_SESSION['user_id']; ?>">
                                    Lịch sử mua hàng</a></li>
                            <li><a class="dropdown-item d-flex user-setting" href="../public/logout.php">
                                    Đăng xuất</a></li>

                        </ul>
                        <!-- <a class="nav-link" href="../public/logout.php">
                            
                            Đăng xuất
                        </a> -->

                    </li>
                <?php
                } else {
                    echo '<li class="nav-item test mx-2">
                                <a class="nav-link" href="../public/login.php">
                                    <i class="bx bx-user"></i>
                                    Đăng nhập
                                </a>               
                        </li>';
                }
                ?>
                <li class="nav-item test mx-2">
                    <a class="nav-link header-action-link" href="../public/cart.php">
                        <i class="bx bx-cart box-icon"></i>
                        <!-- Thẻ để hiển thị số lượng sản phẩm -->
                        <?php
                        echo '<span class="count-holder">' . $totalItems . '</span>';
                        ?>
                        <!-- <span class="count-holder"><?php $totalItems ?></span> -->
                        Giỏ hàng</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="container-fluid sidebar2">
        <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="../public/new_product.php">Mới nhất</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Danh mục
                </a>
                <ul class="dropdown-menu">
                    <?php foreach ($catalogs as $catalog) : ?>
                        <li><a class="dropdown-item" href="../public/catalog.php?catalog_id=<?php echo $catalog['catalog_id']; ?>"><?= $catalog['catalogName'] ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Nhân vật
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="../public/characters.php?character_name=Elaina">Elaina</a></li>
                    <li><a class="dropdown-item" href="../public/characters.php?character_name=Hatsune Miku">Hatsune Miku</a></li>
                    <li><a class="dropdown-item" href="../public/characters.php?character_name=Tokisaki Kurumi">Tokisaki Kurumi</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="#">Liên hệ</a>
            </li>
        </ul>
    </div>
</nav>