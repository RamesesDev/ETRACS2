<%@ page contentType="text/plain"%>
<%@ page pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.rameses.invoker.client.*" %>
<%@ page import="com.rameses.server.common.*" %>
<%@ page import="com.rameses.web.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="imagewebutil.*" %>


<%
	try {
		String filename = "";
		Map resp = new HashMap();
		if( "post".equals(request.getMethod().toLowerCase()) ) {
			String resUrl = System.getProperty("ikon.temp.url");
			FileItem fi = (FileItem) request.getAttribute("FILE");
			
			String objid = ""+(request.getParameter("objid")).hashCode();
			String ext = "jpg";
			
			File dest = new File(new URL(resUrl).toURI());
			dest = new File(dest, objid);
			if( !dest.exists() ) dest.mkdirs();
			
			fi.write( new File(dest, "temp") );
			
			ImageUtil iu = new ImageUtil();
			iu.convertToJPG( dest.getPath()+"/temp", dest.getPath()+"/orig."+ext);
			iu.createThumbnail( dest.getPath()+"/orig."+ext, dest.getPath()+"/medium."+ext, ext, 160);
			iu.createThumbnail( dest.getPath()+"/orig."+ext, dest.getPath()+"/thumbnail."+ext, ext, 50);
			
			new File(dest, "temp").delete();
			resp.put("temp_photodir", objid);
		}
		out.write( JsonUtil.toString( resp ) );
	}
	catch(Exception e) {
		e.printStackTrace();
		throw e;
	}
%>

