<%@ attribute name="appcontext" rtexprvalue="true" %>
<%@ attribute name="from" rtexprvalue="true" %>
<%@ attribute name="recipients" rtexprvalue="true" %>
<%@ attribute name="subject"  rtexprvalue="true" %>

<%@ taglib tagdir="/WEB-INF/tags/common" prefix="svc" %>
<%@ tag import="java.util.*" %>

<jsp:doBody var="message" scope="request"/>

<%
	Map map = new HashMap();
	map.put( "from", from );
	String[] arr = ((String)recipients).split(",");
	List list = new ArrayList();
	for(int i=0; i<arr.length; i++ ) {
		list.add( arr[i] );
	}
	map.put( "recipients", list );
	map.put( "subject", subject );
	map.put("message", request.getAttribute("message") );
	List l = new ArrayList();
	l.add( map ); 
	request.setAttribute( "args", l );
%>

<svc:invoke appcontext="${appcontext}" service="EmailService" method="send" params="${args}" var="info" /> 





