<html>
<head>
</head>
<body>  
<?php
$flag=0;
$db = new SQLite3('mysqlitedb.db');
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $username = test_input($_POST["username"]);
  $password = test_input($_POST["password"]);
  if($username=="admin" && $password=="admin1"){
$flag=1;
	
}
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
   if(document.my.username.value==""){
        alert("Username is required");
        document.my.username.focus();
        return false;
    }
    if(document.my.password.value==""){
        alert("Password is required");
        document.my.password.focus();
        return false;
    }
}
</script>
<h2>Admin Page</h2>
*All fields are required
<form method="post" name="my" onsubmit="return(validate());" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >  
  Username: <input type="text" name="username">
  <br><br>
 Password: <input type="password" name="password">
  <br><br>
 <input type="submit" name="submit" value="Submit">  
</form>
<a href="index.php">Do another registration</a>
<?php
if($flag == 1){
echo "<h2>Records:</h2>";
$results = $db->query('SELECT * FROM records');
echo "<table border='1'>";
echo "<tr>";  
               echo "<td align='center'>". Name ."</td>"; 
        echo "<td align='center'>". Address ."</td>";
echo "<td align='center'>". Email ."</td>"; 
echo "<td align='center'>". Mobile_Number ."</td>"; 
echo "<td align='center'>". Account_Number ."</td>";  
    echo "</tr>"; 
while ($row = $results->fetchArray()) {
echo "<tr>";  
               echo "<td align='center'>". $row[0] ."</td>"; 
        echo "<td align='center'>". $row[1] ."</td>";
echo "<td align='center'>". $row[2] ."</td>"; 
echo "<td align='center'>". $row[3] ."</td>"; 
echo "<td align='center'>". $row[4] ."</td>";  
    echo "</tr>";
}
echo "</table>";
}
?>
</body>
</html>
