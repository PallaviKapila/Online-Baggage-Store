<%-- 
    Document   : addadmin
    Created on : 22 Jun, 2019, 1:03:32 PM
    Author     : Pallavi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Admin</title>
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
                    <form name="form1" method="post">
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="nm" type="text" placeholder="Name" required pattern="^[a-zA-Z _]+$" minlength="3" maxlength="25">
                            </div>
                        </div>
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="uname" type="email" placeholder="User Email(username)" required>
                            </div>
                        </div>
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="phn" type="text" placeholder="Phone Number" required pattern="^[0-9]+$" minlength="10" maxlength="10">
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <select name="gen" required class="container" class="content-grid" class="content-bottom">
                                    <option value ="">Choose Gender</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                    <option>Others</option>
                                </select>
                            </div>
                        </div><br/>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="pass" type="Password" placeholder="Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                            </div>
                        </div>
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Add Admin">
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
                           String n = request.getParameter("nm");
                           String unm = request.getParameter("uname");
                           String ph = request.getParameter("phn");
                           String gend = request.getParameter("gen");
                           String pass = request.getParameter("pass");
                           
                           
                           String q = "insert into signup values(?,?,?,?,?,?)";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1,n);
                           myst.setString(2,unm);
                           myst.setString(3,ph);
                           myst.setString(4,gend);
                           myst.setString(5,pass);
                           myst.setString(6,"admin");
                           
                           int count = myst.executeUpdate();
                           
                           if(count==1)
                           {
                               response.sendRedirect("adminhome.jsp");
                           }
                           else
                           {
                               out.print("Some error occured, try again");
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
        <%@include file="footer.jsp"%>
    </body>
</html>

