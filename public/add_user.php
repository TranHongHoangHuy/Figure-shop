<?php
require_once '../src/DBConnection.php';
require_once '../src/User.php';

$pdo = DBConnection::getConnection(); // Kết nối đến cơ sở dữ liệu

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $userManager = new User($pdo);
    // Lấy dữ liệu từ form
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $name = $_POST['name'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];

    $userManager->addUser($username, $password, $email, $name, $address, $phone);
    echo "Đã thêm khách hàng";
    $_POST = array();
    header('Location: show_user.php');
    exit;
}
?>
<?php
require_once '../partials/header.php';
?>

<body>
    <form method="post" action="">
        <div class="card_lgi_container">
            <div class="card_lgi">
                <a class="card_lgi_login mt-2">Sign up</a>
                <div class="card_lgi_inputBox">
                    <input type="text" required="required" name="name" value="" id="name">
                    <span class="user">Name</span>
                </div>
                <div class="card_lgi_inputBox">
                    <input type="text" required="required" name="username" value="" id="username">
                    <span class="user">Username</span>
                </div>

                <div class="card_lgi_inputBox">
                    <input type="password" required="required" name="password" value="" id="password">
                    <span>Password</span>
                </div>

                <div class="card_lgi_inputBox">
                    <input type="email" required="required" name="email" value="" id="email">
                    <span>Email</span>
                </div>

                <div class="card_lgi_inputBox">
                    <input type="tel" required="required" pattern="[0-9]{10}" name="phone" value="" id="phone">
                    <span>Phone number</span>
                </div>

                <div class="card_lgi_inputBox">
                    <input type="text" required="required" name="address" value="" id="address">
                    <span>Address</span>
                </div>
                <button class="card_lgi_enter" type="submit" name="submit" value="Register">Enter</button>
            </div>
        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
        document.title = "Đăng ký";
    </script>
</body>

</html>