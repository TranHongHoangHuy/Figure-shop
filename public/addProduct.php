<?php
require_once '../src/DBConnection.php';
require_once '../src/Product.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $productManager = new Product($pdo);
    // Lấy dữ liệu từ form
    $productName = $_POST["productName"];
    $catalog_id = $_POST["catalog_id"];
    $studio = $_POST["studio"];
    $productPrice = $_POST["productPrice"];
    $scale = $_POST["scale"];
    $img = $_FILES['img']['tmp_name'];
    $quantity = $_POST["quantity"];

    // Xử lý và di chuyển ảnh chính vào thư mục upload
    $uploadDirMain = '../assets/img/upload/';
    $uploadFileMain = $uploadDirMain . basename($_FILES['img']['name']);
    move_uploaded_file($_FILES['img']['tmp_name'], $uploadFileMain);
    $img = $uploadFileMain;


    // Thêm sản phẩm
    $productManager->addProduct($productName, $catalog_id, $studio, $productPrice, $scale, $img, $quantity);

    // Lấy product_id của sản phẩm vừa được thêm vào
    $product_id = $pdo->lastInsertId();
    // Thêm ảnh phụ vào bảng imglist (nếu có)
    if (!empty($_FILES['additionalImages']['tmp_name'])) {
        $additionalImagePaths = [];
        foreach ($_FILES['additionalImages']['tmp_name'] as $index => $tmp_name) {
            // Xử lý và di chuyển ảnh phụ vào thư mục upload
            $uploadDirAdditional = '../assets/img/upload/';
            $uploadFileAdditional = $uploadDirAdditional . basename($_FILES['additionalImages']['name'][$index]);
            move_uploaded_file($tmp_name, $uploadFileAdditional);
            // Lưu đường dẫn ảnh phụ vào mảng
            $additionalImagePaths[] = $uploadFileAdditional;
        }
        // Gọi phương thức để thêm ảnh phụ vào bảng imglist
        $productManager->addProductImages($product_id, $additionalImagePaths);
    }

    echo "Sản phẩm đã được thêm thành công.";
    $_POST = array();
}

$catalogs = $pdo->query("SELECT * FROM catalog")->fetchAll(PDO::FETCH_ASSOC);

?>
<?php
require_once '../partials/header.php';
?>

<body>
    <div class="container">
        <h1>Thêm figure</h1>
        <form method="post" action="" enctype="multipart/form-data">
            <div class="form-group">
                <label for="catalog_id">Danh mục figure:</label>
                <select class="form-control" id="catalog_id" name="catalog_id">
                    <?php foreach ($catalogs as $catalog) : ?>
                        <option value="<?= $catalog['catalog_id'] ?>"><?= $catalog['catalogName'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="productName">Tên figuge:</label>
                <input type="text" class="form-control" id="productName" name="productName" placeholder="Nhập tên figuge" required>
            </div>
            <div class="form-group">
                <label for="productPrice">Giá figuge:</label>
                <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="Nhập giá" required>
            </div>

            <div class="form-group">
                <label for="img">Chọn ảnh từ file:</label>
                <input type="file" class="form-control" id="img" name="img">
            </div>

            <div class="form-group">
                <label for="additionalImages">Ảnh phụ:</label>
                <input type="file" class="form-control" id="additionalImages" name="additionalImages[]" multiple>
                <small id="additionalImagesHelp" class="form-text text-muted">Bạn có thể chọn nhiều ảnh bằng cách giữ phím Ctrl hoặc Shift khi chọn.</small>
            </div>

            <div class="form-group">
                <label for="content">Studio:</label>
                <textarea class="form-control" id="studio" name="studio" placeholder="Nhập mã" required></textarea>
            </div>
            <div class="form-group">
                <label for="content">Số lượng:</label>
                <textarea class="form-control" id="quantity" name="quantity" placeholder="Nhập số lượng" required></textarea>
            </div>
            <div class="form-group">
                <label for="content">Kích thước:</label>
                <textarea class="form-control" id="scale" name="scale" placeholder="Nhập kích thước" required></textarea>
            </div>
            <button type="submit" name="submit" class="btn btn-primary">Thêm</button>
        </form>
    </div>
    <script src="../assets/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
<?php
require_once "../partials/footer.php"
?>

</html>