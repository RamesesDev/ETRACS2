<!DOCTYPE html>
<html>
    <head>
        <title>Rameses Server Web Installer</title>
		<link href="style.css" rel="stylesheet"/>
		<script type="text/javascript" src="jquery-1.6.js"></script>
    </head>
    <body>
		<div class="f-left">
			<img src="img/etracs.png" height="70px" width="230px"/>
		</div>
        <form method="post" action="install.jsp" onsubmit="return validate(this);" class="f-left content" style="display:none">
			<h2>ETRACS version 2.0 Server Web Installer (version 1.0)</h2>
			
            <span class="title">
                App. Name: *
            </span>
            <input type="text" name="appname" caption="App Name"/>
			<span class="error"></span>
            <br/>
			<span class="title">
                LGU Formal Name: *
            </span>
            <input type="text" name="lguname" caption="LGU Formal Name"/>
			<span class="error"></span>
            <br/>
			<span class="title">
                Server IP Address: *
            </span>
            <input type="text" name="server_ip" caption="Server IP Address"/>
			<span class="error"></span>
            <br/>
			<span class="title">
                Server Port: *
            </span>
            <input type="text" name="server_port" caption="Server Port" value="8080"/>
			<span class="error"></span>
			<input type="hidden" name="server_address" />
            <br/>
			
            <h3>Database Settings</h3>
			
            <span class="title">
                DB Host IP Address: *
            </span>
            <input type="text" name="dbhost" caption="Database Host" value="localhost"/>
			<span class="error"></span>
            <br/>
            <span class="title">
                Username: *
            </span>
            <input type="text" name="dbuser" caption="Database Username"/>
			<span class="error"></span>
            <br/>
            <span class="title">
                Password:
            </span>
            <input type="password" name="dbpwd"/>
			<span class="error"></span>
			<br/>
			<span class="title">
                Confirm Password:
            </span>
            <input type="password" name="c_dbpwd"/>
			<span class="error"></span>
			<br/>
			
			<h3>Root Admin Account</h3>

            <span class="title">
                Username: *
            </span>
            <input type="text" name="adminuser" caption="Admin Username"/>
			<span class="error"></span>
            <br/>
            <span class="title">
                Password: *
            </span>
            <input type="password" name="adminpwd" caption="Admin Password"/>
			<span class="error"></span>
			<br/>
			<span class="title">
                Confirm Password: *
            </span>
            <input type="password" name="c_adminpwd" caption="Admin Confirm Password"/>
			<span class="error"></span>
			<br/>
			
			<button type="submit">Install</button>
        </form>
		
		
		<div id="overlay" style="display:none"></div>
		<div id="feedbak" style="display:none">
			<div id="content" class="clearfix">
				<img src="img/ajax.gif" class="f-left"/>
				<div>
					<h3 id="status"></h3>
					<hr/>
					<span id="msg"></span>
					<div class="btn">
						<button onclick="closeFeedbak()">Retry</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<script>
			String.prototype.trim = function() {
				return this.replace(/^\s+|\s+$/g, '');
			};
			
			$('span.error').hide();
			$('input[name="appname"]').blur(function(){
				this.value = this.value.trim().replace(/\s+/g, '_').toLowerCase();
			});
			$('form').fadeIn();
			$('form input:text:first').focus();
			
			function validate( form ) {
				if( !form.dbhost.value.trim() ) form.dbhost.value = 'localhost';
				
				var hasError = false;
				for(var i=0; i < form.elements.length; ++i) {
					var e = form.elements[i];
					if( !e.name ) continue;
					if( !e.getAttribute('caption') ) continue;
					
					var val = e.value.trim();
					e.value = val;
					if( !val ) {
						$(e).next().html( $(e).attr('caption') + ' is required' ).fadeIn();
						if(!hasError) $(e).focus();
						hasError = true;
					}
					else {
						$(e).next().fadeOut();
					}
				};

				if( form.dbpwd.value != form.c_dbpwd.value ) {
					$(form.c_dbpwd).next().html('Confirm Password does not match the Password.').fadeIn();
					hasError = true;
				}
				else if( !hasError ) {
					$(form.c_dbpwd).next().fadeOut();
				}
				
				if( form.adminpwd.value != form.c_adminpwd.value ) {
					$(form.c_adminpwd).next().html('Confirm Password does not match the Password.').fadeIn();
					hasError = true;
				}
				else if( !hasError ) {
					$(form.c_adminpwd).next().fadeOut();
				}
				
				if( hasError ) return false;
				
				form.server_address.value = form.server_ip.value;
				if( form.server_port.value )
					form.server_address.value += ":" + form.server_port.value;
				
				if( confirm('You are about to install the server. Please verify all the entries are correct. Proceed?') ) {
					start( form );
				}
				
				return false;
			}
			
			function start( form ) {
				$('#overlay').css('opacity',0.4).show();
				$('#feedbak').css('opacity',0).show().animate({opacity: 0.9});
				$('#feedbak .btn').hide();
				$('#feedbak #status').html('Please wait...');
				$('#feedbak #msg').html('Building server configuration...');
				
				$.ajax({
					url: 'install.jsp',
					type: 'post',
					data: $(form).serialize(),
					complete: function(req) {
						var text = req.responseText.trim();
						if( text == 'DONE' ) {
							waitForDeployment();
							$('#feedbak #msg').html('Deploying ETRACS version 2.0 server...');
						}
						else {
							$('#feedbak #status').html('Error');
							$('#feedbak #msg').html(text);
							$('#feedbak .btn').fadeIn();
						}
					}
				});
			}
			
			function closeFeedbak() {
				$('#overlay').fadeOut();
				$('#feedbak').fadeOut();
			}			
			
			function waitForDeployment() {
				$.ajax({
					url: '/admin',
					type: 'get',
					complete: function(req) {
						if( req.status != 200 ) {
							setTimeout( waitForDeployment, 1500 );
						}
						else {
							location.href = 'success.jsp';
						}
					}
				});
			}
		</script>
    </body>
</html>
