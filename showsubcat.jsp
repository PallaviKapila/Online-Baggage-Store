<%-- 
    Document   : adminhome
    Created on : 22 Jun, 2019, 1:03:42 PM
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
        
        <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Sub Category</h3>
            <div class="left-ads-display col-12">
            <div class="row">
            
           <%           
                      try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
            try
            {
                String q = "select * from managesubcat where catid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("catid"));
                ResultSet myres = myst.executeQuery();
                if(myres.next()==true)
                {
                    do
                    {
                        out.print("<div class='col-lg-4 col-md-6 col-sm-6 product-men women_two'>"
                                 +"<div class='product-toys-info'>"
                                 +" <div class='men-pro-item'>"
                                 +"<div class='men-thumb-item'>"
                                 +"<img  style='width:100% !important;height:300px !important' src='uploads/" + myres.getString("subcatpic")+ "'class='img-thumbnail' alt=''>"
                                 +" </div>"
                                 +"<div class='item-info-product'>"
                                 +"<div class='info-product-price'>"
                                 +"<div class='grid_meta'>"
                                 +"<div class='product_price'>"
                                 +"<h4>"
                                 +"<a href='showprod.jsp?subcatid=" + myres.getString("subcatid")+ "'>"+myres.getString("subcatname") + "</a>"
                                 +"</h4>"
                                 +"</div>"
                                 +"</div>"
                                 +"</div>"
                                 +"<div class='clearfix'></div>"
                                 +"</div>"
                                 +"</div>"
                                 +"</div>"
                                 +"</div>");
                                
                     }
                    while(myres.next());
                }
                else
                {
                    out.print("No records found");
                }
            }
            catch(Exception e)
            {
                out.print("Error Occured " + e.getMessage());
            }
            finally
            {
                myconn.close();
            }
        }   
        catch(Exception e)
        {
            out.print("Error in connection" + e.getMessage());
        } 
        %>
</div>
            </div>
         </div>
    </section>
        <%@include file ="footer.jsp"%>
    </body>
</html>

