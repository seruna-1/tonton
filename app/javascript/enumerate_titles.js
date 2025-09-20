const titles = document.querySelectorAll( "h1, h2, h3, h4, h5, h6" );

export function enumerateTitles ()
{
	let position = [ 0 ];

	let level;

	let last_level;

	for ( const title of titles )
	{
		level = parseInt( title.tagName[1] );

		if ( level == 1 ) { continue; }

		if ( level > last_level )
		{
			position.push( 0 );
		}

		else if ( level < last_level )
		{
			position.pop();

			position[ position.length - 1 ]++;
		}

		position[ position.length - 1 ]++;

		title.insertAdjacentHTML( "afterbegin", position.join( "." ) + " " );

		last_level = level
	}

	return;
}
