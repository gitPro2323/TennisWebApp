<?php
// Function to create a new coach profile
function create_coach_profile($name, $bio) {
    global $conn;
    $name = mysqli_real_escape_string($conn, $name);
    $bio = mysqli_real_escape_string($conn, $bio);
    
    $sql = "INSERT INTO coaches (name, bio) VALUES ('$name', '$bio')";
    
    if (mysqli_query($conn, $sql)) {
        return true;
    } else {
        return false;
    }
}
?>
