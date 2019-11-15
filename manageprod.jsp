<%-- 
    Document   : login
    Created on : 20 Jun, 2019, 10:54:07 AM
    Author     : Pallavi
--%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Product</title>
        <%@include file="extfiles.jsp"%>
        <%
                            if(session.getAttribute("n")==null)
                            {
                                response.sendRedirect("login.jsp");
                            }
    %>
        <script src="js/jquery.js"></script>
 <script>
    $(document).ready(function()
    {
        $("#cat").change(function()
        {
            var cid = $(this).val();
            $.ajax(
            {
                method: "POST",
                url: "showsubcatajax.jsp",
                beforeSend: function()
                {
                    $("#showloader").html("<img src='images/loader.gif'>");
                },
                data: {catid: cid}
            }).done(function(res)
            {
                $("#showloader").html("");
                $("#subcat").html(res);
            });
    });
    $("#subcat").change(function()
        {
            var scid = $(this).val();
            $.ajax(
            {
                method: "POST",
                url: "fetchprodajax.jsp",
                beforeSend: function()
                {
                    $("#showloader").html("<img src='images/loader.gif'>");
                },
                data: {scid: scid}
            }).done(function(res)
            {
                $("#showloader").html("");
                $("#proddiv").html(res);
            });
    });
    $('#proddiv').delegate(".dellink","click",function(e)
    {
        e.preventDefault();
        var pid=$(this).attr("id");
        var pr1=$(this).parent();//td
        var pr=$(this).parent().parent();//tr
        if(confirm("Are you sure to delete?"))
        {
            $.ajax({
                        url:'delprod.jsp',
                        type:'post',
                        data:{"pid":pid},
                        beforeSend:function()
                        {
                            pr1.append("<img src='uploads/loader.gif'>")
                        },
                        success:function(reslt)
                        {
                            if($.trim(reslt)=="done")
                            {
                                pr.css({'backgroundColor':'#fb6c6c'});
                                pr.fadeOut(600,function(){
                                   //pr.remove();
                                 })
                            }
                            else
                            {
                                alert("Some problem occured");
                            }
                        },
                        error:function(e)
                        {
                            alert("Error in Ajax");
                        }
                    });
        }
    });

    });

 </script>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <h2><span>Manage Product</span></h2>
                </div>
                <div class="content-bottom">
                    <form name ="form1" method="post" enctype="multipart/form-data">
                        <div class="field-group">
                            <div class="content-input-field">
                                <select name="cat" id="cat" class="container" class="content-grid" class="content-bottom" required>
                                    <option value ="">Choose Category</option>
                          <%
                            try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String q = "select * from managecat";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                          
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               do
                               {
                                   out.print("<option value='" + myres.getString("catid") + "'>" + myres.getString("catname") + "</option>");
                               }
                               while(myres.next()==true);
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
                               out.print("Error in connection"+e.getMessage());
                           }
                       
                                    %>
                                </select>
                            </div>
                        </div><br/>
                        <div id="showloader"></div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <select name="subcat" id="subcat" class="container" class="content-grid" class="content-bottom" required>
                                    <option value="">Choose Sub Category</option>
                                    
                                </select>
                            </div>
                        </div><br/>
                         <div class="field-group">

                            <div class="content-input-field">
                                <input name="prodname" type="text" placeholder="Product Name" required>
                            </div>
                        </div>
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="rate" type="text" placeholder="Rate" required>
                            </div>
                        </div>
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="dis" type="text" placeholder="Discount" required>
                            </div>
                        </div>
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="stock" type="text" placeholder="Stock" required>
                            </div>
                        </div>
                        <div class="field-group">

                            <div class="content-input-field">
                                <input name="desc" type="text" placeholder="Description" required>
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="prodpic" type="file">
                            </div>
                        </div>
                        
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Add">
                        </div>
                        
                        <%
                          String cid="",sid="",prodname="",rate="",dis="",stock="",desc="",imagename="",path="";
                          boolean successful=true;
                          boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                          
                          if(isMultipart)
                        {
   
                            FileItemFactory factory = new DiskFileItemFactory();
                            ServletFileUpload upload = new ServletFileUpload(factory);
                            List<FileItem> items = null;

                            try
                            {
                                 items = upload.parseRequest(request);
                            }
                            catch (FileUploadException e)
                            {
                                e.printStackTrace();
                            }
                            
                            for(FileItem myitem:items)
                            {
                                 if (myitem.isFormField())
                                 {
                                    String itemName1 = myitem.getFieldName();//
                                    String value=myitem.getString();//

                                    if(itemName1.equals("cat")) //control's name - textbox name
                                    {
                                        cid=value;//
                                    }
                                    else if(itemName1.equals("subcat")) //control's name - textbox name
                                    {
                                        sid=value;//
                                    }
                                    else if(itemName1.equals("prodname")) //control's name - textbox name
                                    {
                                        prodname=value;//
                                    }
                                    else if(itemName1.equals("rate")) //control's name - textbox name
                                    {
                                        rate=value;//
                                    }
                                    else if(itemName1.equals("dis")) //control's name - textbox name
                                    {
                                        dis=value;
                                    }
                                    else if(itemName1.equals("stock")) //control's name - textbox name
                                    {
                                        stock=value;//
                                    }
                                    else if(itemName1.equals("desc")) //control's name - textbox name
                                    {
                                        desc=value;//
                                    }
                                    
                                 }
                                 else
                                 {
                                    String type=myitem.getContentType();
                                    long size=myitem.getSize()/1024; //kbytes
                                    
                                    if(size==0)
                                    {
                                        imagename="noimage.png";
                                    }
                                    else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                                               || type.equals("image/png") || type.equals("image/x-png")
                                               || type.equals("image/gif")))
                                    {
                                                imagename=new java.util.Date().getTime()+myitem.getName();
                                                path=getServletContext().getRealPath("/") + "uploads\\" + imagename;

                                                File savefile=new File(path);
                                                myitem.write(savefile);    
                                    }
                                    else
                                    {
                                        successful=false;
                                        out.println("Only pictures are allowed");
                                    }    
                                 } 
   
                           }
                           if(successful==true)
                            {
                              try
                               {
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                                try
                                {
                                    String q = "insert into manageprod (catid,subcatid,name,rate,discount,stock,description,prodpic) values(?,?,?,?,?,?,?,?)";
                                    PreparedStatement myst = myconn.prepareStatement(q);
                                    myst.setString(1, cid);
                                    myst.setString(2, sid);
                                    myst.setString(3, prodname);
                                    myst.setString(4, rate);
                                    myst.setString(5, dis);
                                    myst.setString(6, stock);
                                    myst.setString(7, desc);
                                    myst.setString(8, imagename);
                                    int myres = myst.executeUpdate();
                                    if(myres>0)
                                    {
                                        out.print("Product added successfully");
                                    }
                                    else
                                    {
                                        out.print("Product not added successfully");
                                    }
                                }
                                catch(Exception e)
                                {
                                    out.print("Error in query " + e.getMessage());
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
                       }
                    }  
                    
                    %> 
                    </form>
                    <div id="proddiv">
                    </div>
                </div>
        </div>
    </section>
    <!-- /login -->
        <%@include file="footer.jsp"%>
    </body>
</html>
