BindingUtils.handlers.div_menu = function( elem, controller, idx ) 
{
	var e = $(elem);
	if( e.data('_binded') ) return;
	e.data('_binded', true);
	
	e.addClass("menu");
	var model = controller.get(R.attr(elem, "model"));
	if( !model ) return;
	
	model.load = load;
	model.setSelected = function(item) {
		e.find('td.root').each(function(i,elm){
			var span = $(elem).find('span:first');
			var data = span.data('_item');
			if( data == item ) {
				var selected = e.find("span.selected");
				selected.removeClass("selected");
				span.addClass("selected");
				return false;
			}
		});
	};
	
	model.setSelectedIndex = function( idx ) {
		var items = e.find('td.root');
		if( idx < 0 || idx > items.length-1 ) return;
		
		var selected = e.find("span.selected");
		selected.removeClass("selected");
		$(items[idx]).find('span:first').addClass('selected');
	};
	
	var orientation = R.attr(elem, "orientation");
	var menus;
	var menuchildren;
	
	//load the menus
	load();
	
	function load() 
	{
		e.empty(); //empty the div container
		//check if it has menus
		if(model.fetchMenus) {
			menus = model.fetchMenus();
			var table = $('<table></table>');
			table.addClass("root");
			if(orientation == "horizontal") {
				var tr = $('<tr></tr>').appendTo(table);
				for(var i=0 ; i<menus.length ; i++) {
					var td = $('<td></td>').addClass('root').appendTo(tr);
					buildMenu(menus[i], td);
				}
			}
			
			if(orientation == "vertical") {
				for(var i=0 ; i<menus.length ; i++) {
					var tr = $('<tr></tr>').appendTo(table);
					var td = $('<td></td>').appendTo(tr);
					buildMenu(menus[i], td);
				}
			}
			
			table.appendTo(e);
		}
	}
	
	function buildMenu(menudata, elem) {
		var childCont = $('<div class="childMenu"></div>');
		elem.mouseleave(function(evt){
			var hovered = e.find("span.hovered");
			hovered.removeClass("hovered");
			childCont.hide();
		});
		
		childCont.hide();
		var menu = $('<span>' + menudata.caption + '</span>');
		menu.addClass("menu");
		menu.css("cursor", "pointer");
		menu.data("_item", menudata);
		menu.click(function(evt) {
			var selected = e.find("span.selected");
			selected.removeClass("selected");
			$(this).addClass("selected");
			var y = model.onclick( $(this).data("_item") );
			if(y)
				controller.navigate(y);
		});
		
		menu.mouseenter(function(evt) {
			var hovered = e.find("span.hovered");
			hovered.removeClass("hovered");
			if(! $(this).hasClass("hovered")) {
				$(this).removeClass("hovered");
			}
			
			$(this).addClass("hovered");
			if(orientation == "vertical") {
				childCont.css("left", $(this).width() + $(this).parent().offset().left + ($(this).offset().left/2));
				childCont.css("top", $(this).offset().top);
			}
			buildChildMenu(menudata, childCont);
			childCont.show();
		});
		
		menu.appendTo(elem);
		childCont.appendTo(elem);
	}
	
	function buildChildMenu(menudata, elem) {
		elem.empty();
		var childmenus = model.fetchChildren(menudata);
		var table = $('<table></table>').appendTo(elem);
		table.addClass("menu");
		for(var i=0 ; i<childmenus.length ; i++) {
			var tr = $('<tr></tr>').appendTo(table);
			var td = $('<td></td>').appendTo(tr);
			var menu = $('<span>'+ childmenus[i].caption+'</span>').appendTo(td);
			menu.addClass("childMenu");
			menu.css("cursor", "pointer");
			menu.data("_item", childmenus[i]);
			menu.click(function(evt) {
				var y = model.onclick( $(this).data("_item") );
				if(y)
					controller.navigate(y);
			});
			menu.mouseenter(function(evt) {
				$(this).addClass("hovered");
			});
			menu.mouseout(function(evt) {
				$(this).removeClass("hovered");
			});
		}
	}
}
