function on_off_edit( arg ) {	var from = 'from_' + arg;	var to   = 'to_'   + arg;	document.getElementsByName( from )[0].disabled = !document.getElementsByName( from )[0].disabled	document.getElementsByName( to   )[0].disabled = !document.getElementsByName( to   )[0].disabled}function clr( arg ) {	var val = arg.value;	if( val == 'From'          ||		val == 'To'            ||		val == 'Surname'       ||		val == 'Name' ) {				arg.value = '';	}}function back( arg ) {	var what    = arg.name.toString();	var content = arg.value;		if( what != 'user_name' && what != 'ship_name' && what != 'terminal_name' && what != 'dock_name' && what != 'warehouse_name' ) {		if( what.indexOf( '_' ) == 4 && content == '' ) {			arg.value = 'From';		} else if( content == '' ) {			arg.value = 'To';		}	} else if( what == 'user_name' ) {		arg.value = 'Surname';	} else {		arg.value = 'Name';	}}