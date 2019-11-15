<%-- 
    Document   : contactus
    Created on : 19 Jun, 2019, 6:37:17 PM
    Author     : Pallavi
--%>
<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us </title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%
                            if(session.getAttribute("n")==null)
                            {
                                response.sendRedirect("login.jsp");
                            }
         %>
        <!--/contact -->
    <section class="banner-bottom py-5">
        <div class="container py-md-5">
            <h3 align="left" class="title-wthree mb-lg-5 mb-4 text-center">Contact Us </h3>
            <div class="row contact_information">
                <div class="col-md-6">
                    <div class="contact_right p-lg-5 p-4">
                        <form method="post">
                            <div class="field-group">

                                <div class="content-input-field">
                                    <input name="n" type="text"  placeholder="User Name" required>
                                </div>
                            </div>
                            <div class="field-group">

                                <div class="content-input-field">
                                    <input name="unm" type="email"  placeholder="User Email" required>
                                </div>
                            </div>
                            <div class="field-group">

                                <div class="content-input-field">
                                    <input name="ph" type="text"  placeholder="User Phone" required>
                                </div>
                            </div>
                            <div class="field-group">
                                <div class="content-input-field">
                                    <input name="pass" type="Password" placeholder="Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">
                                </div>
                            </div>
                            <div class="field-group">
                                <div class="content-input-field">
                                    <input name="msg" placeholder="Your Message Here..." required>
                                </div>
                            </div>
                            <div class="content-input-field">
                                <button type="submit" class="btn" name="s1">Submit</button>
                            </div>
                    <%
                        String n="",unm="",ph="",pass="",msg="";
                       if(request.getParameter("s1")!=null)
                       {
                           try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           
                           n = request.getParameter("n");
                           unm = request.getParameter("unm");
                           ph = request.getParameter("ph");
                           pass = request.getParameter("pass");
                           msg = request.getParameter("msg");
                           
                           String q = "insert into contact values(?,?,?,?,?)";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1,n);
                           myst.setString(2,unm);
                           myst.setString(3,ph);
                           myst.setString(4,pass);
                           myst.setString(5,msg);
                           
                           int count = myst.executeUpdate();
                           
                           if(count==1)
                           {
                               response.sendRedirect("thxmsg.jsp");
                           }
                           else
                           {
                               out.print("Some error occured, try again");
                           }
                           }
                           catch(Exception e)
                           {
                               out.print("Error occurred due to "+e.getMessage());
                           }
                           finally
                           {
                               myconn.close();
                           }
                           
                       }
                           catch(Exception e)
                           {
                               out.print("Error in connection "+e.getMessage());
                           }
                       }
                       %> 
                        </form>
                    </div>
                </div>
                <div class="col-md-6 contact_left p-4">
                 
                </div>

                <div class="col-lg-4 col-md-6 mt-lg-4 contact-inn-w3pvt">
                    <div class="mt-5 information-wthree">
                        <h4 class="text-uppercase mb-4"><span class="fa fa-comments"></span> Communication</h4>
                        <p class="cont-wthree-para mb-3 text-capitalize">for general queries, please email us at <a href="mailto:pallavikapila111@gmail.com">pallavikapila111@gmail.com</a></p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-lg-4 contact-inn-w3pvt">
                    <div class="mt-5 information-wthree">
                        <h4 class="text-uppercase mb-4"><span class="fa fa-life-ring"></span> Technical Support</h4>
                        <p class="cont-wthree-para mb-3 text-capitalize">we are ready to help! if you have any queries or issues, contact us for support <label>+91 88475 13003</label>.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-lg-4 contact-inn-w3pvt">
                    <div class="mt-5 information-wthree">
                        <h4 class="text-uppercase mb-4"><span class="fa fa-map"></span> Others</h4>
                        <p class="cont-wthree-para mb-3 text-capitalize">we are ready to help! if you have any queries or issues, contact us for support <label>+91 94645 97829</label>.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//contact -->
        <%@include file="footer.jsp"%>
    </body>
</html>
