
//days of week utility
function SkedUtil() {
	
	this.mon;
	this.tue;
	this.wed;
	this.thu;
	this.fri;
	this.sat;
	this.sun;
	
	//build the hours 
	var hoursList;
	this.getHours = function() {
		if(!hoursList) {
			hoursList = [];
		    for(var i=0; i<24;i++) {
				if( i<10 ) hoursList.push( "0"+i);
				else hoursList.push(i);
			}	
		}
		return hoursList;
	}
	
	var minutesList;
	this.getMinutes = function(_intval) {
		if(!minutesList) {
			if(!_intval) _intval = 1;
			minutesList = [];
		    for(var i=0; i<60;i+=_intval) {
				if( i<10 ) minutesList.push( "0"+i);
				else minutesList.push(i);
			}	
		}
		return minutesList;
	}
	
	

	this.daysToString = function() {
		var str = "";
		if(this.mon) str += "M";
		if(this.tue) str += "T";		
		if(this.wed) str += "W";		
		if(this.thu) str += "Th";				
		if(this.fri) str += "F";						
		if(this.sat) str += "S";								
		if(this.sun) str += "Su";		
		if( str.endsWith("Su")) str = str.replace( "TWThFS", "-" );		
		if( str.endsWith("S"))  str = str.replace( "TWThF", "-" );		
		if( str.endsWith("F")) str = str.replace( "TWTh", "-" );		
		return str;	
	}
	
	this.daysToNumber = function() {
		var total = 0;
		if( this.mon ) total += 2;
		if( this.tue ) total += 4;
		if( this.wed ) total += 8;
		if( this.thu ) total += 16;
		if( this.fri ) total += 32;
		if( this.sat ) total += 64;
		if( this.sun ) total += 128;
		return total;
	}
	
	this.initDays = function( num ) {
		this.mon = ((num & 2) == 2);
		this.tue = ((num & 4) == 4);
		this.wed = ((num & 8) == 8);
		this.thu = ((num & 16) == 16);
		this.fri = ((num & 32) == 32);
		this.sat = ((num & 64) == 64);
		this.sun = ((num & 128) == 128);
	}
	
	this.formatSchedule = function(arr) {
		if(!arr) return "";
		var str = "";
		var a = arr.split(";");
		for( var i=0;i< a.length;i++ ) {
			if(i>0) str += "<br>";
			str += a[i];
		}	
		return str;
	}
	
	function TimeUtil( time ) {
		if(!time) time = "00:00";
		if( typeof(time) == 'number' ) {
			time = time+"";
			if( time.length  == 3 ) time = "0"+time;
			this.hour = time.substring( 0, 2 );
			this.minute = time.substring( 2, 4);
		}
		else {
			this.hour = time.substring( 0, time.indexOf(":"));
			this.minute = time.substring( time.indexOf(":") + 1);
		}	
	
		this.toString = function() {
			return this.hour + ":" + this.minute;
		}
		this.toNumber = function() {
			return Number(this.hour + "" + this.minute);
		}
	} 

	this.createTime = function(time) {
		return new TimeUtil(time);
	}
	
	this.fetchDays = function( daysnum, func ) {
		if((daysnum & 2) == 2) func( "mon" );
		if((daysnum & 4) == 4) func( "tue" );
		if((daysnum & 8) == 8) func( "wed" );
		if((daysnum & 16) == 16) func( "thu" );
		if((daysnum & 32) == 32) func("fri");
		if((daysnum & 64) == 64) func( "sat" );
		if((daysnum & 128) == 128) func("sun");
	}
}


