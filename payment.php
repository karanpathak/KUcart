<?php
echo'<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {background-color:lightgray}
</style>
</head>';

include 'confige.php';
session_start(); 
if(isset($_POST['place_order']))
{ 
$sql="SELECT  cost  FROM deliverytime WHERE time='".$_POST['delivery']."'";
$result = mysql_query($sql,$conn);
$row=mysql_fetch_assoc($result);

$date = date('Y-m-d H:i:s');
$sql="INSERT INTO orderdetails  VALUES ('".$_SESSION['orderid']."','".$_SESSION['id']."','".$_POST['orderreceivername']."','".$_POST['useremail']."','".$_POST['useraddr']."','".$_POST['userstate']."','".$_POST['usercity']."','".$_POST['userphone']."','".$date."','".$_SESSION['orderid']."','".$_POST['payment']."','".($_SESSION['amount']+$row['cost'])."','".$_POST['delivery']."')";
if(mysql_query($sql,$conn))
{
echo 'Congratulations! Your order is successfully placed!<br>Order will be delivered in : '.$_POST['delivery'];
echo '<br>Orderid : '.$_SESSION['orderid'].'<br>Reciever name : '.$_POST['orderreceivername'].'<br>Amount : Rs.'.($_SESSION['amount']+$row['cost']);
}
else
echo 'Sorry something went wrong!';


echo "<form action='payment.php' method='POST'>";
  echo '<input type="submit" name="logout" value="logout"><br></form>';

}

if(isset($_POST['logout']))
{ echo '<div align="center">';
echo $_SESSION["name"].' Thank you for visiting';
echo '<br><br> LOGIN';
echo '<form  action="index.php" method="POST">';
echo '<br><input type="submit"  value="login"><br></form>';
echo '</div>';
session_unset();
session_destroy(); 
}
mysql_close($conn);
?>

</html>

