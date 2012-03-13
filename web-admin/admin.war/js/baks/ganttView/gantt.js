

BindingUtils.handlers.div_gantt = function( elem, controller, idx ) 
{
	var e = $(elem);
	var model = controller.get(R.attr(elem, "model"));
	
	var width = R.attr(elem, "width");
	var showWeekend = R.attr(elem, "showWeekend");
	var cellWidth = R.attr(elem, "cellWidth");
	var cellHeight = R.attr(elem, "cellHeight");
	var showNoOfDays = R.attr(elem, "showNoOfDays");

	var ganttViewModel = [];
	var term = [];
	
	build();	
	function build() {
		term  = [];
		ganttViewModel = [];
		e.empty();
		
		var events = model.fetchList();
		for(var i=0 ; i<events.length ; i++) {
			ganttViewModel.push(
				{
					name: events[i].caption,
					start: buildDate(events[i].from),
					end: buildDate(events[i].to),
					color: events[i].color
				}
			);
		}
		
		term.push( {series:ganttViewModel });
		e.ganttView(
			{
				data: term,
				slideWidth: width,
				showWeekends: showWeekend,
				cellWidth: cellWidth,
				cellHeight: cellHeight,
				behavior: {
					clickable: model.clickable == null ? false : true,
					draggable: model.draggable == null ? false : true,
					resizable: model.resizable == null ? false : true,
					onClick: function(data, elem) {
						if(model.onclick)
							model.onclick(data, elem);
					},
					onDrag: function(data, elem) {
						if(model.ondrag)
							model.ondrag(data, elem);
					},
					onResize: function(data, elem){
						if(model.onresize)
							model.onresize(data, elem);
					}
				}
			}
		);
	
		//set the (Month/Year)HEADER AND EVENT FONT COLOR
		var vtheader = e.find('div.ganttview-vtheader-item-name').remove();
		e.find('div.ganttview-block-text').css( "color", "black" );
		//e.find('div.ganttview-hzheader-day').css( "color", "black" );

		//erases the text indicating the amount of days depending on : showNoOfDays
		if(showNoOfDays == "" || showNoOfDays == null)
			showNoOfDays = "false";
		
		//you can insert here the innerHtml/innerText of the EVENT displayed on the component
		if(showNoOfDays != "true") {
			var block_text = e.find('div.ganttview-block-text');
			for(var bt=0 ; bt<block_text.length ; bt++) {
				block_text[bt].innerText = "";
			}
		}
	}
	
	model.load = function() {
		build();
	}
	
	function buildDate(date) {
		var year= date.substring(0, date.indexOf("-"));
		var _month = date.replace(year+"-", "");
		var month = _month.substring(0, _month.indexOf("-"));
		var day = _month.substring(_month.lastIndexOf("-")+1, _month.length);
		return new Date(year, month-1, day);
	}
}

