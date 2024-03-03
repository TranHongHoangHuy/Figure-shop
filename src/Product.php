<?php
class Product
{
    private $db;

    public function __construct(PDO $pdo)
    {
        $this->db = $pdo;
    }

    public function getAllProducts()
    {
        $query = $this->db->query("SELECT product.*, catalog.catalogName 
                                    FROM product 
                                    INNER JOIN catalog ON product.catalog_id = catalog.catalog_id");
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductByProductId($product_id)
    {
        $query = $this->db->prepare("SELECT product.*, catalog.catalogName 
                                    FROM product 
                                    INNER JOIN catalog ON product.catalog_id = catalog.catalog_id
                                    WHERE product.product_id = ?");
        $query->execute([$product_id]);
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    public function addProduct($productName, $catalog_id, $studio, $productPrice, $scale, $img, $quantity)
    {
        $query = $this->db->prepare("INSERT INTO product (productName, catalog_id, studio, productPrice, scale, img, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)");
        return $query->execute([$productName, $catalog_id, $studio, $productPrice, $scale, $img, $quantity]);
    }

    public function updateProduct($product_id, $productName, $catalog_id, $studio, $productPrice, $scale, $img, $quantity)
    {
        $query = $this->db->prepare("UPDATE product SET productName = ?, catalog_id = ?, studio = ?, productPrice = ?, scale = ?, img = ?, quantity = ? WHERE product_id = ?");
        return $query->execute([$productName, $catalog_id, $studio, $productPrice, $scale, $img, $quantity, $product_id]);
    }

    public function deleteProduct($product_id)
    {
        $query = $this->db->prepare("DELETE FROM product WHERE product_id = ?");
        return $query->execute([$product_id]);
    }

    public function getProductImages($product_id)
    {
        $query = $this->db->prepare("SELECT * FROM imglist WHERE product_id = ?");
        $query->execute([$product_id]);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function addProductImages($product_id, $imagePaths)
    {
        $query = $this->db->prepare("INSERT INTO imglist (product_id, img_path) VALUES (?, ?)");
        foreach ($imagePaths as $imagePath) {
            $query->execute([$product_id, $imagePath]);
        }
    }

    public function updateProductImage($product_id, $imagePath)
    {
        $query = $this->db->prepare("UPDATE imglist SET img_path = ? WHERE product_id = ?");
        return $query->execute([$imagePath, $product_id]);
    }

    public function updateProductInfo($product_id, $postData, $mainImgFile, $additionalImages)
    {
        // Lấy dữ liệu từ form
        $productName = $postData["productName"];
        $catalog_id = $postData["catalog_id"];
        $studio = $postData["studio"];
        $productPrice = $postData["productPrice"];
        $scale = $postData["scale"];
        $quantity = $postData["quantity"];

        // Xử lý và di chuyển ảnh chính vào thư mục upload
        $uploadDirMain = '../assets/img/upload/';
        $uploadFileMain = $uploadDirMain . basename($mainImgFile['name']);
        move_uploaded_file($mainImgFile['tmp_name'], $uploadFileMain);
        $mainImg = $uploadFileMain;

        // Cập nhật thông tin sản phẩm
        $this->updateProduct($product_id, $productName, $catalog_id, $studio, $productPrice, $scale, $mainImg, $quantity);

        // Xử lý và di chuyển ảnh phụ vào thư mục upload (nếu có)
        if (!empty($additionalImages['tmp_name'])) {
            $additionalImagePaths = [];
            foreach ($additionalImages['tmp_name'] as $index => $tmp_name) {
                $uploadDirAdditional = '../assets/img/upload/';
                $uploadFileAdditional = $uploadDirAdditional . basename($additionalImages['name'][$index]);
                move_uploaded_file($tmp_name, $uploadFileAdditional);
                $additionalImagePaths[] = $uploadFileAdditional;
            }
            // Cập nhật ảnh phụ vào bảng imglist
            $this->updateProductImage($product_id, $additionalImagePaths);
        }
    }

    function getTotalNumberOfProduct()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM product");
        $result = $query->fetch(PDO::FETCH_ASSOC);
        return $result['total'];
    }
}
