<?php
	include_once("payments_db_funs.php");
	if( isset( $_GET['action'] )) 
	{
		if(isset($_GET['id']))
		{					if( $_GET['action'] == 'delete' ) 
			{				$payment_id = $_GET['id'];				delete_payment($payment_id);			} 		
			else if( $_GET['action'] == 'edit' ) 
			{ // edycja oplaty				$payment_id = $_GET['id'];
				$value= $_POST['value'];				modify_payment($payment_id, $value);						}
		}				
		else 
			if( $_GET['action'] == 'add' ) 
			{				$contractor_id = $_POST['contractor'];
				$value = $_POST['value'];												add_payment($contractor_id, $value);			}		}
	if( isset( $_GET['status'] ) )
	{
		$payment_id = $_GET['id'];
		$status = $_GET['status'];
		change_status($payment_id, $status);
	}?><div>	<input class="button baseFont add" type="button" value="Add new payment" onClick="add_toggle()">	<hr class="line">	<br>	<div style="float: left; line-height: 21px;">		Contractor:<br>		Type:<br>		Amount:<br>		Date:<br>	</div>	<form action="?menu=payments&action=show" method="post">		<div style="margin-left: 69px;">			<input name="contractor" class="edit baseFont" type="edit" placeholder="Name of contractor">			<select name="type" class="baseFont select">				<?php					
					$types=get_payment_types();
					foreach($types as $type)											
						echo "<option value=\"$type\">$type</option>";					
				?>			</select>			<br>			<input name="from_value" class="ship_edit baseFont" type="text" disabled="true" placeholder="From">			<input name="to_value" class="ship_edit baseFont" type="text" disabled="true" placeholder="To">			<input name="value_check" type="checkbox" onClick="on_off_edit('value')">			<input name="from_date" class="ship_edit baseFont" type="text" disabled="true" placeholder="From">			<input name="to_date" class="ship_edit baseFont" type="text" disabled="true" placeholder="To">			<input name="date_check" type="checkbox" onClick="on_off_edit('date')">			<label><input name="paid_check" type="checkbox">Paid</label>			<label><input name="unpaid_check" type="checkbox">Not paid</label><br>		</div>	<input class="button baseFont add" type="submit" value="Show">	</form></div><br><div class="payments_list overf">	<?php				if( isset($_POST['contractor']) && $_POST['contractor']!='Name of contractor') 						$contractor = $_POST['contractor'];
		else 
			$contractor='';							
		if( isset($_POST['type'])) 						$type = $_POST['type'];
		else
			$type='';		
		if( isset($_POST['from_value'])) 						$valueMin = $_POST['from_value'];
		else
			$valueMin='';
		if( isset($_POST['to_value'])) 						$valueMax = $_POST['to_value'];
		else
			$valueMax='';
		if( isset($_POST['from_date'])) 						$dateMin = $_POST['from_date'];
		else
			$dateMin='';
		if( isset($_POST['to_date'])) 						$dateMax = $_POST['to_date'];
		else
			$dateMax='';
		if( isset($_POST['paid_check']) && !isset($_POST['unpaid_check'])) 						$paid = 1;
		elseif( !isset($_POST['paid_check']) && isset($_POST['unpaid_check']))
			$paid = 0;
		else $paid='';											 
		$payments=select_payments($contractor, $valueMin, $valueMax, $dateMin, $dateMax, $paid, $type);
		if($payments)
			foreach($payments as $payment)
			{										  	echo "<a href=\"port.php?menu=payments&id=$payment->id\">";
			  	echo "<div class=\"name float_left left_col align_cols link\">";				echo "$payment->contractor";				echo "</div></a>";				echo	"<a href=\"port.php?menu=payments&action=delete&id=$payment->id\">";
				echo  "<div onclick=\"return confirm('Are you sure?')\" class=\" delete float_left right_col align_cols link\">";				echo	"Delete";				echo "</div></a><div class=\"level float_left left_col align_cols\">";				echo "$payment->value $</div>";								echo "<a href=\"#\" onClick=\"edit_toggle( $payment->id )\"><div class=\"change float_left right_col align_cols link\">";				echo "Edit</div></a><br><br><br>";
			}		?>	</div>