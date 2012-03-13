/**
 * static class utility
 */
var PersonInfo = {
	
	formatAddress: function( addr, format ) {
		var arr = [];
		if( addr.address1 ) arr.push( addr.address1 );
		if( addr.address2 ) arr.push( addr.address2 );
		if( addr.city ) arr.push( addr.city );
		if( addr.province ) arr.push( addr.province );
		if( addr.zipcode ) arr.push( addr.zipcode );
		return arr.join(', ');
	}
	
}


