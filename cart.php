<?php
error_reporting(0);
 session_start(); 
include 'confige.php';
$sql="SELECT * FROM orderdetails";
$_SESSION['orderid']=mysql_num_rows(mysql_query($sql,$conn))+1;

$sql="SELECT * FROM orderedproductdetails";
$_SESSION['detailid']=mysql_num_rows(mysql_query($sql,$conn));

?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {background-color:lightgray}
</style>
</head>
<?php
if(isset($_POST['submit_cart']))
{
$sql="SELECT stock,price FROM productdetails WHERE productid='".$_SESSION['productid']."'";
$result = mysql_query($sql,$conn);
$row = mysql_fetch_assoc($result);
if($row['stock'] >= $_POST['quantity'])
{  
$sql="UPDATE productdetails SET stock='".($row['stock'] - $_POST['quantity'])."' WHERE productid='".$_SESSION['productid']."'";
$result = mysql_query($sql,$conn);

$sql="INSERT INTO orderedproductdetails VALUES ('".($_SESSION['detailid']+1)."','".$_SESSION['orderid']."','".$_SESSION['productid']."','".$_POST['quantity']."','".$row['price']."')";
$result = mysql_query($sql,$conn);

header('location:category.php');
}
else
{ echo 'select a valid quantity';
echo "<form action='cart.php' method='POST'>";
echo 'quantity:<input type="number" name="quantity" value="1" min="1"><br>';
echo '<input type="submit" name="submit_cart" value="add to cart"><br></form>';
}
}
else
{
$sql="SELECT productid FROM productdetails ";
$result = mysql_query($sql,$conn);
while($row = mysql_fetch_assoc($result))
{ $product=$row['productid'];  
if(isset($_POST[$product]))
{ $sql="SELECT * FROM productdetails WHERE productid='".$product."'";
$result = mysql_query($sql,$conn);
$row = mysql_fetch_assoc($result);
$_SESSION['productid']=$row['productid'];
echo 'productid:'.$row['productid'].'<br> productname'.$row['productname'].'price:'.$row['price'];
echo "<form action='cart.php' method='POST'>";
echo 'quantity:<input type="number" name="quantity" value="1" min="1"><br>';
echo '<input type="submit" name="submit_cart" value="add to cart"><br></form>';
}

}
 echo "<form action='category.php' method='POST'>";
  echo '<input type="submit"  value="back"><br></form>';
}
?>
</html>
