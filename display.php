<?php session_start(); 
include 'confige.php';
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
$sql="SELECT productid FROM productdetails ";
$result = mysql_query($sql,$conn);
while($row = mysql_fetch_assoc($result))
{ $product=$row['productid'];  
if(isset($_POST[$product]))
{ $sql="SELECT * FROM productdetails WHERE productid='".$product."'";
$result = mysql_query($sql,$conn);
$row = mysql_fetch_assoc($result);
echo "<div class='row'>";
echo "<div class='col-sm-12 col-md-12 col-lg-12'>";
if($row['productid']<1000)
{
   echo "<img src='".$row['image']."' alt='Image' style='width:100px;height:200px'>";
}
else
{
echo "<img src='".$row['image']."' alt='Image' style='width:150px;height:200px'>";
}
echo "</div>";
echo "</div>";
echo "</br>";
echo "<div class='row'>";
echo "<div class='col-sm-12 col-md-12 col-lg-12'>";
echo "<p>Product id : ".$row['productid']."</p>";
echo "</div>";
echo "</div>";
echo "<div class='row'>";
echo "<div class='col-sm-12 col-md-12 col-lg-12'>";
echo "<Name : >".$row['productname']."</p>";
echo "</div>";
echo "</div>";
echo "<div class='row'>";
echo "<div class='col-sm-12 col-md-12 col-lg-12'>";
echo "Price : ".$row['price']."</p>";
echo "</div>";
echo "</div>";
echo "<div class='row'>";
echo "<div class='col-sm-4 col-md-4 col-lg-4'>";
echo "<p>Description : ".$row['longdesc']."</p>";
echo "</div>";
echo "</div>";
echo "<div class='row';style='align-text:left'>";
echo "<div class='col-sm-12 col-md-12 col-lg-12'>";
echo "<p>Category : ".$row['category']."</p>";
echo "</div>";
echo "</div>";
echo "<div class='row';style='align-text:left'>";
echo "<div class='col-sm-12 col-md-12 col-lg-12'>";
echo "<p>Stock : ".$row['stock']."</p>";
echo "</div>";
echo "</div>";

}
}
 echo "<form action='category.php' method='POST'>";
  echo '<input type="submit"  value="back"><br></form>';

?>
</html>
