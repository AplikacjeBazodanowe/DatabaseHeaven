function showTarget( cargo, target, butt ) {	var sel1 = document.getElementsByName( 'to' + cargo )[0];	var sel2 = document.getElementsByName( 'to' + cargo )[1];	var sel3 = document.getElementsByName( 'to' + cargo )[2];		// wylacza wszystkie select'y, zdisablowane inputy nie sa przesylane przez formularz	sel1.disabled = 1;	sel2.disabled = 1;	sel3.disabled = 1;		// ukrywamy wszystko	sel1.style.display = 'none';	sel2.style.display = 'none';	sel3.style.display = 'none';	// wlaczamy i wyswietlamy to c potrzebujemy	document.getElementsByName( 'to' + cargo )[target].disabled = 0;	document.getElementsByName( 'to' + cargo )[target].style.display = 'inline';		// wyrozniamy jakos wybor	// najpierw all do standardowego koloru	document.getElementById( 'butt1' ).style.border = '1px solid RGB( 84, 122, 150 )';	document.getElementById( 'butt2' ).style.border = '1px solid RGB( 84, 122, 150 )';	document.getElementById( 'butt3' ).style.border = '1px solid RGB( 84, 122, 150 )';		// teraz ten jeden wyrozniamy	butt.style.border = '2px solid RGB( 84, 122, 150 )';}