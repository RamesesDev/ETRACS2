/***
  This is always used when working with web apps. 
  This code is used to track session of the user and receive notifications
  from the server. 
**/
function Notifier(sessionid, url) {

	this.handler;
	this.handlers = {}
	this.connectionListener = {};
	this.url = url;
	
	var self = this;
	
	this.sessionid = sessionid;
	this.tokenid;
	
	//the session must exist for this to start properly
	this.connect = function() {
		if( this.sessionid == null ) {
			alert('cannot connect. No session found');
		}	
		else {
			setTimeout(poll, 100);
		}
	}
	
	var poll = function() {
		//check first if ever url is specified, the current url must match with it.
		if( self.url && self.url != window.location.href ) {
			return;
		}	
	
		var sid = self.sessionid;
		//start polling for server updates.
		var d = {};
		d.sessionid = sid;
		if(self.tokenid) d.tokenid = self.tokenid;
		
		//set the poll url
		var pollURL;
		if( Notifier.contextPath ) {
			pollURL = Notifier.contextPath + '/poll';
		}
		else {
			pollURL = "poll";
		}
		
		$.ajax( 
			{
				url: pollURL,
				type: "POST",
				data: d,
				error: function( xhr ) { 
					if(window.console) window.console.log( "error " + xhr.responseText );
					alert("error " + xhr.status);
				},
				success: function( data ) {
					if( data == null || data.trim().length == 0) {
						setTimeout(poll, 1000);
					}
					else if( data.startsWith("TOKEN")) {
						self.tokenid = data;
						if(self.connectionListener.started) {
							self.connectionListener.started();
						}	
						else if(window.console){
							window.console.log('connection started...new token id '+self.tokenid+" .please provide  handler connectionListener.started to remove this message");
						}	
						poll();
					}		
					else if(data == "_:expired" || data=="_:aborted" || data=="_:destroyed" || data=="_:ended") {
						if( self.connectionListener.ended ) self.connectionListener.ended(data);
						else alert("Session " + data + "! Please provide a connectionListener to remove this message");
					}
					else {
						try {
							if(data.trim().startsWith("{")) {
								data = $.parseJSON(data);
							}
							if( self.handler ) self.handler(data); 
							for(var n in self.handlers) {
								self.handlers[n](data);
							}
						}
						catch(e) {
							if(window.console) window.console.log( "error " + e.message );
						}
						finally {
							poll();
						}
					}
				}
			}
		);
    };
	
	
}

