<?php
include 'config.php';
session_start();
$wrongemail="";
$wrongpassword="";

// used if already login
if(isset($_SESSION["userlogin"]))
	header("Location: index.php");

	// used if post request actually sent or initial page relaoding
if(isset($_POST["email"])){

	$email=$_POST["email"];
	$password=$_POST["password"];
	
	$sql="SELECT * FROM `data` WHERE `email` LIKE '$email'";

	$row=mysqli_query($conn,$sql) or die(mysqli_error());
	
			while($r=mysqli_fetch_assoc($row)){
				if($r["password"]==$password)
				{
					$_SESSION["userlogin"]=$email;
		
					if($r["category"]=="admin")
						header("Location: admin.php");
					else
						header("Location :index.php");
		
				}
				else
					$wrongpassword="You entered wrong password.";

			}

		if(mysqli_num_rows($row)==0)
			$wrongemail="User not registered with us.";

	

	


}


?>



<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<?php if($wrongpassword):?>                   
               <div class="alert bg-danger alert-icon-left alert-dismissible mb-2" role="alert">
                 <span class="alert-icon"><i class="la la-thumbs-o-down"></i></span>
                 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                 <strong>Oh snap ! </strong> <?php echo htmlentities($wrongpassword); ?>
               </div>
           <?php endif;?>

            <?php if($wrongemail):?>                   
               <div class="alert bg-danger alert-icon-left alert-dismissible mb-2" role="alert">
                 <span class="alert-icon"><i class="la la-thumbs-o-down"></i></span>
                 <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                 <strong>Oh snap ! </strong> <?php echo htmlentities($wrongemail); ?>
               </div>
          <?php endif;?>
				
			
			<form class="login100-form validate-form" method="post" action="login.php">
					<span class="login100-form-title p-b-49">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Email is reauired">
						<span class="label-input100">Email</span>
						<input class="input100" type="email" name="email" placeholder="Type your Email">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="password" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name="login">
								Login
							</button>
							

						</div>
						
					
							
						
					</div>
					<div><span class="txt1 p-b-17">
						<br>Don't have an account? <br>
					</span>
					<a href="./register.php" class="txt2" >
						<b> Sign Up now </b>
					</a>
				</div>
					

					<div class="txt1 text-center p-t-54 p-b-20">
						

						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17">
							Not a customer?
						</span>

						<a href="./admin-login.html" class="txt2">
							Admin Login
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>