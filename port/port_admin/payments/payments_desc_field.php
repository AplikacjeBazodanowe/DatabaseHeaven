<?php
	include_once("payments_db_funs.php");	
	
	{
		$payment=get_payment_by_id($payment_id);
		$contractor=get_payment_contractor($payment_id);
		//if($payment==NULL || $contractor == NULL)
			//return;
		$paid = $payment->paid==1 ? "Paid" : "Not paid";
		$oppositeStatus = ($payment->paid+1)%2;
			<tr>
		
		<table class=\"stuff_info\">
		<input class=\"button baseFont add\" type=\"button\" value=\"Delete the payment\"></a><br>
		<input class=\"button baseFont add\" type=\"button\" value=\"Edit the payment\"></a>";
	else 
	{
		echo "<h1>Payments</h1>";
		echo "<p>This is the Payments menu.</p>";
		echo "<p>You can browse and filter port payments using the list on the left. Select
				a payment to view its details. You can also add a new payment or delete/modify an existing one, 
				provided that it hasn't been paid yet.</p>";
	}