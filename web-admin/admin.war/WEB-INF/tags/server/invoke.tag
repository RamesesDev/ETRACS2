<%@ tag import="com.rameses.service.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*"%>
<%@ attribute name="appcontext"%>
<%@ attribute name="host"%>
<%@ attribute name="service"%>
<%@ attribute name="method"%>
<%@ attribute name="var"%>
<%@ attribute name="json"%>
<%@ attribute name="params" rtexprvalue="true" type="java.lang.Object" required="false"%>
<%@ attribute name="env" rtexprvalue="true" type="java.lang.Object" required="false"%>
<%@ attribute name="debug"%>

<%
	
	try {
		if(host==null) host = application.getInitParameter("app.host");
		if(appcontext==null) appcontext = application.getInitParameter("app.context");
		
		Map _env = new HashMap();
		if(request.getAttribute("SESSIONID")!=null) {
			_env.put("sessionid", request.getAttribute("SESSIONID"));
		}
		if( env instanceof Map ) {
			_env.putAll( (Map) env );
		}
		Map conf = new HashMap();
		conf.put("app.host", host );
		conf.put("app.context", appcontext );
		
		ScriptServiceContext svc = new ScriptServiceContext(conf);
		ServiceProxy ac = (ServiceProxy) svc.create( service, _env );
		Object o = null;
		
		if(params==null) {
			o = ac.invoke(method);
		}
		else if( params instanceof javax.servlet.http.HttpServletRequest) {
			javax.servlet.http.HttpServletRequest req = (javax.servlet.http.HttpServletRequest)params;
			Map m = new HashMap();
			Enumeration e = req.getParameterNames();
			while(e.hasMoreElements() ) {
				String n = (String)e.nextElement();
				m.put(n, req.getParameter(n) );
			}
			o = ac.invoke(method, new Object[]{m});
		}
		else if(params instanceof List) {
			o = ac.invoke(method, ((List) params).toArray() );
		}
		else {
			o = ac.invoke(method, new Object[]{params});
		}

		if( json!=null ) {
			o = JsonUtil.toString(o);	
			if( var == null ) {
				out.write( (String) o );
			}	
		}
		
		if(var!=null) {
			request.setAttribute(var, o);
		}
		
		request.setAttribute("error", null);
		
	}
	catch(Exception e) {
		if("true".equals(debug)) e.printStackTrace();
		
		String errorMessage = "";
		e = com.rameses.util.ExceptionManager.getOriginal(e);
		if( e != null ) errorMessage = e.getMessage();
		
		request.setAttribute("error", errorMessage );
	} 	
%>

