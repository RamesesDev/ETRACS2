<%@ page import="org.apache.tools.ant.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rameses.util.*" %>


<%
	Iterator itr = request.getParameterMap().entrySet().iterator();
	while( itr.hasNext() ) {
		System.out.println( itr.next() );
	}
	
	//check if already installed
	String appname = request.getParameter("appname");
	String server_port = request.getParameter("server_port");
	String server_ip = request.getParameter("server_ip");
	String server_address = server_ip;
	if( server_port != null && server_port.length() > 0 ) {
		server_address += ":" + server_port;
	}
	
	File f = new File(System.getProperty( "jboss.server.home.dir" ) + "/apps/" + appname + ".ear");
	
	if( f.exists() ) 
	{
		out.write("Error: <u><b>" + appname + "</b></u> ERACS Server is already installed.");
	}
	else 
	{
		//test mysql connection first
		String dbhost = request.getParameter("dbhost");
		String dbuser = request.getParameter("dbuser");
		String dbpwd = request.getParameter("dbpwd");
		
		boolean hasError = false;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://" + dbhost + "/test", dbuser, dbpwd);
		}
		catch(Exception e) {
			out.write("Error: " + e.getMessage() );
			hasError = true;
		}
		
		if( !hasError ) 
		{
			try {
				File build = new File(System.getProperty( "jboss.server.home.dir" ) + "/apps/install.war/res/build.xml");
				Project p = new Project();
				p.setUserProperty( "ant.file", build.getAbsolutePath() );
				p.setUserProperty( "rootpath", System.getProperty( "jboss.server.home.dir" )+"/apps" );
				p.setUserProperty( "appname", appname  );
				p.setUserProperty( "lguname", request.getParameter("lguname")  );
				p.setUserProperty( "server_address", server_address  );
				p.setUserProperty( "dbhost", dbhost  );
				p.setUserProperty( "dbuser", dbuser  );
				p.setUserProperty( "main_dbname", appname + "_etracs"  );
				p.setUserProperty( "system_dbname", appname + "_system"  );
				p.setUserProperty( "dbpwd", dbpwd );
				
				
				//so we can monitor logs in the console
				DefaultLogger logger = new DefaultLogger();
				logger.setOutputPrintStream( System.out );
				logger.setErrorPrintStream(System.err);
				logger.setMessageOutputLevel(Project.MSG_INFO);
				p.addBuildListener(logger);
				
				try {
					p.fireBuildStarted();
					p.init();
					ProjectHelper helper = ProjectHelper.getProjectHelper();
					p.addReference("ant.projectHelper", helper);
					helper.parse(p, build);
					p.executeTarget(p.getDefaultTarget());
					p.fireBuildFinished(null);
				} catch (BuildException e) {
					e.printStackTrace();
					p.fireBuildFinished(e);
					out.write("Failed to install the server. Error Message: " + e.getMessage());
					hasError = true;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		
		if( conn != null && !hasError ) 
		{
			try {
				String maindb = appname + "_etracs";
				String systemdb = appname + "_system";
				PreparedStatement ps = conn.prepareStatement("update " +maindb+  ".useraccount set uid=?, pwd=? where objid=?");
				String uid = request.getParameter("adminuser");
				String pwd = request.getParameter("adminpwd");
				ps.setString(1, uid);
				ps.setString(2, Encoder.MD5.encode(pwd, uid));
				ps.setString(3, "admin");
				ps.executeUpdate();
				ps.executeUpdate("replace into "+systemdb+".sys_var(name,value) select 'server_address', '" +server_address+ "'");
			} 
			catch(Exception e) {
				out.write("Error: " + e.getMessage());
				hasError = true;
			}
			
			try{ conn.close(); }catch(Exception e){}
		}
		
		if( !hasError ) {
			File file  = new File( System.getProperty("jboss.server.home.dir") + "/apps/install.war//installed" );
			file.createNewFile();
			out.write("DONE");
		}
	}
%>