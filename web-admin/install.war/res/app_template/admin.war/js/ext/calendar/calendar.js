BindingUtils.handlers.div_fromtocalendar = function( elem, controller, idx ) 
{
	var e = $(elem);
	var format = R.attr(elem, "format");
	if(!format) format = "mm/dd/yyyy";
	var mode = R.attr(elem, "mode")
	
	var start = new Date();
	var end = new Date();
	var fromdate = new Date();
	var todate = new Date();
	var monthList = [
		"January", "February", "March", "April", "May", "June", 
		"July", "August", "September", "October", "November", "December"
	];
	
	e.css("position", "relative");
	e.css("display", "inline");
	
	var txt = $('<input type="text">');
	txt.width("300px");
	txt.css("border", "1px solid black");
	
	var calendar = $('<div style="width:650px;"></div>');
	calendar.css("background", "white");
	calendar.css("border-left", "1px solid black");
	calendar.css("border-bottom", "1px solid black");
	calendar.css("border-right", "1px solid black");
	calendar.css("border-top", "1px solid black");
	calendar.css("position", "absolute");
	calendar.css("top", (txt.height()+ (parseInt(txt.css("margin-bottom"),10))*2) + "px");
	
	txt.toggle(function(){
		calendar.slideDown();
		setFromTo(start, end);
	}, function(){
		calendar.slideUp();
	});
	
	$('html').click(function() {
		calendar.toggleSlide();
	});
	
	/* -========- FROM */
	var fromdiv = $('<div style="padding-left:10px;width:300px;float:left;padding-bottom:10px;"></div>');
	var fromheader = $('<table width="100%"> </table>');
	var fromcalendar = $('<div></div>');
	var fromrow;
	var fromtitle;
	var frombuttons;
	var fromprev;
	var fromnext;
	/* -========- TO */
	var todiv = $('<div style="padding-left:20px;width:300px;float:left;padding-bottom:10px;"></div>');
	var toheader = $('<table width="100%"></table>');
	var tocalendar = $('<div></div>');
	var torow;
	var totitle;
	var tobuttons;
	var toprev;
	var tonext;
	
	build();
	function build() {
		if(mode == "fromto") {
			e.empty();
			//
			txt.appendTo(e);
			calendar.appendTo(e);
			calendar.slideUp();
			//FROM
			fromdiv.appendTo(calendar);
			fromheader.appendTo(fromdiv);
			fromcalendar.appendTo(fromdiv);
			//TO
			todiv.appendTo(calendar);
			toheader.appendTo(todiv);
			tocalendar.appendTo(todiv);
			//BUILD
			buildFromHeader();
			buildToHeader();
			
			fromcalendar.fullCalendar(
				{
					defaultView: "month",
					header: { right:'', },
					titleFormat:"",
					selectable:true,
					selectHelper:true,
					dayClick : function( date, allDay, jsEvent, view ) { 
						if(date <= end) {
							start = date;
						}
	
						setFromTo(start, end);
					},
					select : function(start, end, allDay) {
						tocalendar.fullCalendar( 'select', start, end, false );
					}
				}
			);
			
			tocalendar.fullCalendar(
				{
					defaultView: "month",
					header: { right:'', },
					titleFormat:"",
					selectable:true,
					selectHelper:true,
					dayClick : function( date, allDay, jsEvent, view ) { 
						if(date >= start) {
							end = date;
						}
						
						setFromTo(start, end);
					}
				}
			);
			
			setFromTo(start, end);
		} else {
			$(elem).fullCalendar(
				{
					defaultView: "month",
					editable: (model.editable == true),
					events: model.events
				}
			);
		}
	}
	
	function buildFromHeader() {
		fromrow = $('<tr></tr>').appendTo(fromheader);
		fromtitle = $('<td style="text-align:left;"><h2>' + monthList[fromdate.getMonth()] + ' ' + fromdate.getFullYear() + '</h2></td>').appendTo(fromrow);
		frombuttons = $('<td style="text-align:right;"></td>').appendTo(fromrow);
		fromprev = $('<input type="button" value="<<">').appendTo(frombuttons);
		fromnext = $('<input type="button" value=">>">').appendTo(frombuttons);
		fromprev.click(
			function() {
				fromcalendar.fullCalendar('prev');
				setFromTo(start, end);
				fromdate.setMonth( fromdate.getMonth() - 1);
				fromrow.remove();
				buildFromHeader();
			}
		);
		fromnext.click(
			function() {
				fromdate.setMonth( fromdate.getMonth() + 1);
				if(fromdate <= todate ) {
					fromcalendar.fullCalendar('next');
				} else {
					fromdate.setMonth( fromdate.getMonth() - 1);
				}
			
				fromrow.remove();
				buildFromHeader();
				setFromTo(start, end);
			}
		);
	}
	
	function buildToHeader() {
		torow = $('<tr></tr>').appendTo(toheader);
		totitle = $('<td style="text-align:left;"><h2>' + monthList[todate.getMonth()] + ' ' + todate.getFullYear() + '</h2></td>').appendTo(torow);
		tobuttons = $('<td style="text-align:right;"></td>').appendTo(torow);
		toprev = $('<input type="button" value="<<">').appendTo(tobuttons);
		toprev.click(
			function() {
				todate.setMonth( todate.getMonth() - 1);
				if(fromdate <= todate) {
					tocalendar.fullCalendar('prev');
				} else {
					todate.setMonth( todate.getMonth() + 1);
				}
				torow.remove();
				buildToHeader();
				setFromTo(start, end);
			}
		);
	
		var tonext = $('<input type="button" value=">>">').appendTo(tobuttons);
		tonext.click(
			function() {
				tocalendar.fullCalendar('next');
				setFromTo(start, end);
				todate.setMonth( todate.getMonth() + 1);
				torow.remove();
				buildToHeader();
			}
		);
	}
	
	function setFromTo(start, end) {
		fromcalendar.fullCalendar( 'select', start, end, false );
		tocalendar.fullCalendar( 'select', start, end, false );
		
		var _start = new Date(start.getFullYear(), start.getMonth(), start.getDate());
		var _end = new Date(end.getFullYear(), end.getMonth(), end.getDate(), 23, 59, 59);
		_end.format( format );
		var n = R.attr(elem, 'name');
		if( n ) { 
			controller.set(n, 
				{
					start: _start.format(format),
					end: _end.format(format)
				}
			); 
		}
		
		txt.val( _start.format(format) + " to " + _end.format(format));
	}
}

BindingUtils.handlers.div_weekcalendar = function( elem, controller, idx ) 
{
	var e = $(elem);
	var model = controller.get(R.attr(elem, "model"));
	var minTime = R.attr(elem, "min");
	var maxTime = R.attr(elem, "max");
	
	var d = 1;
	var m = 0;
	var y = 2012;
	
	var calendarModel = [];
	
	build();
	function build() {
		calendarModel = [];
		var events = model.fetchList();
		events.start = {};
		events.end = {};
		e.fullCalendar( 'destroy' );
		
		for(var i=0 ; i<events.length ; i++) {
			var temp = [];
			var day = events[i].day.toUpperCase();
			
			var _start = breakProtoTime(events[i].from);
			var _end = breakProtoTime(events[i].to);
			
			if(day == "SUN") {
				temp.start = new Date(y, m, d, _start.hr, _start.min);
				temp.end = new Date(y, m, d, _end.hr, _end.min);
			} else if(day == "MON") {
				temp.start = new Date(y, m, d+1, _start.hr, _start.min);
				temp.end = new Date(y, m, d+1, _end.hr, _end.min);
			}else if(day == "TUE") {
				temp.start = new Date(y, m, d+2, _start.hr, _start.min);
				temp.end = new Date(y, m, d+2, _end.hr, _end.min);
			}else if(day == "WED") {
				temp.start = new Date(y, m, d+3, _start.hr, _start.min);
				temp.end = new Date(y, m, d+3, _end.hr, _end.min);
			}else if(day == "THU") {
				temp.start = new Date(y, m, d+4, _start.hr, _start.min);
				temp.end = new Date(y, m, d+4, _end.hr, _end.min);
			}else if(day == "FRI") {
				temp.start = new Date(y, m, d+5, _start.hr, _start.min);
				temp.end = new Date(y, m, d+5, _end.hr, _end.min);
			}else if(day == "SAT") {
				temp.start = new Date(y, m, d+6, _start.hr, _start.min);
				temp.end = new Date(y, m, d+6, _end.hr, _end.min);
			}
		
			calendarModel.push(
				{
					id: events[i].id,
					title: events[i].caption ? events[i].caption : "",
					start: temp.start,
					end: temp.end,
					allDay: false,
					color: events[i].color,
					textColor: events[i].fontcolor == null ? 'black' : events[i].fontcolor,
					item: events[i]
				}
			);
		}
	
		var calendar = $(elem).fullCalendar(
			{
				events: calendarModel,
				defaultView: model.view == "basic" ? "basicWeek" : "agendaWeek",
				editable: (model.editable == true),
				columnFormat: "ddd",
				titleFormat: "",
				allDaySlot: false,
				header: { right:'', },
				year:2012,
				month:0,
				date:1,
				slotMinutes: 15,
				minTime: minTime ? minTime : 6,
				maxTime: maxTime ? maxTime : 18,
				selectable: (model.editable == true),
				selectHelper: (model.editable == true),
				select: function(start, end, allDay) {
					if(model.onselectrange)
						model.onselectrange( buildDate(start , end ) );
				},
				eventDragStart : function( event, jsEvent, ui, view ) { 
					if(model.ondragstart)
						model.ondragstart( event.item );
				},
				eventDragStop : function( event, jsEvent, ui, view ) { 
					if(model.ondragstop)
						model.ondragstop( event.item );
				},
				eventDrop : function( event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view ) { 
					if(model.ondrop)
						model.ondrop( event.item );
				},
				eventResizeStart : function( event, jsEvent, ui, view ) { 
					if(model.onresizestart)
						model.onresizestart( event.item );
				},
				eventResizeStop : function( event, jsEvent, ui, view ) { 
					if(model.onresizestop)
						model.onresizestop( event.item );
				},
				eventResize : function( event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ) {
					if(model.onresize)
						model.onresize( event.item );
				},
				eventMouseover : function( event, jsEvent, view ) { 
					if(model.onmouseover)
						model.onmouseover( event.item );
				},
				eventMouseout : function( event, jsEvent, view ) { 
					if(model.onmouseout)
						model.onmouseout( event.item );
				},
				eventClick : function(event, element) {
					if(model.onclick)
						model.onclick( event.item, element.currentTarget );
				},
				eventRender: function(event, element) {
					if(event.item.templateid){
						var title = $template(event.item.templateid, event.item);
						element.find('.fc-event-title').html( title );
					} else {
						element.find('.fc-event-title').html( event.title );
					}
					
					BindingUtils.bind( null, element );
				}
			}
		);
		
		$(elem).fullCalendar('render');
	}
	
	model.load = function() {
		build();
	}
	
	function buildDate( from, to ) {
		var day;
		if(from.getDay() == 0) day = "sun";
		else if(from.getDay() == 1) day = "mon";
		else if(from.getDay() == 2) day = "tue";
		else if(from.getDay() == 3) day = "wed";
		else if(from.getDay() == 4) day = "thu";
		else if(from.getDay() == 5) day = "fri";
		else if(from.getDay() == 6) day = "sat";
		
		return {
			day:day,
			from: (from.getHours() * 100) + from.getMinutes(),
			to: (to.getHours() * 100) + to.getMinutes()
		};
	}
	
	function breakProtoTime( time ) {
		return { 
			hr:Math.floor(time/100),
			min: time % 100
		};
	}
}

BindingUtils.handlers.div_daycalendar = function( elem, controller, idx ) 
{
	var e = $(elem);
	var model = controller.get(R.attr(elem, "model"));
	

	
	$(elem).fullCalendar(
		{
			defaultView: model.view == "basic" ? "basicDay" : "agendaDay",
			editable: (model.editable == true),
			events: model.events
		}
	);
}

