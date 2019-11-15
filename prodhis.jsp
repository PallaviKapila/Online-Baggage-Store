<%-- 
    Document   : prodhis
    Created on : 10 Jul, 2019, 5:30:12 PM
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
     
         <section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <h3 align="center">Order Detail</h3><br/>
                     <div class="checkout-right">
            <%

            String oid="",name="",rate="",qty="",price="",pic="";
            
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                    {
                    oid = request.getParameter("orid");
                    String q = "select * from orderitems where orderid=?";

                    PreparedStatement myst = myconn.prepareStatement(q);
                    myst.setString(1, oid);
                    ResultSet myres = myst.executeQuery();
                    
                    if(myres.next()==true)
                    {
                       out.print("<table class = 'table table-hover'>");
                       out.print("<tr>");
                       out.print("<th>Product Name</th>");
                       out.print("<th>Price</th>");
                       out.print("<th>Quantity</th>");
                       out.print("<th>Total Cost</th>");
                       out.print("<th>Picture</th>");
                       out.print("</tr>");
                       do
                       {
                          name = myres.getString("prodname");
                          rate = myres.getString("rate");
                          qty = myres.getString("qty");
                          price = myres.getString("tc");
                          pic = myres.getString("pic");
                          
                          out.print("<tr>"
                                   + "<td>" + name + "</td>"
                                   + "<td>" + rate + "</td>"
                                   + "<td>" + qty + "</td>"
                                   + "<td>" + price + "</td>"
                                   + "<td><img src='uploads/" + pic + "' height='100'></td>"
                                   +"</tr>");
                       
                       }
                       while(myres.next());
                       out.print("</table><br/><br/>");
                       
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
                out.print("Error in connection "+e.getMessage());
            }
            

            %>              
                         
                         </div></div></div></div>
         </section>
        <%@include file ="footer.jsp"%>
        
    </body>
</html>
