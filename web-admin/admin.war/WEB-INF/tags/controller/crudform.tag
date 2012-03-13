<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="context" %>
<%@ attribute name="service" %>
<%@ attribute name="object" %>

<script>
	$put( "${context}", 
		new function() {
		
			<c:if test="${empty service}">
			var svc = null;	
			</c:if>
			<c:if test="${!empty service}">
			var svc = ProxyService.lookup( "${service}" );
			</c:if>
		
			this.mode = "create";

			this.saveHandler;
			this.${object} = {}

			this.save = function() {
				if( svc == null ) {
					alert("service must be provided in crudform");
					return null;
				}
				if( this.mode == "create" ) {
					this.${object} = svc.create( this.${object} );
				}
				else {
					this.${object} = svc.update( this.${object} );
				}
				this.saveHandler(this.${object});
				return "_close";
			}
			
			<jsp:doBody/>
			
		}
	);
</script>


