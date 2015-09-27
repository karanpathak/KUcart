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
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            width: 100%;
        }

        body {
            display: table;
        }

        .my-block {
            text-align: center;
            display: table-cell;
            vertical-align: middle;
		  color: green
        }
        </style>
</head>
<?php
// LOGIN
$res=True;
include 'confige.php';
if(!isset($_POST['submit_user']))
{ 
echo "<div class='my-block'>";
echo "<h1 style='text-align:center'>KUcart Login</h1>";
echo '<form method="POST" action="'.$_SERVER["PHP_SELF"].'">';
echo 'username:<input type="text" name="id" value="username"><br>';
echo 'password:<input type="password" name="pass" value="password"><br>';
echo '<input type="submit" name="submit_user" value="submit"><br></form>';
echo '<br> <br>';
echo 'new user';
echo "<form action='register.php' method='POST'>";
echo '<input type="submit" name="submit" value="register"><br></form>';
echo "</div>";
}
else
{ 
echo $_POST['id'];
$sql = "SELECT * from userdetails Where userid = '".$_POST['id']."'";
$result = mysql_query($sql,$conn);
    if($result)
    { if(mysql_num_rows($result) > 0) 
      {
        while($row = mysql_fetch_assoc($result)) 
       {    // password 
            if($row["userpass"]==$_POST['pass'])
             { $sql = "SELECT userfname from userdetails Where userid = '".$_POST['id']."'"; $result = mysql_query($sql,$conn);
               $row = mysql_fetch_assoc($result);
               $_SESSION["id"] = $_POST['id'];
               $_SESSION["name"]=$row['userfname'];
               header('Location: category.php');
             }
            else
             $res=False;
             
      }
     }
     else
     $res=False;
    }
    else
    $res=False;
  // if login fails   
    if(!$res) 
  {echo "<div class='my-block'>";
echo "<h1 style='text-align:center'>KUcart Login</h1>"; 
echo "<form action='index.php' method='POST'>";
   echo 'username:<input type="text" name="id" value="username"><br>';
   echo 'password:<input type="password" name="pass" value="password"><br>';
   echo '<input type="submit" name="submit_user" value="submit"><br></form>';
   echo 'invalid username/password<br><br>';
   echo "<form action='register.php' method='POST'>";
    echo '<input type="submit" name="submit" value="register"><br></form>';
echo "</div>";
   }

}
mysql_close($conn);
?> 
</html>

