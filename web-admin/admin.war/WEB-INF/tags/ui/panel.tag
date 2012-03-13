<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="cols" type="java.lang.Integer" %>
<%@ tag dynamic-attributes="params" %>

<%
	if(cols==null) cols = new Integer(1);
	Stack st = null;
	st = (Stack)request.getAttribute( "_panel_flag" );
	if(st==null) {
		st = new Stack();
		request.setAttribute( "_panel_flag", st );
	}
	Map map = new HashMap();
	map.put( "counter", new Integer(0));
	map.put( "cols", cols);
	st.push( map );
%>
	
<table <c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach>>
	<jsp:doBody/>
	<%
		map = (Map)st.pop();
		int counter = ((Integer)map.get("counter")).intValue();
		int sp = cols.intValue();
		if( counter != 0 ) {
			for( int i=0; i < (sp-counter); i++) {
				out.print( "<td>&nbsp;</td>");
			}
			out.print( "</tr>");
		}
		if( st.empty() ) {
			request.removeAttribute("_panel_flag");
		}
	%>
</table> 
