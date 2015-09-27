<?php session_start(); ?>
<!DOCTYPE html>
<html>
<?php
// register
include 'confige.php';
if(!isset($_POST['submit_register']))
{ 
echo "<form action='register.php' method='POST'>";
echo 'username:<input type="text" name="id" value="username"><br>';
echo 'password:<input type="password" name="pass" value="password"><br>';
echo 'password:<input type="email" name="email" value="email"><br>';
echo 'first name:<input type="text" name="fname"><br>';
echo 'last name:<input type="text" name="lname"><br>';
echo 'address:<input type="text" name="address" ><br>';
echo 'State:<input type="text" name="state"><br>';
echo 'City:<input type="text" name="city"><br>';
echo 'Zip:<input type="text" name="zip"><br>';
echo 'phone number1:<input type="number" name="phone_number1" min="0" max="9999999999"><br>';
echo '<input type="submit" name="submit_register" value="submit"><br></form>';

}
else
{ $phone1=True;$result=False;
//phone number check
if(strlen((string)($_POST['phone_number1']))!=10 and strlen((string)($_POST['phone_number1']))!=8)
$phone1=False;


$date = date('Y-m-d H:i:s');

// Query
$sql = "INSERT INTO userdetails VALUES('".$_POST['id']."','".$_POST['email']."','".$_POST['pass']."','".$_POST['fname']."','".$_POST['lname']."','".$_POST['address']."','".$_POST['state']."','".$_POST['city']."','".$_POST['zip']."','".$_POST['phone_number1']."','".$date."')";

if(!$phone1)
echo 'invalid phone number1<br>';
else
$result=mysql_query($sql,$conn);


if($result)
   {
   header('Location: category.php');
   }

if($phone1 and !$result)
{echo 'user exits<br>';}

if(!$result or !$phone1 )
{
echo "<form action='register.php' method='POST'>";
echo 'username:<input type="text" name="id" value="username"><br>';
echo 'password:<input type="password" name="pass" value="password"><br>';
echo 'password:<input type="email" name="email" value="email"><br>';
echo 'first name:<input type="text" name="fname"><br>';
echo 'last name:<input type="text" name="lname"><br>';
echo 'address:<input type="text" name="address" ><br>';
echo 'State:<input type="text" name="state"><br>';
echo 'City:<input type="text" name="city"><br>';
echo 'Zip:<input type="text" name="zip"><br>';
echo 'phone number1:<input type="number" name="phone_number1" min="0" max="9999999999"><br>';
echo '<input type="submit" name="submit_register" value="submit"><br></form>';
}   

}
mysql_close($conn);
?> 
</html>
