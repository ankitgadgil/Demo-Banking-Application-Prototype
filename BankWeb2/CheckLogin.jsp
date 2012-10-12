<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>

<%

	Connection con = null;
	ResultSet rs = null;
	Statement ps=null;
	try
	{
	  String user_name = (String)request.getParameter("user");
	  
	  
	  String user_pass = (String)request.getParameter("pwd");
	  
//		HttpSession hs=request.getSession(true);
	
	  int msg=0;
	  String user_pwd=null;
	  
	  Object un=null;
	  
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  con = DriverManager.getConnection("jdbc:odbc:bankweb2");
	  String sql="SELECT u_pass FROM user WHERE u_name ='"+user_name+"'";
	  ps = con.createStatement();
	  rs=ps.executeQuery(sql);
	  
	  while(rs.next())
	  {   
			user_pwd=rs.getString(1);
			
	  } 

	  //hs.putValue(user_name,un);
	  
			response.setContentType("text/text");
			response.setHeader("Cache-control", "no-cache");
			if(user_pass.equals(user_pwd)) 
			{
			//	response.sendRedirect("menu.jsp");	
			msg=1;
			}

			else
			{
				msg=0;
					
			}
			out.println(msg);
 }
catch(SQLException e)
{	
	e.printStackTrace();
}
finally
{
	rs.close();
	ps.close();
	con.close();
}
%>