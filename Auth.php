<?php
// User authentication code here
session_start();

// Check if the user is logged in
function is_logged_in() {
    return isset($_SESSION['user_id']);
}

// Check user roles (e.g., member, coach, admin)
function check_user_role($role) {
    if (is_logged_in() && $_SESSION['user_role'] == $role) {
        return true;
    }
    return false;
}

// Login function
function login($user_id, $user_role) {
    $_SESSION['user_id'] = $user_id;
    $_SESSION['user_role'] = $user_role;
}

// Logout function
function logout() {
    session_destroy();
    header('Location: login.php'); // Redirect to login page
    exit();
}
?>
