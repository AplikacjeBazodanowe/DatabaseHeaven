<?php
	include_once("payments_db_funs.php");

	{
		if(isset($_GET['id']))
		{		
			{
			else if( $_GET['action'] == 'edit' ) 
			{ // edycja oplaty
				$value= $_POST['value'];
		}				
		else 
			if( $_GET['action'] == 'add' ) 
			{
				$value = $_POST['value'];								
	if( isset( $_GET['status'] ) )
	{
		$payment_id = $_GET['id'];
		$status = $_GET['status'];
		change_status($payment_id, $status);
	}
					$types=get_payment_types();
					foreach($types as $type)											
						echo "<option value=\"$type\">$type</option>";					
				?>
		else 
			$contractor='';							
		if( isset($_POST['type'])) 			
		else
			$type='';		
		if( isset($_POST['from_value'])) 			
		else
			$valueMin='';
		if( isset($_POST['to_value'])) 			
		else
			$valueMax='';
		if( isset($_POST['from_date'])) 			
		else
			$dateMin='';
		if( isset($_POST['to_date'])) 			
		else
			$dateMax='';
		if( isset($_POST['paid_check']) && !isset($_POST['unpaid_check'])) 			
		elseif( !isset($_POST['paid_check']) && isset($_POST['unpaid_check']))
			$paid = 0;
		else $paid='';											 
		$payments=select_payments($contractor, $valueMin, $valueMax, $dateMin, $dateMax, $paid, $type);
		if($payments)
			foreach($payments as $payment)
			{							
			  	echo "<div class=\"name float_left left_col align_cols link\">";
				echo  "<div onclick=\"return confirm('Are you sure?')\" class=\" delete float_left right_col align_cols link\">";
			}	