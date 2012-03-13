function DateTimeModel() 
{
	this.month = "";
	this.year = "";
	this.day = "";
	this.hour = "";
	this.minute = "";
	this.minYear = 1900;
	this.maxYear;
	
	/**
	 * modes: datetime(default), date, time
	 */
	this.mode = "datetime";
	
	/**
	 * time modes: 24(default), 12
	 */
	this.timeFormat = '24';
	this.yearAscending = false;

	var _months;	
	this.getMonths = function()
	{
		if( _months ) return _months;
		return ( _months = [
			{id:"", name:"-"},
			{id:"01", name:"Jan"},
			{id:"02", name:"Feb"},
			{id:"03", name:"Mar"},
			{id:"04", name:"Apr"},
			{id:"05", name:"May"},
			{id:"06", name:"Jun"},
			{id:"07", name:"Jul"},
			{id:"08", name:"Aug"},
			{id:"09", name:"Sep"},
			{id:"10", name:"Oct"},
			{id:"11", name:"Nov"},
			{id:"12", name:"Dec"}
		]);
	};
	
	var _years;
	this.getYears = function() 
	{
		if( _years ) return _years;
		
		_years = [{id:"", name:"-"}];
		if( !this.maxYear ) {
			this.maxYear = new Date().getFullYear();
		}
		if( this.yearAscending ) {
			for( var i=this.minYear; i<= this.maxYear; ++i ) {
				_years.push({id:i, name:i});
			}
		}
		else {
			for( var i=this.maxYear; i>=this.minYear; --i ) {
				_years.push({id:i, name:i});
			}
		}
		return _years;
	};
	
	this.getDays = function()
	{
		var days = [{id:"", name:"-"}];
		if( !this.month || !this.year ) {
			for( var i=1; i<=31; ++i ) {
				var n = formatNum(i);
				days.push({id:n, name:n});
			}
		}
		else {
			var d = new Date(this.year, this.month, 0);
			for( var i=1; i<=d.getDate(); ++i ) {
				var n = formatNum(i);
				days.push({id:n, name:n});
			}
		}
		return days;
	};
	
	var _hours;
	this.getHours = function() 
	{
		if( _hours ) return _hours;
		
		_hours = [{id:"",name:"-"}];
		for( var h=0; h<24; h++ ) {
			if( this.timeFormat == '12' ) {
				var suffix = h<12? 'AM' : 'PM';
				_hours.push({ id:formatNum(h), name:formatNum( h==0? 12 : h>12? h-12 : h ) + ' ' + suffix });
			}
			else {
				var n = formatNum(h);
				_hours.push({ id:n, name:n });
			}
		}
		return _hours;
	};
	
	var _minutes;
	this.getMinutes = function() 
	{
		if( _minutes ) return _minutes;
		
		_minutes = [{id:"", name:"-"}];
		for( var m=0; m<60; m++ ) {
			var n = formatNum(m);
			_minutes.push({id:n, name:n});
		}
		return _minutes;
	};
	
	
	this.getDate = function() 
	{
		if( this.mode == 'date' ) {
			if( this.year && this.month && this.day )
				return this.year + '-' + this.month + '-' + this.day;
		}
		else if( this.mode == 'time' ) {
			if( this.hour && this.minute )
				return this.hour + ':' + this.minute;
		}
		else if( this.year && this.month && this.day && this.hour && this.minute ) {
			return this.year + '-' + this.month + '-' + this.day + " " + this.hour + ":" + this.minute;
		}
		
		return null;
	}
	
	//helper function
	function formatNum( num ) {
		return ( (num+'').length == 1 )? '0'+num : num;
	}
} 

BindingUtils.handlers.span_datetime = function( elem, controller, idx ) 
{
	var e = $(elem).css('display', 'inline-block');
	var model;
	
	if( e.data('model') ) {
		model = e.data('model');
	}
	else if( R.attr(elem, 'model') ) {
		model = controller.get( R.attr(elem, 'model') );
	}
	
	if( !model ) {
		model = new DateTimeModel();
		e.data('model', model);
	}
	
	if( R.attr(elem, 'mode') ) {
		model.mode = R.attr(elem, 'mode');
	}
	
	if( R.attr(elem, 'options') ) {
		try {
			var options = eval( '(' + R.attr(elem, 'options') + ')' );
			$.extend(model, options);
		}
		catch(e) {
			throw new Error('Error evaluating r:options value for ' + elem.tagName + ', message: ' + e.message);
		}
	}

	var monthSelection;
	var daySelection;
	var yearSelection;
	var hourSelection;
	var minSelection;

	if(e.children().length == 0) {
		buildComponents();
		setInitialValues();
	} 
	else {
		monthSelection = e.find('select.m');
		daySelection = e.find('select.d');
		yearSelection = e.find('select.y');
		hourSelection = e.find('select.hh');
		minSelection = e.find('select.mm');
	}

	
	//refresh display
	if( model.mode == 'time' ) {
		refreshTime();
	}
	else if( model.mode == 'date' ) {
		refreshDate();
	}
	else {
		refreshDate();
		refreshTime();
	}

	//-- helper functions ---
	function refreshTime() {
		$('option[value="' + model.hour + '"]', hourSelection).attr('selected', 'selected');
		$('option[value="' + model.minute + '"]', minSelection).attr('selected', 'selected');
	}
	
	function refreshDate() {
		$('option[value="' + model.month + '"]', monthSelection).attr('selected', 'selected');
		$('option[value="' + model.day + '"]', daySelection).attr('selected', 'selected');
		$('option[value="' + model.year + '"]', yearSelection).attr('selected', 'selected');
	}
	
	function updateFieldValue() {
		var n = R.attr(elem, 'name');
		if( n ) controller.set(n, model.getDate());
	}
	
	function setInitialValues() {
		var n = R.attr(elem, 'name');
		if( !n ) return;
		
		var value = controller.get( n );
		if( !value ) return;
		
		var items = value.split(/\D+/);
		if( model.mode == 'time' ) {
			if( items.length > 0 ) model.hour = items[0];
			if( items.length > 1 ) model.minute = items[1];		
		}
		else {
			if( items.length > 0 ) model.year = items[0];
			if( items.length > 1 ) model.month = items[1];
			if( items.length > 2 ) model.day = items[2];
			if( items.length > 3 ) model.hour = items[3];
			if( items.length > 4 ) model.minute = items[4];
		}
	}

	function buildComponents() 
	{
		var div = $('<div></div>').appendTo(e);
		var mode = model.mode? model.mode : 'datetime';

		if( mode == 'datetime' || mode == 'date' ) 
		{
			/***********************************************	
			month
			************************************************/
			monthSelection = $('<select class="m"></select>');
			var mm = model.getMonths();
			for( var i=0; i<mm.length ; i++ ) {
				$('<option value="' + mm[i].id + '">'  + mm[i].name + '</option>').appendTo(monthSelection);
			}
			monthSelection.appendTo(div);
			monthSelection.change(function() {
				model.month = this.value;
				redrawDays();
				updateFieldValue();
			});

			/***********************************************	
			day
			************************************************/
			daySelection = $('<select class="d"></select>');
			var dd = model.getDays();
			for( var i=0 ; i<dd.length ; i++) {
				$('<option value="' + dd[i].id + '">' + dd[i].name + '</option>').appendTo(daySelection);
			}
			daySelection.appendTo(div);
			daySelection.change(function() {
				model.day = this.value;
				updateFieldValue();
			});

			/***********************************************	
			year
			************************************************/
			yearSelection = $('<select class="y"></select>');
			var yy = model.getYears();
			for( var i=0 ; i<yy.length ; i++) {
				$('<option value="' + yy[i].id +'">' + yy[i].name + '</option>').appendTo(yearSelection);
			}
			yearSelection.appendTo(div);
			yearSelection.change(function() {
				model.year = this.value;
				redrawDays();
				updateFieldValue();
			});
		}
		
		if( mode == 'datetime' || mode == 'time' )
		{
			/***********************************************	
			time in hours and minutes
			************************************************/ 	
			hourSelection = $('<select class="hh"></select>');
			var hh = model.getHours();
			for( var i=0; i<hh.length ; i++ ) {
				$('<option value="' + hh[i].id + '">'  + hh[i].name + '</option>').appendTo(hourSelection);
			}
			hourSelection.appendTo(div);
			hourSelection.change(function() {
				model.hour = this.value;
				updateFieldValue();
			});
		  
			minSelection = $('<select class="mm"></select>');
			var mn = model.getMinutes();
			for( var i=0; i<mn.length ; i++ ) {
				$('<option value="' + mn[i].id + '">'  + mn[i].name + '</option>').appendTo(minSelection);
			}
			minSelection.appendTo(div);	
			minSelection.change(function() {
				model.minute = this.value;
				updateFieldValue();
			});
		}
	}
	
	function redrawDays() {
		var op = daySelection.find('option[selected]')[0];
		daySelection.empty();
		var dd = model.getDays();
		for( var i=0 ; i<dd.length ; i++) {
			$('<option value="' + dd[i].id + '">' + dd[i].name + '</option>').appendTo(daySelection);
		}
		if( op ) {
			daySelection.find('option[value="' +op.value+ '"]').attr('selected','selected');
		}
		daySelection.trigger('change');
	}
}
