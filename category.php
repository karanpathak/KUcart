<?php session_start(); ?>
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
echo "<h1 style='text-align:center ; color:darkblue'>KUcart</h1>";
echo "<div class='container-fluid'>";
echo "<div class='row'>";
echo "<div class='col-sm-6 col-md-6 col-lg-6'>";
echo 'Hello '.$_SESSION["name"].'!<br> <br>';
?>
   </div>
   <div class="col-sm-6 col-md-6 col-lg-6" style="text-align:right">
   <form action='payment.php' method='POST'>
<input type="submit" name="logout" value="logout"><br></form>
   </div>
</div>
<div class='row'>
<div class='col-sm-3 col-md-3 col-lg-3' style='background-color:lavender; text-align:center'>
<h4>BOOKS</h4>
<ul style="list-style-type:none">
  <li><a href="books.php">Computer science</a></li>
  </br>
</ul>
</div>
<div class='col-sm-3 col-md-3 col-lg-3' style='background-color:lavenderblush; text-align:center'>
<h4>ELECTRONICS</h4>
<ul style="list-style-type:none">
  <li><a href="electronics.php">Phones</a></li>
  </br>
</ul>
</div>
<div class='col-sm-3 col-md-3 col-lg-3' style='background-color:lavender; text-align:center'>
<h4>FOOTWEAR</h4>
<ul style="list-style-type:none">
  <li><a href="footwear_men.php">Mens</a></li>
  <li><a href="footwear_women.php">Womens</a></li>
</ul>
</div>  
<div class='col-sm-3 col-md-3 col-lg-3' style='background-color:lavenderblush; text-align:center'>
<h4>WATCHES</h4>
<ul style="list-style-type:none">
<li><a href="watches_men.php">Mens</a></li>
<li><a href="watches_women.php">Womens</a></li>
</ul>  
</div>
</div>
</div>
<form action='my_cart.php' method='POST'>
<input type="submit" name="my_cart" value="show cart"><br></form>
</html>
