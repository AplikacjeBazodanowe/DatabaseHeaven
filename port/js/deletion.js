function del( txt, link ) {
	if( confirm( txt ) ) {
		window.location.href = link;
	} else {
		return false;
	}
}