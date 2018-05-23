<?php

/**
* Crucial Functions for Application
*
* @package tpc_tutorials
* @file    /includes/functions.inc.php
*
* Redirects to specified page
*
* @param string $page Page to redirect user to
* @return void
*/

function redirect($page) {
    header('Location: ' . $page);
    exit();
}

/**
* Check login status
*
* @return boolean Login status
*/

function check_login_status() {
// If $_SESSION['logged_in'] is set, return the status
if (isset($_SESSION['logged_in'])) {
    return $_SESSION['logged_in'];
}
    return false;
}

?>