<?php
require_once '../src/DBConnection.php';
require_once '../src/User.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$userManager = new User($pdo);
$users = $userManager->getAllUser();

?>
<?php
require_once '../partials/header.php';
?>

<body>
    <main style="min-height: 500px;">
        <div class="container mt-5 mb-5">
            <h1 class="text-center">Thông tin user</h1>
            <a href="./add_user.php" class="btn btn-primary" style="margin-bottom: 30px;">
                <i class="fa fa-plus"></i> Thêm user</a>
            <table id="example" class="table table-striped" style="width:100%">
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
                                        <i alt="Xem" class="fa fa-pencil"></i>
                                    </button>
                                </form>
                            </td>
                            <td class="td-center" style="height: auto; text-align: center; line-height: auto;">
                                <form method="post" action="edit_user.php" style="margin-bottom: 5px;">
                                    <input type="hidden" name="user_id" value="<?php echo $user['user_id']; ?>">
                                    <button type="submit" class="btn btn-xs btn-primary" name="detail">
                                        <i alt="Edit" class="fa fa-pencil"></i>
                                    </button>
                                </form>
                                <form method="post" action="delete_user.php">
                                    <input type="hidden" name="user_id" value="<?php echo $user['user_id']; ?>">
                                    <button type="submit" class="btn btn-xs btn-danger" name="delete">
                                        <i alt="Delete" class="fa fa-trash"></i>
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
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
        document.title = "Người dùng";
        $(document).ready(function() {
            $('#example').DataTable();
        });
    </script>
</body>

</html>