<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<%@ attribute name="context" %>
<%@ attribute name="service" %>
<%@ attribute name="rows" %>


<script>
	$put( "${context}", 
		new function() {
			
			<c:if test="${empty service}">
			var svc = null;	
			</c:if>
			<c:if test="${!empty service}">
			var svc = ProxyService.lookup( "${service}" );
			</c:if>
			
			var self = this;
			this.selectedItem;
			this.query = {}
			
			this.listHandler;
			
			this.listModel = {
				rows: ${ (empty rows) ? 10 : rows},
				fetchList: function(o) {
					if( o == null ) o = {};
					for( var n in self.query ) {
						window.console.log( n + "=" + self.query[n] );
						o[n] = self.query[n];
					}
					if( self.listHandler ) 
						return self.listHandler(o);
					else
						return svc.getList( o );	
				}
			}
			
			this.refreshList = function(o) {
				self.listModel.refresh(true);	
			}
			
			<jsp:doBody/>
		}
	);
</script>
