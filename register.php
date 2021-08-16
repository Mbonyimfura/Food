<?php  include('./config/constants.php'); 
// initializing variables
$full_name   = "";
$username   = ""; 
$email    = ""; 
$errors = array(); 
// connect to the database
//$db = mysqli_connect('localhost', 'root', '', 'food');

// REGISTER USER
if (isset($_POST['reg_user'])) {
  // receive all input values from the form
  $full_name = mysqli_real_escape_string($conn, $_POST['fullname']);
  $username = mysqli_real_escape_string($conn, $_POST['username']);
  $email = mysqli_real_escape_string($conn, $_POST['email']);
  $password_1 = mysqli_real_escape_string($conn, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($conn, $_POST['password_2']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  if ($password_1 != $password_2) {
	array_push($errors, "The two passwords do not match");
  }

  // first check the database to make sure 
  // a user does not already exist with the same username and/or email
  $user_check_query = "SELECT * FROM tbl_users WHERE username='$username' OR email='$email' LIMIT 1";
  $result = mysqli_query($conn, $user_check_query);
  $user = mysqli_fetch_assoc($result);
  
  if ($user) { // if user exists
    if ($user['username'] ==$username) {
      array_push($errors, "Username already exists");
    }

    if ($user['email'] ==$email) {
      array_push($errors, "email already exists");
    }
  }

  // Finally, register user if there are no errors in the form
  if (count($errors) == 0) {
  	$password = md5($password_1);//encrypt the password before saving in the database

  	$query = "INSERT INTO tbl_users (full_name,username, email, password) 
  			  VALUES('$full_name','$username', '$email','$password')";
  	mysqli_query($conn, $query);
  	$_SESSION['username'] = $username;
  	$_SESSION['success'] = "Please Login";
  	header('location: logins.php');
  }
}
// ... 

// LOGIN USER
if (isset($_POST['login_user'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($db, $_POST['password']);
  
    if (empty($username)) {
        array_push($errors, "Username is required");
    }
    if (empty($password)) {
        array_push($errors, "Password is required");
    }
  
    if (count($errors) == 0) {
        $password = md5($password);
        $query = "SELECT * FROM tbl_users WHERE username='$username' AND password='$password'";
        $results = mysqli_query($conn, $query);
        if (mysqli_num_rows($results) == 1) {
          $_SESSION['username'] = $username;
          $_SESSION['success'] = "You are now logged in";
          header('location: index.php');
        }else {
            array_push($errors, "Wrong username/password combination");
        }
    }
  }
  
  ?>
<!DOCTYPE html>
<html>
<head>
  <title>Registration system PHP and MySQL</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <div class="header">
  	
  </div>
	
  <form method="POST" action="register.php">
  	<?php include('errors.php'); ?>
    
	  <div class="text-center">
    <div class="login">
    <h2 class="text-center">Register</h2>
  	  <label>fullname</label>
  	  <input type="text" name="fullname" value="<?php echo $full_name; ?>">
  <br>
  <br>
  	  <label>Username</label>
  	  <input type="text" name="username" value="<?php echo $username; ?>">
      <br>
      <br>
  	  <label>Email</label>
  	  <input type="email" name="email" value="<?php echo $email; ?>">
      <br>
      <br>
  	  <label>Password</label>
  	  <input type="password" name="password_1">
      <br>
      <br>
  	  <label>Confirm password</label>
  	  <input type="password" name="password_2">
      <br>
      <br>
  	  <button type="submit" class="btn-primary" name="reg_user">Register</button>
  
  	<p>
  		Already a member? <a href="logins.php">Sign in</a>
  	</p></div>
  </form>
</body>
</html>
<?php include('partials-front/footer.php'); ?>