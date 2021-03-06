<?php
	include_once("payments_db_funs.php");

	if( isset( $_GET['action'] )) 
	{
		if(isset($_GET['id']))
		{		
			if( $_GET['action'] == 'delete' ) 
			{
				$payment_id = $_GET['id'];
				$error=delete_payment($payment_id);
			} 		
			else if( $_GET['action'] == 'edit' ) 
			{ // edycja oplaty
				$payment_id = $_GET['id'];
				$value= $_POST['value'];
				$error=modify_payment($payment_id, $value);			
			}
		}				
		else 
			if( $_GET['action'] == 'add' ) 
			{
				$contractor_id = $_POST['contractor'];
				$value = $_POST['value'];								
				add_payment($contractor_id, $value);
			}	
	}
	if( isset( $_GET['status'] ) )
	{
		$payment_id = $_GET['id'];		
		set_as_paid($payment_id);
	}
?>
<div>
	<input class="button baseFont add" type="button" value="Add new payment" onClick="add_toggle()">
	<hr class="line">
	<br>
	<div style="float: left; line-height: 21px;">
		Contractor:<br>
		Type:<br>
		Amount:<br>
		Date:<br>
	</div>
	<form action="?menu=payments&action=show" method="post">
		<div style="margin-left: 69px;">
			<input name="contractor_filter" class="edit baseFont" type="edit" placeholder="Name of contractor">
			<select name="type_filter" class="baseFont select">
				<option value="">Wszystkie portowe</option>
				<?php					
					$types=get_payment_types();
					foreach($types as $type)											
						echo "<option value=\"$type\">$type</option>";					
				?>
			</select>
			<br>
			<input name="from_value" class="ship_edit baseFont" type="text" disabled="true" placeholder="From">
			<input name="to_value" class="ship_edit baseFont" type="text" disabled="true" placeholder="To">
			<input name="value_check" type="checkbox" onClick="on_off_edit('value')">
			<input name="from_date" class="ship_edit baseFont" type="text" disabled="true" placeholder="From">
			<input name="to_date" class="ship_edit baseFont" type="text" disabled="true" placeholder="To">
			<input name="date_check" type="checkbox" onClick="on_off_edit('date')">
			<label><input name="paid_check" type="checkbox">Paid</label>
			<label><input name="unpaid_check" type="checkbox">Not paid</label><br>
		</div>
	<input class="button baseFont add" type="submit" value="Show">
	</form>
</div><br>
<div class="payments_list overf">
	<?php		
		if( isset($_POST['contractor_filter']) && $_POST['contractor_filter']!='Name of contractor') 			
			$contractor = $_POST['contractor_filter'];
		else 
			$contractor='';							
		if( isset($_POST['type_filter'])) 			
			$type = $_POST['type_filter'];
		else
			$type='';		
		if( isset($_POST['from_value'])) 			
			$valueMin = $_POST['from_value'];
		else
			$valueMin='';
		if( isset($_POST['to_value'])) 			
			$valueMax = $_POST['to_value'];
		else
			$valueMax='';
		if( isset($_POST['from_date'])) 			
			$dateMin = $_POST['from_date'];
		else
			$dateMin='';
		if( isset($_POST['to_date'])) 			
			$dateMax = $_POST['to_date'];
		else
			$dateMax='';
		if( isset($_POST['paid_check']) && !isset($_POST['unpaid_check'])) 			
			$paid = 1;
		elseif( !isset($_POST['paid_check']) && isset($_POST['unpaid_check']))
			$paid = 0;
		else $paid='';											 
		$payments=select_payments($contractor, $valueMin, $valueMax, $dateMin, $dateMax, $paid, $type);
		if($payments)
			foreach($payments as $payment)
			{
				echo "<table class=\"item\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				echo "<tr><td class=\"name left_column\" onClick=\"window.location.href='port.php?menu=payments&id=$payment->id'\">$payment->contractor</td>";
				echo "<td class=\"delete right_column\" onClick=\"del( 'Are you sure?', 'port.php?menu=payments&action=delete&id=$payment->id' )\">Delete</td></tr>";
				echo "<tr><td class=\"level\">$payment->value $</td>";
				echo "<td class=\"edit\" onClick=\"edit_toggle( $payment->id )\">Edit</td></tr>";
				echo "</table><br>";
			}	
	?>	
</div>