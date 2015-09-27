<!Doctype html>
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

$sql = "SELECT orderid from orderdetails Where orderuserid = '".$_SESSION["id"]."'";
$result= mysql_query($sql,$conn);
$i=0;
echo "<div class='row'>";
while($row = mysql_fetch_assoc($result))
{
$sql = "SELECT * from orderedproductdetails Where detailorderid = '".$row["orderid"]."'";
$result1= mysql_query($sql,$conn);
echo '<p style="text-align:center"><------Orderid ='.$row["orderid"].'------></p>';
  while($row1 = mysql_fetch_assoc($result1))
  {$i++;
  if ($i>=5)
  {
     $i=1;
     echo"</div>";
     echo "<div class='row'>";
  }
  echo "<div class=col-sm-3 col-md-3 col-lg-3 style='text-align:center'>";
 
$sql = "SELECT productname from productdetails Where productid = '".$row1['detailproductid']."'";
	$row2 = mysql_fetch_assoc(mysql_query($sql,$conn));

	echo "detailid=".$row1['detailid'].'<br>productid='.$row1['detailproductid'].'<br>productname='.$row2['productname'].'<br>quantity='.$row1['detailquantity'].'<br>price='.($row1['detailquantity']*$row1['detailprice'])."<br><br>";
  echo "</div>";
  }	
  echo "<br><br>";
  if($i==5)
{
  echo "</div>";
  $i=1;
}
}
echo '</div>';
echo "<form action='category.php' method='POST'>";
echo '<input type="submit"  value="back"><br></form>';


?>
</html>