<form name="edit_form" action="admin_system.php?menu=terminals&action=edit&id=ID" method="post">
				<?php					
					$types=get_types();
					foreach($types as $type)											
						echo "<option value=\"$type->id\">$type->name</option>";					
				?>
			 </select><br><br>