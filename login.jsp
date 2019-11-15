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
        <title>Sign-In</title>
        <%@include file="extfiles.jsp"%>
        <script src="js/jquery.js"></script>
        <script>
     $(document).ready(function()
    {
        $('#form1').submit(function(e){
        e.preventDefault();
        $.ajax({
        type: 'post',
        url: 'loginajax.jsp',
        data: $("#form1").serialize(),
        success: function(reslt)
        {
          if($.trim(reslt)=="admin")
          {
              window.location="adminhome.jsp";
          }
          else if($.trim(reslt)=="incorrect")
          {
              $('#msgdiv').html("Incorrect Username/Password");
          }
          else if($.trim(reslt)=="normal")
          {
              window.location="index.jsp";
          }
          },
          error: function(e)
          {
              $('#msgdiv').html("Error in ajax");
          }
        });
        });
 });
        </script>   
    </head>
    <body>
         <%@include file="header.jsp"%>
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <span class="fa fa-unlock-alt"></span>
                </div>
                <div class="content-bottom">
                    <form name ="form1" id ="form1" method="post">
                         <div class="field-group">

                            <div class="content-input-field">
                                <input name="uname" type="email" placeholder="User Email or phone " required>
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="pass" type="Password" placeholder="Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                            </div>
                        </div>
                        
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Sign In">
                        </div>
                        <div id="msgdiv">
                            
                        </div>
                        <ul class="list-login">
                            <li>
                                <a href="forgotpass.jsp" class="text-right">Forgot password?</a>
                            </li>
                            <li class="clearfix"></li>
                        </ul>
                        <ul class="list-login-bottom">
                            <li class="">
                                <a href="signup.jsp" class="">Don't have an Account?</a>
                            </li>
          
                            <li class="clearfix"></li>
                        </ul>
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
                           String pass = request.getParameter("pass");
                           
                           
                           String q = "select * from signup where (Username=? or Phone = ?) and Password = ?";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1,unm);
                           myst.setString(2,unm);
                           myst.setString(3,pass);
                           
                           
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               session.setAttribute("n",myres.getString("name"));
                               session.setAttribute("uname",myres.getString("username"));
                               session.setAttribute("phone",myres.getString("phone"));
                               if(myres.getString("usertype").equalsIgnoreCase("admin"))
                               {
                                   response.sendRedirect("adminhome.jsp");
                               }
                               else
                               {
                               response.sendRedirect("index.jsp");
                               }       
                           }
                           else
                           {
                               out.print("Incoreect Username/Password");
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
