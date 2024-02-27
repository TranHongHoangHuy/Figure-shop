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
}
