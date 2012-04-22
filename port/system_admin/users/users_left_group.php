<?php
include_once("users_db_funs.php");

if (isset($_GET['action']))
{
    if ($_GET['action'] == 'delete')
    {
        $user_id = $_GET['id'];
        delete_user($user_id);
    }
    elseif ($_GET['action'] == 'edit')
    {
        $user_id = $_GET['id'];
        $pass = $_POST['password'];
        $level = $_POST['level'];
        $name = $_POST['name'];
        if ($_FILES['image']['name'] && $_FILES['image']['type'])
        {
            $imgType = $_FILES['image']['type'];
            $imgName = $_FILES['image']['name'];

            if ($imgType != 'image/jpeg')
            {
                echo '<script>alert( "Wrong picture format (jpg allowed)" );</script>';
            }
            elseif (!move_uploaded_file($_FILES['image']['tmp_name'], '../photos/' . $imgName))
            {
                echo '<script>alert( "The file hasn\'t been copied, some error occured..." );</script>';
            }
            else
            {
                // usuwamy stary obrazek z folderu photos
                $oldPicture = get_user_by_id($user_id)->url_Obrazka;
                if ($oldPicture != NULL)
                    unlink('../photos/' . $oldPicture);
                $error=update_user($user_id, $name, $pass, $level, $imgName);
            }
        }
        else
        {
            $error=update_user($user_id, $name, $pass, $level);
        }
    }
    elseif ($_GET['action'] == 'add')
    {
        $pass = $_POST['password'];
        $level = $_POST['level'];
        $name = $_POST['name'];
        if ($_FILES['image']['name'] && $_FILES['image']['type'])
        {
            $imgType = $_FILES['image']['type'];
            $imgName = $_FILES['image']['name'];

            if ($imgType != 'image/jpeg')
            {
                echo '<script>alert( "Wrong picture format (jpg allowed)" );</script>';
            }
            elseif (!move_uploaded_file($_FILES['image']['tmp_name'], '../photos/' . $imgName))
            {
                echo '<script>alert( "The file hasn\'t been copied, some error occured..." );</script>';
            }
            else
            {
                $error=insert_user($name, $pass, $level, $imgName);
            }
        }
        else
            $error=insert_user($name, $pass, $level);
    }
}
?>
<div>
    <input class="button baseFont add" type="button" value="Add user" onClick="add_toggle()">
    <hr class="line">
    <form action="admin_system.php?menu=users&action=show" method="post">

        <br>
        <div style="float: left; line-height: 21px;">
            Login:&nbsp;<br>
            Level:
        </div>
        <input name="name_filter" class="edit baseFont" type="text" placeholder="Type name here">	
        <select name="level_filter" class="baseFont select">
<?php
$levels = get_levels();
echo "<option value=\"%\">All</option>";
foreach ($levels as $level)
    echo "<option value=\"$level\">$level</option>";
?>
        </select>
        <input class="button baseFont add" type="submit" value="Show">
    </form>
</div><br>
<div class="users_list overf">
    <?php
    if (isset($_POST['name_filter']) && $_POST['user_name'] != 'Surname')
        $name = $_POST['name_filter'];
    else
        $name = '';
    if (isset($_POST['level_filter']))
        $level = $_POST['level_filter'];
    else
        $level = "%";
    $users = select_users($name, $level);
    if ($users)
        foreach ($users as $user)
        {
            echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
            echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='admin_system.php?menu=users&id=$user->id'\">$user->nazwa</td>";
            echo "<td class=\"delete right_column\" onClick=\"del( 'Are you sure?', 'admin_system.php?menu=users&action=delete&id=$user->id' )\">Delete</td></tr>";
            echo "<tr><td class=\"level\">$user->funkcja</td>";
            echo "<td class=\"edit\" onClick=\"edit_toggle( $user->id )\">Edit</td></tr>";
            echo "</table><br>";
        }
    ?>	
</div>