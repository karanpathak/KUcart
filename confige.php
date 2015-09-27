<?php
$db_username = 'root';
$db_password = '';
$db_name = 'ecommerce';
$db_host = 'localhost';

$conn= mysql_connect("$db_host","$db_username","$db_password") ;
mysql_select_db("$db_name");
?>
