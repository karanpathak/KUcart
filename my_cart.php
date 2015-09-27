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
session_start(); 
error_reporting(0);
include 'confige.php';
$sql="SELECT * FROM orderedproductdetails WHERE detailorderid='".$_SESSION['orderid']."'";
$result = mysql_query($sql,$conn);
if(mysql_num_rows($result)==0)
{echo 'NO ITEM IN CART<br><br>';}
$i=0;
echo "<div class='row'>";
while($row = mysql_fetch_assoc($result))
{ 
$pro=$row['detailid'];
if(isset($_POST[$pro]))
{ //delete order

$sql="SELECT stock FROM productdetails WHERE productid='".$row['detailproductid']."'";
$result1 = mysql_query($sql,$conn);
$row1 = mysql_fetch_assoc($result1);

$sql="UPDATE productdetails SET stock='".($row['detailquantity'] + $row1['stock'])."' WHERE productid='".$row['detailproductid']."'";
$result1 = mysql_query($sql,$conn);

$sql="DELETE FROM orderedproductdetails WHERE detailid='".$row['detailid']."'";
$result1 = mysql_query($sql,$conn);
header('Location: my_cart.php');
}

// show order
$i++;
  if ($i>=5)
  {
     $i=1;
     echo"</div>";
     echo "<div class='row'>";
  }
echo "<div class=col-sm-3 col-md-3 col-lg-3 style='text-align:center'>";
echo 'Orderid : '.$row['detailorderid'].'<br>Productid : '.$row['detailproductid'].'<br>Quantity : '.$row['detailquantity'].'<br>Price : '.($row['detailprice']*$row['detailquantity']);
  echo "<form action='my_cart.php' method='POST'>
 <input type='submit' name='".$row['detailid']. "' value='delete'><br></form>
 <br><br>";
echo "</div>";
}
if($i==5)
{
  echo "</div>";
}
echo "</div>";
echo "<div class='row'>";
echo "<form action='category.php' method='POST'>";
  echo '<input type="submit"  value="   back"><br></form>';
echo "<form action='final_cart.php' method='POST'>";
  echo '<input type="submit" name="proceed" value="   proceed to payment"><br></form>';
echo "</div>";	
?>
</html>
