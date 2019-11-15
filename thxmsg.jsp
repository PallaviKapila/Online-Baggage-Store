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
            if(session.getAttribute("n")==null)
            {
                response.sendRedirect("login.jsp");
            }
         %>
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
        
           %>
       
         <section class="banner-bottom py-5">
        <div class="container py-md-5">
        <div class="col-lg-6 ab-info-con ab-inf-page text-left">
            <h4>We'll contact you as soon as possible...</h4>
                </div>
        </div>
        </section>
        <%@include file ="footer.jsp"%>
    </body>
</html>
