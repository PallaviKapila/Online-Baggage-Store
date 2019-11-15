<%-- 
    Document   : updatestatus
    Created on : 20 Jul, 2019, 5:15:35 PM
    Author     : Pallavi
--%>
<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baggage Online Store</title>
        <%@include file="extfiles.jsp"%>  
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <%
            
            String oid="",currst="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
            String q = "select * from ordertable where orderid=? and status=?";

            PreparedStatement myst = myconn.prepareStatement(q);
            oid=request.getParameter("orid");
            currst=request.getParameter("currst");
   
        %>    
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="content-bottom">
                    <form name ="form1" id ="form1" method="post">
                         <div class="field-group">

                            <div class="content-input-field">
                                <b>Order Id :-</b> <%out.print(oid);%><br/><br/>
                                <b>Current Status :-</b> <%out.print(currst);%><br/><br/>
                                <b>New Status :-</b> <select name="newst" class="container" class="content-grid" class="content-bottom" required>
                                     <option value="">Choose</option>
                                     <option>Shipped</option>
                                     <option>In-Transit</option>
                                     <option>Delivered</option>
                                     <option>Delayed</option>
                                     <option>Canceled</option>
                                 </select>
                            </div>
                        </div><br/><br/>
                        
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Update">
                        </div>
                        
                       
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- /login -->
        <%@include file="footer.jsp"%>
    </body>
</html>
