    <div class="main-sec inner-page">
        <!-- //header -->
        <header class="py-sm-3 pt-3 pb-2" id="home">
            <div class="container">
                <!-- nav -->
                <div class="top-w3pvt d-flex">
                    <div id="logo">
                        <h1> <a href="index.jsp"><span class="log-w3pvt">B</span>aggage</a> <label class="sub-des">Online Store</label></h1>
                    </div>

                    <div class="forms ml-auto">
                        <h5><span class="fa fa-user-circle-o"><b> Welcome</b></span>
                        <%
                            if(session.getAttribute("n")==null)
                            {
                                out.print("Guest");
                                out.print("<a href='login.jsp' class='btn'><span class='fa fa-user-circle-o'></span> Sign In</a>");
                                out.print("<a href='signup.jsp' class='btn'><span class='fa fa-pencil-square-o'></span> Sign Up</a>");
                            }
                            else
                            {
                                out.print(session.getAttribute("n"));
                                out.print("<a href='signout.jsp' class='btn'><span class='fa fa-user-circle-o'></span> Sign Out</a>");
                                out.print("<a href='changepass.jsp' class='btn'><span class='fa fa-pencil-square-o'></span> Change Password</a>");
                            }
                        %>
                        </h5>
                        
                    </div>
                </div>
                <div class="nav-top-wthree">
                    <nav>
                        <label for="drop" class="toggle"><span class="fa fa-bars"></span></label>
                        <input type="checkbox" id="drop" />
                        <ul class="menu">
                           
                            <li><a href="showcat.jsp">Category</a></li>
                            <li><a href="latestprod.jsp">Latest Products</a></li>
                            <li><a href="showcart.jsp">Cart</a></li>
                            <li><a href="orderhis.jsp">Order History</a></li>
                            <li><a href="aboutus.jsp">About</a></li>
                            <li><a href="contactus.jsp">Contact Us</a></li>
                           
                        </ul>
                    </nav>
                    
                    <div class="search-form ml-auto">
                        <div class="form-w3layouts-grid">
                            <form method="post" class="newsletter" action="showres.jsp">
                                <input class="search" name="srch" type="search" placeholder="Search here...">
                                <button class="form-control btn" value=""><span class="fa fa-search"></span></button>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </header>
        <!-- //header -->

    </div>
