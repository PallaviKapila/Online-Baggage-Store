<%-- 
    Document   : thx.jsp
    Created on : 20 Jun, 2019, 6:31:45 PM
    Author     : Pallavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanks</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%
           if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
           {
         %>
         <%@include file="adminheader.jsp"%>
         <%
          }
          else
           {
           %>
        <%@include file="header.jsp"%>
        <%
         }
        %>
         <section class="banner-bottom py-5">
        <div class="container py-md-5">
        <div class="col-lg-6 ab-info-con ab-inf-page text-left">
            <h4>Thanks For Signing</h4>
                </div>
        </div>
        </section>
        <%@include file ="footer.jsp"%>
    </body>
</html>
