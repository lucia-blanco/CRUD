<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
       <% request.setCharacterEncoding("UTF-8");
    try{
      String username = request.getParameter("alias");   
      String password = request.getParameter("password");
      out.println(username);
      out.println(password);
      Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");    
      PreparedStatement pst = conn.prepareStatement("SELECT alias,passw FROM usuario WHERE alias=? and passw=?");
      pst.setString(1, username);
      pst.setString(2, password);
      ResultSet rs = pst.executeQuery();                        
      if(rs.next()) {     
        //out.println("Valid login credentials");
        response.sendRedirect("home.jsp?alias="+ username);
      } else {
        response.sendRedirect("index.jsp?q=cambia");  
      }
    }
   catch(Exception e){       
    out.println("Something went wrong !! Please try again");       
   }     
%>
    </body>
</html>
