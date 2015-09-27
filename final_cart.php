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
include 'confige.php';
session_start(); 
echo 'your order id:'.$_SESSION['orderid'];
$sql="SELECT * FROM userdetails WHERE userid='".$_SESSION["id"]."'";
$result = mysql_query($sql,$conn);
$user = mysql_fetch_assoc($result);

$amount=0;
$sql="SELECT detailprice,detailquantity FROM orderedproductdetails WHERE detailorderid='".$_SESSION["orderid"]."'";
$result = mysql_query($sql,$conn);
while($order = mysql_fetch_assoc($result))
{
$amount+=($order['detailprice']*$order['detailquantity']);
}
$_SESSION['amount']=$amount;
echo "<pre style='background-color:darkgray;'>Address Details : <form action='payment.php' method='POST'>
 username : <input type='text' name='orderreceivername' value='".$user['userfname']."'><br>
 email    : <input type='email' name='useremail' value='".$user['useremail']."'><br>
 address  : <input type='text' name='useraddr' value='".$user['useraddr']."'><br>
 State    : <input type='text' name='userstate' value='".$user['userstate']."'><br>
 City     : <input type='text' name='usercity' value='".$user['usercity']."'><br>
 Phone no : <input type='number' name='userphone' min='0' max='9999999999' value='".$user['userphone']."'></pre>
 Your trackno. is ".$_SESSION['orderid']."<br>
 </pre>
 Order amount : Rs.".$amount." + delivery charges<br>
 Payment options : <br>
 
 <input type='radio' name='payment' id='cash' value='cash' checked='checked'>
 <label for='cash'>CASH</label>  <br>

 <input type='radio' name='payment' id='Debit card' value='Debit card'>
 <label for='Debit card'>Debit card</label>  <br>
 
 <input type='radio' name='payment' id='Credit card' value='Credit card'>
 <label for='Credit card'>Credit card</label>  <br>

<input type='radio' name='payment' id='EMI' value='EMI'>
 <label for='EMI'>EMI</label>  <br>

Delivery type:<br>
 
 <input type='radio' name='delivery' id='24hrs' value='24hrs'>
 <label for='24hrs'>24hrs</label>  <br>

 <input type='radio' name='delivery' id='2-3days' value='2-3days'>
 <label for='2-3days'>2-3 days</label>  <br>
 
 <input type='radio' name='delivery' id='7-8days' value='7-8days' checked='checked'>
 <label for='7-8days'>7-8days</label>  <br>
<input type='submit' name='place_order' value='place order'><br></form>";

echo "SHOW PAYMENT POLICY";
echo "<form action='payment_option.php' method='POST'>";
echo '<input type="submit"  value="show"><br></form>';



echo "SHOW DELIVERY POLICY";
echo "<form action='delivery.php' method='POST'>";
echo '<input type="submit"  value="show"><br></form>';


echo "<form action='my_cart.php' method='POST'>";
echo '<input type="submit"  value="back"><br></form>';

?>
