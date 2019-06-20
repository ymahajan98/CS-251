<html>
<head>
</head>
<body>  
<?php
$name = $email = $gender = $comment = $website = "";
$db = new SQLite3('mysqlitedb.db');
$db1 = new SQLite3('accounts.db');
$db->query("create table records(name varchar(100),address varchar(100),email varchar(100),mobile varchar(100),account varchar(100),password varchar(100))"); 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = test_input($_POST["name"]);
  $address = test_input($_POST["address"]);
  $email = test_input($_POST["email"]);
  $mobile = test_input($_POST["mobile"]);
  $account = test_input($_POST["account"]);
  $password = test_input($_POST["password"]);
  $query1 = "SELECT * FROM records WHERE email='$email'";
  
  $results=$db->query($query1);
  if(!($results->fetchArray() )){
	$query78="SELECT * from password where account='$account'";
	$resultp=$db1->query($query78);
	$row4=$resultp->fetchArray();
      if($password == $row4[1]){
          $query3 = "SELECT * FROM balance WHERE account='$account'";
          $results1=$db1->query($query3);
          $row2=$results1->fetchArray();
          if($row2[1]<1000){
              $message3="Insufficient Balance";
  echo "<script type='text/javascript'>alert('$message3');</script>";
          }
          else{
              $tempbal=$row2[1]-1000;
    $query4="update balance set balance='$tempbal' where account='$row2[0]'";
   $result56=$db1->query($query4); 
      $qstr = "insert into records values ('$name','$address', '$email', '$mobile','$account', '$password')";
              $insres = $db->query($qstr);
                $message8="Successful Registration";
  echo "<script type='text/javascript'>alert('$message8');</script>";

          }
      }
      else{
       $message1="Invalid Account/Password";
  echo "<script type='text/javascript'>alert('$message1');</script>";
      }
  }
  else{
      $message="Already registered";
  echo "<script type='text/javascript'>alert('$message');</script>";}
}
function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>
<script type="text/javascript">
function validate(){
    var letters = /^[A-Za-z' ']+$/;
    var numbers= /^[0-9]+$/;
    var alpha=/^[A-z0-9]+$/;
    var mail1=/^[A-z]+['@'][A-z]+['.']['c']['o']['m']$/;
    if(document.my.name.value=="" || document.my.name.value.length > 20 || !(document.my.name.value.match(letters)) ){
        alert("Name is required and it should consist of alphabet and spaces and should be less than 21 characters.");
        document.my.name.focus();
        return false;
    }
    if(document.my.address.value=="" || document.my.address.value.length > 100){
         alert("Address is required and should be less than 101 characters.");
        document.my.address.focus();
        return false;
    }
var emai=document.my.email.value;
    if(!emai.match(mail1) || emai=="" ){
        alert("E-mail is required and should be entered in valid format");
        document.my.email.focus();
        return false;
    }
     if(document.my.mobile.value=="" || document.my.mobile.value.length != 10 || !(document.my.mobile.value.match(numbers)) ){
        alert("Mobile number should be 10 digit numeric value");
        document.my.mobile.focus();
        return false;
    }
 if(document.my.account.value=="" || document.my.account.value.length != 5 || !(document.my.account.value.match(numbers)) ){
        alert("Account number should be 5 digit numeric value");
        document.my.account.focus();
        return false;
    }
    if(document.my.password.value=="" ||document.my.password.value.length >20 || !document.my.password.value.match(alpha)){
        alert("Password is alphanumeric and less than 21 characters");
        document.my.password.focus();
        return false;
    }
}
</script>
<h2>CS-251 Assignment 2</h2>
*All fields are required
<form method="post" name="my" onsubmit="return(validate());" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >  
  Name: <input type="text" name="name">
  <br><br>
  Address: <input type="text" name="address">
  <br><br>
E-mail: <input type="text" name="email">
  <br><br>
Mobile Number: <input type="text" name="mobile">
  <br><br>
Account: <input type="text" name="account">
  <br><br>
 Password: <input type="password" name="password">
  <br><br>
 <input type="submit" name="submit" value="Submit">  
</form>
<a href="admin.php">See all registrations</a>

</body>
</html>
