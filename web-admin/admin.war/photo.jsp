<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.rameses.service.*" %>

<%   
	try {
		String pathinfo = request.getPathInfo().substring(1);
		String path="";
		String userid="";
		String imgsize = "thumbnail";
		String[] patharr = pathinfo.split("/");
		String debug = request.getParameter("debug");
		
		if( patharr.length > 1 ) {
			path = patharr[0];
			userid = patharr[1];
		}
		if( patharr.length > 2 ) {
			imgsize = patharr[2];
		}
		
		
		String resUrl = "";
		if( "temp".equals(path) ) {
			resUrl = System.getProperty("ikon.temp.url");
		}
		else {
			resUrl = System.getProperty("ikon.uploads.url") + "/" + path;
			response.addHeader("Cache-Control", "max-age=86400");
			response.addHeader("Cache-Control", "public");
		}
		
		String target = resUrl + "/" + userid.hashCode() + "/" +imgsize+ ".jpg";
		File f = null;
		try {
			f = new File(new URL(target).toURI());
		}
		catch(Exception e) {
			if( debug != null ) {
				e.printStackTrace();
			}
		}

		response.setContentType("image/jpg");
		
		Writer w = response.getWriter();
		InputStream is = null;
		
		try {
			if( f!=null && f.exists() ) {
				is = new BufferedInputStream(new FileInputStream(f));
			}
			else {
				is = application.getResourceAsStream("img/profile/small.png");
				is = new BufferedInputStream(is);
			}
			int i = -1;
			while( (i=is.read()) != -1 ) w.write(i);
		}
		catch(Exception e) {}
		finally {
			if( is != null ) try{ is.close(); }catch(Exception ign){;}
		}
	}
	catch(Exception e) {
		e.printStackTrace();
		//out.write(e.getMessage());
	}	
%>