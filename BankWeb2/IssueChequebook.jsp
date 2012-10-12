<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<%

	
	Connection con = null;
	ResultSet rs = null;
	Statement ps=null;
	try
	{
	  int no = Integer.parseInt(request.getParameter("no")); 
	  int leaves = Integer.parseInt(request.getParameter("leaves"));
	  
		//String user_uname = (String)request.getParameter("user");
	
		String pass = (String)request.getParameter("pwd");
	  

	  int bal=0;
	  int msg=0;
	  String user_pwd=null;
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  con = DriverManager.getConnection("jdbc:odbc:bankweb2");
	  
	  //String query="SELECT u_name,address,balance FROM user WHERE acc_no = "; //put acc_no use sessions for acc_no from menu page
		String sql="SELECT balance FROM user WHERE u_pass ='"+pass+"'";
	  ps = con.createStatement();
	  rs=ps.executeQuery(sql);
	  while(rs.next())
	  {   
			
			bal=rs.getInt(1);
		 
	  } 
	   
	 		response.setContentType("text/text");
			response.setHeader("Cache-control", "no-cache");
			if(rs!=null)
				msg=bal;
			else
				msg=0;
					
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
