<%-- 
    Document   : listofmember
    Created on : 22 Jun, 2019, 1:01:17 PM
    Author     : Pallavi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Members</title>
    <%@include file="extfiles.jsp"%>
    <%
                            if(session.getAttribute("n")==null)
                            {
                                response.sendRedirect("login.jsp");
                            }
    %>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <span class="fa fa-user-circle-o"></span>
                </div>
                <div class="content-bottom">
                        <%
                          try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String unm = request.getParameter("uname");
                        
                           String q = "select * from signup";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                          
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               out.print("<table class = 'table table-hover'>"
                               + "<tr>"
                               + "<th>Name</th>"
                               + "<th>Phone</th>"
                               + "<th>Gender</th></tr>");
                               do
                               {
                                   out.print("<tr>"
                                   + "<td>" + myres.getString("name") + "</td>"
                                   + "<td>" + myres.getString("phone") + "</td>"
                                   + "<td>" + myres.getString("gender") + "</td></tr>");
                               }
                               while(myres.next()==true);
                               out.print("</table>");
                           }
                           else
                           {
                               out.print("No records found");
                           }
                        }
                           catch(Exception e)
                           {
                               out.print("Error occured due to"+e.getMessage());
                           }
                           finally
                           {
                               myconn.close();
                           }
                           
                       }
                           catch(Exception e)
                           {
                               out.print("Error in connection"+e.getMessage());
                           }
                       
                       %> 
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- /login -->
        <%@include file="footer.jsp"%>
    </body>
</html>
