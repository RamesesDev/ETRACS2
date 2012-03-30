/**
  Serializes services that can be used by the client
*/
var Env = {}

function DynamicProxy( context ) {
    this.context = context;
    this.create = function( svcName ) {
        return new _DynamicProxyService( svcName, this.context );
    }
	
	/* DynamicProxy */
	function _DynamicProxyService( name, context ) {
		this.name = name;
		this.context = context;
		
		//reduced to dummy.
		this.env = {};

		var convertResult = function( result ) {
			if(result!=null) {
				//alert( result );
				if( result.trim().substring(0,1) == "["  || result.trim().substring(0,1) == "{"  ) {
					return $.parseJSON(result);
				}
				else {
					return eval(result);
				}
			}
			return null;
		}

		this.invoke = function( action, args, handler ) {
			var urlaction = ProxyService.getContextPath() + "/jsinvoker/"+this.name+ "."+action;
			
			var err = null;			
			var data = {};
			if( args )     { data.args = $.toJSON( args ); }
			
			data.env = $.toJSON( Env );
			
			if(handler==null) {
				var result = $.ajax( {
					url:urlaction,
					type:"POST",
					error: function( xhr ) { 
						err = xhr.responseText; 
					},
					data: data,
					async : false }).responseText;

				if( err!=null ) {
					throw new Error(err);
				}
				return convertResult( result );
			}
			else {
				$.ajax( {
					url: urlaction,
					type: "POST",
					error: function( xhr ) { handler( null, new Error(xhr.responseText) ); },
					data: data,
					async: true,
					success: function( data) { 
						var r = convertResult(data);
						handler(r); 
					}
				});
			}
		}
	}
}

var ProxyService = new function() {
	this.services = {}
	this.lookup = function(name) {
		if( this.services[name]==null ) {
			var err = null;
			var urlaction =  ProxyService.getContextPath() + "/remote-proxy/"+name + ".js";
			var result = $.ajax( {
                url:urlaction,
                type:"POST",
                error: function( xhr ) { err = xhr.responseText },
                async : false }).responseText;
			if( err!=null ) {
				throw new Error(err);
            }
			this.services[name] = eval( result );
		}
		return this.services[name];
	}
};

//helper function
ProxyService.getContextPath = function() {
	if(ProxyService.contextPath) 
		return ProxyService.contextPath;
	
	var contextPath = window.location.pathname.substring(1);
	contextPath = contextPath.substring(0,contextPath.indexOf('/'));
	return "/" + contextPath;
}