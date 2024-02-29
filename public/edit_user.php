<?php
require_once '../src/DBConnection.php';
require_once '../src/User.php';

$user_id = $_POST['user_id'];
$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu
$userManager = new User($pdo);
$users = $userManager->getUserByUserId($user_id);

if (isset($_POST['submit'])) {
    $userManager->updateUser($user_id, $_POST);
    header('Location: ./show_user.php');
    exit;
}
?>
<?php
require_once '../partials/header.php';
?>

<body>
    <div class="container">
        <h1 class="text-center">Chỉnh sửa thông tin</h1>
        <form method="post" action="">
            <div class="form-group" style="display:none;">
                <label for="user_id">user_id</label>
                <input type="text" class="form-control" id="user_id" name="user_id" value="<?= htmlspecialchars($users['user_id']) ?>">
            </div>
            <div class="form-group">
                <label for="name">Tên khách hàng</label>
                <input type="text" class="form-control" id="name" name="name" value="<?= htmlspecialchars($users['name']) ?>">
            </div>
            <div class="form-group">
                <label for="name">Tên đăng nhập</label>
                <input type="text" class="form-control" id="username" name="username" value="<?= htmlspecialchars($users['username']) ?>">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<?= htmlspecialchars($users['email']) ?>">
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="address" value="<?= htmlspecialchars($users['address']) ?>">
            </div>
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="tel" class="form-control" pattern="[0-9]{10}" id="phone" name="phone" value="<?= htmlspecialchars($users['phone']) ?>">
            </div>
            <button type="submit" name="submit" class="btn btn-primary mt-2">Sửa thông tin</button>
        </form>
        <!-- <form method="post" action="update_password.php" style="margin-bottom: 5px;">
            <input type="hidden" name="user_id" value="<?php echo $users['user_id']; ?>">
            <button type="submit" class="btn btn-xs btn-primary" name="updatepass">
                <i alt="Xem" class="fa fa-pencil"></i>
            </button>
        </form> -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
</body>

</html>