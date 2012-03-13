//timeweek calendar ui handler
BindingUtils.handlers.div_week_calendar = function(elem, controller) {
	var div = $(elem);
	if( div.data('model') ) return;
	
	if( !R.attr(elem, 'model') ) return;
	
	var model = controller.get( R.attr(elem,'model') );
	if( !model ) return;
	
	div.addClass('week-calendar')
	 .data('model', model);
	
	model.controller = controller;
	model.init( elem );
	model.load();
};

/*
 * version:			1.3
 * @author 			emerson chiong
 *
 * fork version:	1.0
 * @author			jaycverg
 * discription:		modified to support the rameses-ui framework
 */
function TimeWeekCalendar(options){
	
	var _this=this;

	this.schedules={};
	this.options = options || {};
	this.controller;
	
	var container;
	var contentPane;
	var tbl="";
	
	var MIN = this.options.mintime || 700;
	var MAX = this.options.maxtime || 2200;
	
	var color=[
				"#CCCCCC","#999999","#FFFFCC","#FFFF33","#CCFFFF",
			  	"#CCFFCC","#CCFF99","#CCFF66","#CCFF33","#99FFCC",
			  	"#FFCCCC","#FFCC33","#CCCCFF","#CCCC99","#99CCFF",
			  	"#00CCCC","#CC9933","#999900","#6699FF","#00FF33",
			  	"#009900","#CC66FF","#CC6666","#666FFF","#3366CC",
			  	"#006699","#9933FF","#993300","#3333FF","#00FF00",
			  	"#00AA00","#007700","#001100","#0000FF","#440000"
			  ];

	var colorctr = 0;
    draw();
	
	//redraw when window resizes
	$(window).bind('resize', function(){ _this.load(); });
	
	//display the table	
	function draw( t ){			
		var time;
		
		tbl = $('<table class="innertbl" width="100%" border="0" cellpadding="0" cellspacing="0"></table>')
			   .append(
					'<tr class="tbl-header" align="left">'+
						'<th class="first">&nbsp;</th>'+
						'<th>Mon</th>'+
						'<th>Tue</th>'+
						'<th>Wed</th>'+
						'<th>Thr</th>'+
						'<th>Fri</th>'+
						'<th>Sat</th>'+
						'<th class="last">Sun</th>'+				
					'</tr>'
				);
		
		if ( !t ) {			
			time = MIN;
		}
		else{
			time = (t-( t % 100 )) ;
		}
		
		var first = true;
		while( time < MAX ) {
			var vpos = (time%100==0? 'top' : time%100==45? 'bottom' : '');
			var rvpos = (first? 'first' : (time==(MAX-100+45))? 'last' : '');
			var strtime = ((time+'').replace(/(\d+)(\d{2})$/,'$1:$2'));
			tbl.append(
				'<tr class="' + ( time%2==0? 'even' : 'odd' ) + ' ' + rvpos + '">'+	
					(time%100==0? '<th class="row-header time" rowspan="4">' + strtime + (time<1200?' am':' pm') + ' </th>':'')+
					'<td class="first ' + vpos + ' mon' + time + '">&nbsp;</td>'+
					'<td class="' + vpos + ' tue' + time + '">&nbsp;</td>'+
					'<td class="' + vpos + ' wed' + time + '">&nbsp;</td>'+
					'<td class="' + vpos + ' thu' + time + '">&nbsp;</td>'+
					'<td class="' + vpos + ' fri' + time + '">&nbsp;</td>'+
					'<td class="' + vpos + ' sat' + time + '">&nbsp;</td>'+
					'<td class="last ' + vpos + ' sun' + time + '">&nbsp;</td>'+
				'</tr>'
			);
			time += (time%100==45)? 55 : 15;
			first = false;
		}		
	}
	
	this.init = function(selector){  
		container = (selector? $(selector) : container).append( tbl );
		contentPane = $('<div></div>').appendTo( container );			
	}
	
	this.load = function() {
		if(!contentPane) return;
		
		contentPane.html('');
		var options = this.options || {};
		
		if(options.fetchList) {
			var list = options.fetchList() || [];
			this.clear();
			list.each(function(s){
				_this.add(s);
			});
		}
		
		$.each(this.schedules, function(key){	
			var item = _this.schedules[key];
			showItem(item, false);
		});	
	}

	//this method accepts object or array of objects
	//add item. each item contains {day[mon,tue,wed,thu,fri,sat,sun], from, to, content and item.
	this.add = function(item) {
		if( item instanceof Array ) {
			item.each(function(o){ _this.add(o); });
			return;
		}
        
		var errs = [];
		if( !item.day) errs.push( "addItem error. Item day is required" ); 
		if( !item.from) errs.push( "addItem error. Item from is required" ); 
		if( !item.to) errs.push( "addItem error. Item to is required" ); 

		if( errs.length > 0 ) {
			alert( errs.join("\n") );
			throw new Error(errs.join("\n"));
		}
			
		if( !item.color ) {
			item.color = color[colorctr];
			colorctr = ++colorctr < color.length? colorctr : 0;
		}
		
		var key = getKey(item);
		this.schedules[key] = item;
		
		var tfrom = item.from;

		if ( tfrom < 700 ){			
			draw( tfrom );
			if( container ) {
				container.html( '' );
				_this.init();
			}
		}		
		
		showItem(item);
	}
	
	this.remove = function(item) {
		if(item instanceof Array) {
			item.each(function(o){ _this.remove(o); });
			return;
		}
		
		delete this.schedules[getKey(item)];
		hideItem(item);
	}
	
	this.clear = function(){
		$.each( this.schedules,function( key ){
			delete _this.schedules[key];
		});
	}
	
	
	function showItem(item, animate) {
		if(!container) return;
		
		var td = container.find('.'+(item.day + item.from));
		if(td.length==0) return;
		
		var loc = getLocation(td[0]);
		var x = loc.x;
		var y = loc.y;
		var width = getWidth(td);
		var height = getHeight(td, item.from, item.to); 
		var caption = item.caption? item.caption : 'Untitled';

		var sbox=$(
			'<div class="schedbox" style="background-color:'+item.color+'; height:'+height+'px; width:'+width+'px; left:'+x+'px; top:'+y+'px;">'+
			'<div>' + 
			'   <div class="actions-container"><div class="actions"></div></div>' +
			'   <div class="text">' +caption+ '</div>' + 
			'</div>'+
			'</div>'
		)
		.addClass(getKey(item))
		.appendTo( contentPane )
		.hover(schedbox_mouseover, schedbox_mouseout)
		.data('item', item);

		if(options.onclick){
			sbox.click( function() { 
				var res = options.onclick(item, this ) 
				if(_this.controller && res) {
					_this.controller.navigate( res, this );
				}
			});
		}

		var actions = sbox.find('div.actions').css('opacity',0);
		if( options.onedit ) {
			$('<a href="#">Edit</a>')
			.click(editItem)
			.appendTo(actions)
			.data('item', item);
		}
		if( options.onremove ) {
			$('<a href="#">Remove</a>').click(removeItem)
			.appendTo(actions)
			.data('item', item);
		}
		
		if(animate!=false) {
			var opacity = sbox.css('opacity') || 1;
			sbox.css('opacity',0).animate({opacity: opacity});
		}
	}
	
	function hideItem(item) {
		container.find('.' + getKey(item))
		 .animate({opacity:0},function(){
			//trigger mouseout on remove
			//so that mouseout listeners will be fired
			$(this).trigger('mouseout').remove(); 
		});
	}
	
	function getKey(item) {
		return item.day +"_"+item.from+"_"+item.to;
	};
	
	function schedbox_mouseover() {
		$(this).addClass('schedbox-hover');
		$(this).find('div.actions').stop().animate({opacity:1});
		if(_this.options && _this.options.onmouseover) {
			var item = $(this).data('item');
			_this.options.onmouseover(item, this);
		}
	}
	
	function schedbox_mouseout() {
		$(this).removeClass('schedbox-hover');
		$(this).find('div.actions').stop().animate({opacity:0});
		if(_this.options && _this.options.onmouseout) {
			var item = $(this).data('item');
			_this.options.onmouseout(item, this);
		}
	}
	
	function editItem() {
		var res = options.onedit($(this).data('item'), this);
		if(_this.controller && res) {
			_this.controller.navigate(res, this);
		}
		return false;
	}
	
	function removeItem() {
		var item = $(this).data('item');
		var res = options.onremove(item, this);
		if(res != false) _this.remove(item);
		return false;
	}
		
	function getLocation( obj ){
		var loc = {x:0, y:0};

		while( obj.offsetParent && obj != container[0] ) {
			loc.x += obj.offsetLeft;
			loc.y += obj.offsetTop;
			obj = obj.offsetParent;
		}
		
		return loc;
	}
	
	function getHeight( td, from, to ){
		var range = ((convertToMinute(to)-convertToMinute(from))/15);
		var height = td[0].offsetHeight * range;
		var b = parseInt(td.css('border-bottom-width'));
		if(!isNaN(b)) height -= b;
		return height;
	}
	
	function getWidth( td ) {
		var width = td[0].offsetWidth;
		var b = parseInt(td.css('border-right-width'));
		if(!isNaN(b)) width -= b;
		return width;
	}
	
	function convertToMinute(time){
		return ((((time-( time%100 ))/100)*60 ) + ( time%100 ));
	}
	
}


