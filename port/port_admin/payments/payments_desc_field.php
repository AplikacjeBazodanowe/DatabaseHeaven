<?php
    include_once("payments_db_funs.php");	

    if( isset( $_GET['id'] ) ) 
    {
            $payment_id = $_GET['id'];
            $payment=get_payment_by_id($payment_id);
            $contractor=get_payment_contractor($payment_id);    
            if($payment==NULL || $contractor == NULL)
                return;
            $paid = $payment->paid==1 ? "Paid" : "Not paid";
            $oppositeStatus = ($payment->paid+1)%2;
            echo "<table class=\"stuff_info\">
                    <tr>
                            <td class=\"stuff_no\" colspan=\"2\">
                                    Payment details
                            </td>
                    </tr>
                            <td>
                                    Type of the payment
                            </td>
                            <td>
                                    $payment->type
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Amount
                            </td>
                            <td>
                                    $payment->value $
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Date
                            </td>
                            <td>
                                    $payment->date
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Status
                            </td>
                            <td>
                                    $paid
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Added by
                            </td>
                            <td>
                                    $payment->added_by
                            </td>
                    </tr>
            </table><br><br>

            <table class=\"stuff_info\">
                    <tr>
                            <td class=\"stuff_no\" colspan=\"2\">
                                    Contractor info
                            </td>
                    </tr>
                            <td>
                                    Name
                            </td>
                            <td>
                                    $contractor->name
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Address
                            </td>
                            <td>
                                    $contractor->address
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Country
                            </td>
                            <td>
                                    $contractor->country
                            </td>
                    </tr>
                    <tr>
                            <td>
                                    Type
                            </td>
                            <td>
                                    $contractor->type
                            </td>
                    </tr>
            </table><br><br>

            <a href=\"?menu=payments&status=$oppositeStatus&id=$payment_id\"><input class=\"button baseFont add\" type=\"button\" value=\"Change status\"></a><br>
            <a href=\"?menu=payments&action=delete&id=$payment_id\">
            <input class=\"button baseFont add\" type=\"button\" value=\"Delete the payment\"></a><br>
            <a href=\"#\" onClick=\"edit_toggle($payment_id)\">
            <input class=\"button baseFont add\" type=\"button\" value=\"Edit the payment\"></a>";
    }
    else 
    {
            echo "<h1>Payments</h1>";
            echo "<p>This is the Payments menu.</p>";
            echo "<p>You can browse and filter port payments using the list on the left. Select
                            a payment to view its details. You can also add a new payment or delete/modify an existing one, 
                            provided that it hasn't been paid yet.</p>";
    }
?>