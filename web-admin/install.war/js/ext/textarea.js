/*
 * jQuery autoResize (textarea auto-resizer)
 * @copyright James Padolsey http://james.padolsey.com
 * @version 1.04
 */

(function(a){a.fn.autoResize=function(j){var b=a.extend({onResize:function(){},animate:true,animateDuration:150,animateCallback:function(){},extraSpace:20,limit:1000},j);this.filter('textarea').each(function(){var c=a(this).css({resize:'none','overflow-y':'hidden'}),k=c.height(),f=(function(){var l=['height','width','lineHeight','textDecoration','letterSpacing'],h={};a.each(l,function(d,e){h[e]=c.css(e)});return c.clone().removeAttr('id').removeAttr('name').css({position:'absolute',top:0,left:-9999}).css(h).attr('tabIndex','-1').insertBefore(c)})(),i=null,g=function(){f.height(0).val(a(this).val()).scrollTop(10000);var d=Math.max(f.scrollTop(),k)+b.extraSpace,e=a(this).add(f);if(i===d){return}i=d;if(d>=b.limit){a(this).css('overflow-y','');return}b.onResize.call(this);b.animate&&c.css('display')==='block'?e.stop().animate({height:d},b.animateDuration,b.animateCallback):e.height(d)};c.unbind('.dynSiz').bind('keyup.dynSiz',g).bind('keydown.dynSiz',g).bind('change.dynSiz',g)});return this}})(jQuery);


BindingUtils.handlers.div_textarea = function( elem, controller, idx ) 
{
   var e = $(elem);
   var name = R.attr(e, 'name');
   var cols = R.attr(e, 'cols') || 30;
   var textarea;
   var controls;
   var close;
   
	var textarea = $(elem).data('_textarea');
	if( !textarea ) {	   
		init();
	}
	else {
		controls = e.data('_controls');
		close = e.data('_close');
	}

	var value = controller.get(name) || '';
	if( name ) textarea.val( value );
	
	if( value ) {
		ta_focus(null,false);
	}
	else {
		a_click(null,false);
	}
	
	

	//helper
	function init() {
		if( e.children().length > 0 ) {
			controls = e.children().wrap('<div class="txt-controls"></div>').parent().hide();
		}
		
		var tpl = $('<table width="100%"><tr><td><textarea/></td><td valign="top" width="24px"><a href="#">x</a></td></tr></table>').prependTo(e);
		textarea = tpl.find('textarea')
		 .wrap('<div class="hint-wrapper" style="width:100%"></div>')
		 .css({
			width:'100%',outline:'none',
			resize:'none',display:'block',overflow:'auto'
		 });
		
		close = tpl.find('a')
		 .css('opacity',0)
		 .addClass('txt-close')
		 .css({display:'block',width:'24px',height:'24px','line-height':'24px','text-align':'center'})
		 .click(a_click);
		
		textarea
		 .focus(ta_focus)
		 .blur(ta_blur)
		 .change(update_bean)
		 .autoResize({
			animate: false,
			extraSpace : 20
		});
		
		e.data('_textarea', textarea)
		 .data('_close', close)
		 .data('_controls', controls);
	}
	
	function ta_focus(event,animate) {
		if( R.attr(elem, 'hint') && textarea.hasClass('input-hint') ) {
			textarea.val('').removeClass('input-hint');
		}

		if( animate == false ) {
			textarea.height(50);
			textaera.trigger('blur').focus();
		}
		else {
			textarea.stop().animate({height:50},100,function(){ textarea.trigger('blur').focus(); });
		}

		close.stop().animate({opacity: 1},50);
		if( controls ) controls.show();
	}
	
	function ta_blur() {
		if( !textarea[0].value.trim() && !textarea.hasClass('input-hint') && R.attr(elem, 'hint') ) {
			textarea.val(R.attr(elem, 'hint')).addClass('input-hint');
		}
	}
	
	function a_click(event,animate){
		textarea.val('').trigger('change');
		if( animate == false )
			textarea.height(20);
		else
			textarea.stop().animate({height:20},100);
		
		if( R.attr(elem, 'hint') ) {
			textarea.val(R.attr(elem, 'hint')).addClass('input-hint');
		}
		close.stop().animate({opacity:0},50);
		if( controls ) controls.hide();
		return false; 
	}
	
	function update_bean() {
		if( name ) controller.set(name, this.value);
	}
};
