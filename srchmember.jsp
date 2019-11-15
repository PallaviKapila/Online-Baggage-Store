<%-- 
    Document   : srchmember
    Created on : 22 Jun, 2019, 12:49:32 PM
    Author     : Pallavi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Member</title>
    <%@include file="extfiles.jsp"%>
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
                    <form name ="form1" method="post">
                         <div class="field-group">

                            <div class="content-input-field">
                                <input name="uname" type="email" placeholder="User Email(username)" required>
                            </div>
                        </div>
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Search">
                        </div>
                        <%
                           
                       if(request.getParameter("s1")!=null)
                       {
                           try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String unm = request.getParameter("uname");
                        
                           String q = "select * from signup where Username=?";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1,unm);
                           
                     
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               out.print("<b> Name:- </b>" + myres.getString("name") + "<br/>");
                               out.print("<b> Phone:- </b>" + myres.getString("phone") + "<br/>");
                               out.print("<b> Gender:- </b>" + myres.getString("gender") + "<br/>");
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
