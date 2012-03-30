<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	
	<jsp:attribute name="script">
		$put( "useraccount", 
			new function() {
				this.saveHandler;
				this.info;
				
				this.save = function() {
					if( this.info.pwd != this.info.confirmpwd ){
						throw new Error( "Password must be the same as the confirm password" );
						return null;
					}
					else if( confirm( "You are about to save this account. Proceed?") ) {
						this.saveHandler(this.info);
						return "_close";	
					}
				}
			}
		);
	</jsp:attribute>
	
	<jsp:attribute name="rightactions">
		<ui:button caption="Save" context="useraccount" action="save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="useraccount">
			
			<ui:form object="info" width="400px">
				<ui:label caption="Login for" rtexpression="true"><b>#{info.lastname}, #{info.firstname}</b></ui:label>
				<ui:label>&nbsp;</ui:label>
				<ui:text caption="User Name" name="uid" required="true"/>
				<ui:password caption="Password" name="pwd" required="true"/>
				<ui:password caption="Confirm Password" name="confirmpwd" required="true"/>
				<ui:text caption="Email" name="email" textcase="none" style="width:100%"/>
			</ui:form>
		</ui:context>
	</jsp:body>
	
</t:popup>