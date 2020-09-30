
<?php
include('config.php');
// fetching admin email where mail will send

 /* $sql ="SELECT emailId from tblemail";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0):
foreach($results as $result):
$adminemail=$result->emailId;
endforeach;
endif;
*/
if(isset($_POST['submit']))
{
// getting Post values
$name=$_POST['name'];
$email=$_POST['email'];

$password=$_POST['password'];
$contact=$_POST['contact'];

// Insert quaery
$sql="INSERT INTO  tblcustomer(cust_name,cust_email,cust_mobile,cust_password) VALUES(:fname,:email,:mobile,:password)";
$query = $dbh->prepare($sql);
// Bind parameters
$query->bindParam(':fname',$name,PDO::PARAM_STR);
$query->bindParam('email',$email,PDO::PARAM_STR);
$query->bindParam(':password',$password,PDO::PARAM_STR);
$query->bindParam(':mobile',$contact,PDO::PARAM_STR);

$query->execute();

$lastInsertId = $dbh->lastInsertId();
if ($_POST['password']!= $_POST['re_password'])
{
    echo("Oops! Passwords  did not match! Try again. ");
}



 else {
     if($lastInsertId)
{



    header("Location:login.php");
//echo "<script>alert('Registration successful.');</script>";
}
else
{
echo "<script>alert('Something went wrong. Please try again');</script>";
}
 }


}


?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up </title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/register/style-register.css">
    
</head>
<body>

    <div class="main" >

        <section class="signup" >
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container" >
                <div class="signup-content"  style="background-image: url('images/bg-01.jpg');">
                    <form method="POST" id="signup-form" class="signup-form">
                        <h2 class="form-title">Create new account</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Your Email"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="password" id="password" placeholder="Password"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Repeat your password"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="contact" id="contact" placeholder="Your  contact number"/>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="login.php" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main-register.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>