<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>

<%

	Connection con = null;
	ResultSet rs = null;
	Statement ps=null;
	int bal=0;
	int uid=0;
	try
	{
	  String pass = (String)request.getParameter("pwd");
	  String billtype =(String)request.getParameter("billtype");
	  int billamt = Integer.parseInt(request.getParameter("billamt"));

//		HttpSession hs=request.getSession(true);
	
	  int msg=0;
	  int new_bal=0;
	  String user_pwd=null;
	  
	  Object un=null;
	  
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  con = DriverManager.getConnection("jdbc:odbc:bankweb2");
	  String sql="SELECT balance,u_id FROM user WHERE u_pass ='"+pass+"'";
	  ps = con.createStatement();
	  rs=ps.executeQuery(sql);
	  
	  while(rs.next())
	  {   
			bal=rs.getInt(1);
			uid=rs.getInt(2);
			
	  } 

	PreparedStatement stmt_upd = con.prepareStatement("INSERT INTO bill VALUES(?,?,?,?)");

	//stmt_upd.setInt(1,);
	stmt_upd.setInt(2,billamt);
	stmt_upd.setString(3,billtype);
	
	stmt_upd.setInt(4,uid);
	
	new_bal = bal-billamt;
	
	PreparedStatement stmt_upd_1 = con.prepareStatement("UPDATE user SET balance= ? WHERE u_pass=?");
	
	stmt_upd_1.setInt(1,new_bal);
	stmt_upd_1.setString(2,pass);

	//stmt_upd.executeUpdate();

	  //hs.putValue(user_name,un);
	  
			response.setContentType("text/text");
			response.setHeader("Cache-control", "no-cache");
			if(rs==null) 
			{
			//	response.sendRedirect("menu.jsp");	
			msg=0;
			}

			else
			{
				msg=new_bal;
					
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