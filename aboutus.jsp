<%-- 
    Document   : aboutus
    Created on : 20 Jun, 2019, 10:57:43 AM
    Author     : Pallavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
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
       
           %>
        
        
        <!-- //banner-->
    <!--/banner-bottom -->
    <section class="banner-bottom py-5">
        <div class="container py-md-5">
            <div class="row grids-wthree-info">
                <div class="col-lg-6 bag-img">
                    <img src="images/bag1.png" class="img-fluid" alt="" />
                </div>
                <div class="col-lg-6 ab-info-con ab-inf-page text-left">
                    <h4>About Our Baggage</h4>
                    <p>When you’re looking for a great new bag, searching for a durable new suitcase, or shopping for luggage online, eBags is your number one luggage store to shop. Ask anyone who loves to travel where to buy luggage online and you’re going to hear one answer – Baggage Online Store. With over 15 years’ experience selling every type of bag from purse to weekend bag to oversized baggage we’re proud to say that we’ve shipped over 31 million bags and travel accessories to men and women all around the globe. Thinking luggage store near me? Think Baggage Online Store.
                        </p>
                    <a href="showcat.jsp" class="btn shop mt-4">Shop Now</a>
                </div>
            </div>
            <div class="row grids-wthree-info text-center">
                <div class="col-lg-4 ab-content">
                    <div class="ab-info-con">
                        <h4>Fast & Free Delivery</h4>
                        
                    </div>
                </div>
                <div class="col-lg-4 ab-content">
                    <div class="ab-info-con">
                        <h4>Safe & Secure Payments</h4>
                       
                    </div>
                </div>
                <div class="col-lg-4 ab-content">
                    <div class="ab-info-con">
                        <h4>100% Money Back Guarantee</h4>
                       
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- /banner-bottom -->
    <!--/banner-bottom -->
    <section class="collections">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 ab-content-img">

                </div>
                <div class="col-md-4 ab-content text-center p-lg-5 p-3 my-lg-5">
                    <h4>Travel Must Haves</h4>
                    <p>Planning a trip? Visit Baggage Online Store travel store for your must buy travel bag and accessories. Flying by plane? Choose from the best carry-on luggage available that fits the airlines specifications and size. Hiking? Purchase durable camping gear; strong tents, sleeping bags, and a hiking backpack from brands like Swissgear and The Northface. Baggage Online Store was started by pioneers and takes pride in continuing to spearhead innovative solutions across all demographics. Thinking travel? Think Baggage Online Store.</p>
                    <a href="showcat.jsp" class="btn shop mt-3">Shop Now</a>

                </div>
            </div>
        </div>
    </section>
    <!-- /banner-bottom -->
    <!--/collections -->
    <section class="banner-bottom py-5">
        <div class="container py-md-5">

            <h3 class="title-wthree mb-lg-5 mb-4 text-center">Safety Meets Style </h3>
            <div class="row text-center">


                <div class="col-md-4 content-gd-wthree">
                    <img src="images/c1.jpg" class="img-fluid" alt="" />
                </div>
                <div class="col-md-4 content-gd-wthree ab-content py-lg-5 my-lg-5">
                    <h4>Need Extra Space ?</h4>
                    <p>As the premier online store for bags, totes and duffle bags we’re proud to offer a variety of the best time-tested brands such as Tumi and Samsonite luggage, as well as our own exclusive brand of eBags luggage. Known for innovative products, such as our packing cubes and convertible carry-ons, we offer multi-functional travel gear that gets you to and from your destination with durable function and uncompromised style. Want to buy the best luggage brand bags? Think Baggage Online Store.</p>
                    <a href="showcat.jsp" class="btn shop mt-3">Shop Now</a>

                </div>
                <div class="col-md-4 content-gd-wthree">
                    <img src="images/c2.jpg" class="img-fluid" alt="" />
                </div>
            </div>

        </div>
    </section>
    <!-- //collections-->
    <!-- /mid-section -->
    <section class="mid-section">
        <div class="d-lg-flex p-0">
            <div class="col-lg-6 bottom-w3pvt-left p-lg-0">
                <img src="images/ab1.jpg" class="img-fluid" alt="" />
                <div class="pos-wthree">
                    <h4 class="text-wthree">50% Off Any <br> Women's Bags</h4>
                    <a href="showcat.jsp" class="btn shop mt-3">Shop Now</a>
                </div>
            </div>
            <div class="col-lg-6 bottom-w3pvt-left bottom-w3pvt-right p-lg-0">
                <img src="images/ab2.jpg" class="img-fluid" alt="" />
                <div class="pos-w3pvt">
                    <h4 class="text-w3pvt">30% Off Any <br> Men's Bags</h4>
                    <a href="showcat.jsp" class="btn shop mt-3">Shop Now</a>
                </div>
            </div>
        </div>
    </section>
    <!-- //mid-section -->
        <%@include file="footer.jsp"%>
    </body>
</html>
