<%-- 
    Document   : login
    Created on : 20 Jun, 2019, 10:54:07 AM
    Author     : Pallavi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <%@include file="extfiles.jsp"%>
    </head>
  
    <body>
      <%
            if(session.getAttribute("n")==null)
           {
         %>
         <%@include file="header.jsp"%>
         <%
          }
          else if(session.getAttribute("utype").toString().equalsIgnoreCase("normal"))
           {
           %>
        <%@include file="header.jsp"%>
        <%
          }
        else if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
           {
           %>
        <%@include file="adminheader.jsp"%>
        <%
         }
        
           %>
         
        
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <span class="fa fa-unlock-alt"></span>
                </div>
                <div class="content-bottom">
                    <form name ="form1" method="post">
                      
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="newpass" type="password" placeholder="New Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="cnewpass" type="password" placeholder="Confirm Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                            </div>
                        </div>
                      
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Change Password">
                        </div>
                        <%
                           
                       if(request.getParameter("s1")!=null)
                       {
                           String newp = request.getParameter("newpass");
                           String cnewp = request.getParameter("cnewpass");
                           
                           if(newp.equals(cnewp))
                           {
                           try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           
                           String q = "update signup set password=? where username=? or phone=?";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1,newp);
                           myst.setString(2,session.getAttribute("uname").toString());
                           myst.setString(3,cnewp);
                           
                           
                           int count = myst.executeUpdate();
                           
                           if(count==1)
                           {
                               out.print("Password changed successfully");    
                           }
                           else
                           {
                               out.print("Some error ocuured , try again");
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
                           else
                           {
                               out.print("Password doesn't match");
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
