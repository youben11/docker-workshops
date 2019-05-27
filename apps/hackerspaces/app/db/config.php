<?php
   define('DB_SERVER', 'mariadb');
   // The DB credentials should not be be stored in source control, but they are include here to provide a complete example.  
   define('DB_USERNAME', 'root');
   define('DB_PASSWORD', 'blackxor');
   define('DB_DATABASE', 'hsqli');
   $db = new mysqli(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);
   $db->set_charset("utf8");
?>
