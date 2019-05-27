<?php
  define('FLAG', 'ingeHack{WhenInDoubtDoWithout}');

  $accts = array(
    'administrator' => '2EDaCcdDB',
    'guest' => 'guest',
  );

  function is_valid($username, $password)
  {
    global $accts;

    return array_key_exists($username, $accts) && $accts[$username] === $password;
  }
?>
