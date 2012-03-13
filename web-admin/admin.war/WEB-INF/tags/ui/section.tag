<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>
<%@ tag dynamic-attributes="params" %>

<%
Stack st = (Stack)request.getAttribute( "_panel_flag" );
Map map = (Map)st.peek();
int iv = ((Integer)map.get( "counter")).intValue();
int sp = ((Integer)map.get("cols")).intValue();
boolean _first = false;
boolean _last = false;
if( iv == 0 ) {
	_first = true;
	iv = iv + 1;
	if( iv > sp-1 ) {
		_last = true;
		iv = 0;
	}	
}
else if( iv == (sp-1) ) {
	_last = true;
	iv = 0;
}
else {
	iv = iv + 1;
}
map.put( "counter", new Integer( iv ));
jspContext.setAttribute( "first", new Boolean(_first ));
jspContext.setAttribute( "last", new Boolean(_last ));
%>

<c:if test="${first}"><tr></c:if>
<td valign="top" <c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach>><jsp:doBody/></td>
<c:if test="${last}"></tr></c:if>	