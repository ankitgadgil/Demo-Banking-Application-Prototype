<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<%

	String user_name = (String)request.getParameter("user");

	  int bal=0,acc=0;
	  int msg=0;
	  String user_pwd=null;
	  String u_name=null, add=null;

	Connection con = null;
	ResultSet rs = null;
	Statement ps=null;
	try
	{
	  
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  con = DriverManager.getConnection("jdbc:odbc:bankweb2");
	  String query="SELECT * FROM user WHERE u_name='"+user_name+"'";;
	  // put account no using sessions

	  ps = con.createStatement();
	  rs=ps.executeQuery(query);
	  
	   while(rs.next())
		{   
		   u_name= rs.getString(2);
			acc = rs.getInt(4);
			bal=rs.getInt(5);
			add=rs.getString(6);
		}

		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE> Banking Profile </TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<h2> User: "+user_name+"</h2>");
		out.println("<center><h1> CVPL Bank </h1> </center>");
		out.println("<div align=\"right\"> <a href=\"index.html\"> <button type=\"submit\"> Logout </button> </a> </div>");
		out.println("<div id=\"one\" style=\"float:left;\">");

		
		out.println("<h1> Account Statement </h1>");
		out.println(" <h2>Account No: "+acc+"</h2>");
		out.println(" <h2>User Name: "+u_name+"</h2>");
		out.println(" <h2>Available Balance: INR "+bal+"/-</h2>");
		out.println(" <h2>Address: "+add+"</h2>");
		

		out.println("<hr>");
		out.println("</div>");
		out.println("<div id=\"two\" style=\"float:left;\">");
		out.println("</div>");
		out.println("<div id=\"three\" style=\"float:right;\">");
		out.println("<img src=\"1.jpg\" alt=\"Big Bank\">");
		out.println("</div>");
		out.println("</BODY>");
		out.println("</HTML>");
		
	}
	
	
	catch(SQLException se)
	{
		se.printStackTrace();	
	}

	finally
	{	
		rs.close();
		ps.close();
		con.close();
	}
%>
