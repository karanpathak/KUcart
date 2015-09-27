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
echo "<div class='row'>";
echo "<form action='category.php' method='POST'>";
  echo '<input type="submit"  value="  Back to Categories"><br></form>';
echo "</br>";
echo "</div>";
$sql="SELECT * FROM productdetails WHERE category='4'";
$result = mysql_query($sql,$conn);
$i=0;
echo "<div class='row'>";
while($row = mysql_fetch_assoc($result))
{$i++;
  if ($i>=5)
  {
     $i=1;
     echo"</div>";
     echo "<div class='row'>";
  }
    echo "<div class=col-sm-3 col-md-3 col-lg-3 style='text-align:center'>";
    echo "<img src='".$row['image']."' alt='Image' style='width:150px;height:200px'>";
    echo "</br>"; 
echo "ID : ".$row['productid']."<br>".$row['productname']."</br>Rs.".$row['price']."</br></br>";
  echo "<form action='display.php' method='POST'>";
  echo '<input type="submit" name="'.$row['productid'].'" value="details"><br></form>';
  echo "<form action='cart.php' method='POST'>";
  echo '<input type="submit" name="'.$row['productid'].'" value="Add to cart"><br></form><br>';
echo "</div>";  
}
mysql_close($conn);
?>
</html>
