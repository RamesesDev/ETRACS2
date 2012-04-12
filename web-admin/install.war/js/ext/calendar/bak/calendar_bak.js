function CalendarModel() {
    this.today = new Date();

	this.handler;	
    this.day = 1; 
    this.month = this.today.getMonth() + 1;
    this.year = this.today.getFullYear();
    this.div;
    this.months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];        
    this.days = ["Sun", "Mon","Tue","Wed","Thu","Fri","Sat"]; 
           
    this.show = function() {
        var d = new Date( this.year, this.month - 1, 1);
        var currMonth = d.getMonth();
        var currYear = d.getFullYear();
        var currMonthName = this.months[currMonth];
        var firstDay = d.getDay();
        
        d.setDate( d.getDate() - firstDay );
        var str = "<table cellpadding=2 cellspacing=0 width=100% height=100% border=1>";

        str+= "<tr><td colspan=7>" + currMonthName + " " + currYear + "</td>";
        str+= "<tr>";
        for( var n=0; n<this.days.length;n++ ) {
            str+="<td align=center class='calendar-heading'>"+this.days[n]+"</td>";
        }
        str+= "</tr>";            
        
        while( true ) {
            if( d.getDay() == 0 ) {
                str+= "<tr>";
            }
            str += "<td valign=top>";    
			str += "<table width=100% cellpadding=0 cellspacing=0><tr>";
			str += "<td height=10 align=right>" + d.getDate() + "</td></tr>";
			str += "<tr><td>";
			if(this.handler && this.handler.getCell) {
				var c = this.handler.getCell(d);
				if( c ) str += c;		
			}
			str+= "</td></tr></table>";
			str+= "</td>";
            d.setDate( d.getDate() + 1 );
            if( d.getDay() == 0 ) {
                str+= "</tr>";
                if( d.getMonth() > currMonth ) break;
                if( d.getFullYear() > currYear ) break;
            }
        }
        str += "</table>";   
        this.div.innerHTML = str; 
    }
    
    this.moveNext = function() {
        this.month = this.month + 1;
        if(this.month > 12 ){
            this.month = 1;
            this.year++;
        }
        this.show();
    } 
    
    this.movePrev = function() {
       this.month = this.month - 1;
       if(this.month < 1 ){ 
           this.month = 12;
           this.year--;
       }
       this.show();
    } 
}






