<?php
session_start();
require_once '../src/DBConnection.php';

require_once '../src/Product.php';
require_once '../src/User.php';
require_once '../src/Characters.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$productManager = new Product($pdo);
$userManager = new User($pdo);
$charManager = new Characters($pdo);

$character_name = $_GET['character_name'];

$products = $productManager->getAllProductsCharacters($character_name);
$character = $charManager->getInfoCharacter($character_name);
//xử lý phân trang
// Số lượng bản ghi hiển thị trên mỗi trang
$limit = 8;

// Tính tổng số trang
$totalPages = ceil(count($products) / $limit);

// Xác định trang hiện tại
$page = isset($_GET['page']) ? $_GET['page'] : 1;

// Xác định vị trí bắt đầu của trang hiện tại
$paginationStart = ($page - 1) * $limit;

// Lấy chỉ mục của mảng bắt đầu từ $paginationStart và có độ dài $limit
$currentPageProducts = array_slice($products, $paginationStart, $limit);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/main.css">

    <title>Trang chủ</title>
</head>

<body>
    <!-- Navbar -->
    <?php
    require '../partials/nabar.php';
    ?>
    <!-- End Navbar -->
    <main>
        <div class="container">
            <div class="row miku-info mt-5">
                <div class="col-lg-6 miku-info-img">
                    <img src="<?php echo $character['character_img'] ?>" alt="">
                </div>
                <div class="col-lg-6 miku-info-content">
                    <h1><?php echo $character['character_name'] ?></h1>
                    <p><?php echo $character['character_info1'] ?></p>
                    <p><?php echo $character['character_info2'] ?></p>
                </div>
            </div>

            <!-- Show product -->
            <div class="text-center">
                <h2 class="show-product-text text-center m-3"></h2>
                <div id="gallery" class="row">
                    <?php foreach ($currentPageProducts as $product) { ?>
                        <div class="col-lg-2 col-md-3 col-sm-6 card product">
                            <a href="../public/product.php?product_id=<?php echo $product['product_id']; ?>">
                                <div class="card-img">
                                    <img src="<?php echo $product['img']; ?>" alt="">
                                </div>
                                <div class="card-info">
                                    <p class="text-title productTitle"><?php echo $product['productName']; ?></p>
                                </div>
                            </a>
                            <div class="card-footer">
                                <span class="text-title"><?php echo number_format($product['productPrice'], 0, '.', '.'); ?>đ</span>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <!-- End product -->
            <!-- pagination -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <?php if ($page > 1) : ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $page - 1; ?>">Previous</a>
                        </li>
                    <?php endif; ?>

                    <?php for ($i = 1; $i <= $totalPages; $i++) : ?>
                        <li class="page-item <?php echo ($page == $i) ? 'active' : ''; ?>">
                            <a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                        </li>
                    <?php endfor; ?>

                    <?php if ($page < $totalPages) : ?>
                        <li class="page-item">
                            <a class="page-link" href="?page=<?php echo $page + 1; ?>">Next</a>
                        </li>
                    <?php endif; ?>
                </ul>
            </nav>
            <!--end pagination -->
        </div>

    </main>

    <?php
    require '../partials/footer.php';
    ?>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="../assets/js/main.js"></script>
</body>

</html>