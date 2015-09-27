<?php
include 'confige.php';
$sql = "SELECT * FROM deliverytime";
$result = mysql_query($sql,$conn);
echo '<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {background-color:lightgray}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
 
}
</style>
</head>';

echo '<table style="width:100%">
<tr>
 <th>time</th>
 <th>cost</th>
 <th>description</th>
</tr>';
while($row = mysql_fetch_assoc($result))
{
echo '
<tr>
  <td>'.$row['time'].'</td>
  <td>'.$row['cost'].'</td>
  <td>'.$row['desc'].'</td>
</tr>';
}
echo '</table><br><br>';

echo "<form action='final_cart.php' method='POST'>";
echo '<input type="submit" name="back" value="back"><br></form>';

?>

