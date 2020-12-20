<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="model.Product" %>
    <%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
    <style>
        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
        }
  
        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }
      </style>
      <!-- Custom styles for this template -->
      
    <link href="..\resources\css\navbar.css" rel="stylesheet">
    <title>Welcome!</title>
  </head>
  <body>
   <%
   			System.out.println(session.getAttribute("username"));
        try {
                String n = null;
                if (request.getParameter("authorize") != null) 
                {
                    n = request.getParameter("authorize");
                    if (n.equals("yes")) 
                    {
                    	System.out.println("username"+(String)session.getAttribute("username"));
       				 	%>
        					<script>alert("Welcome");</script>
        					
       				 	<%
                	}
                    else
                    {
                    	%>
    						<script>alert("Incorrect username or password");</script>
   				 		<%
                    }
            	}
                if (request.getParameter("registered") != null) 
                {
                    n = request.getParameter("registered");
                    if (n.equals("true")) 
                    {
       				 	%>
        					<script>alert("You are successfuly Registered!");</script>
       				 	<%
                	}
                    else
                    {
                    	%>
    						<script>alert("An error occurred. Please try again.");</script>
   				 		<%
                    }
            	}
                
                if (request.getParameter("prodreg") != null) 
                {
                    n = request.getParameter("prodreg");
                    if (n.equals("true")) 
                    {
       				 	%>
        					<script>alert("Product Added Successfully!");</script>
       				 	<%
                	}
                    else
                    {
                    	%>
    						<script>alert("An error occurred. Please try again.");</script>
   				 		<%
                    }
            	}
                
            } catch (Exception e) {
                out.println(e);
            }
        %>
        
        
        
    <script>
    
    $(document).ready(function()
            {
          var s="HGHG";     
           s="<%out.print(session.getAttribute("username"));%>";
           console.log(s);
                if(s=="null")
                {
                    //alert("ksd");
                    document.getElementById("signinbutton").style.display="inline";
                }
                else    
               	{
                   document.getElementById("signinbutton").style.display="none";
                    document.getElementById("drop").style.display="inline";
                    
                }
            });
    
    
    </script>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a class="navbar-brand" href="#"> <i class="fa fa-usd text-center text-white" aria-hidden="true"></i> Online Auction</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
      
        <div class="collapse navbar-collapse" id="navbarsExample03">
          <ul class="navbar-nav  mr-auto">
            
            <li class="nav-item active mr-auto">
              <a class="nav-link" href="#"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active mr-auto">
                <a class="nav-link" href="#"><i class="fa fa-legal" aria-hidden="true"></i> Upcoming Bids <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active mr-auto">
                <a class="nav-link" href="#"><i class="fa fa-list" aria-hidden="true"></i> Product List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item mr-auto">
                <button class="btn btn-outline-info mr-1 "><i class="fa fa-plus-circle" aria-hidden="true"></i><a href="addproduct.jsp"> Add product</a></button>  </li>
                  
                 
                  
                  
                  
                 
          </ul>
                  <ul class="navbar-nav ml-auto">
                  
               
                   <li>    <div class="dropdown show" id="drop"   style="display:none;">
                        <a class="btn btn-secondary dropdown-toggle" href="#" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         Hi <% out.println(session.getAttribute("username"));%>
                     </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                          <a class="dropdown-item" href="#">My Profile</a>
                         <a class="dropdown-item" href="logout">Logout</a>
                            </div>
                        </div></li>
                  
            <li class="nav-item ml-auto" >
              <button class="btn btn-success"   id="signinbutton" data-target="#mymodel" data-toggle="modal"  style="display:none;">Login/SignUp</button>
            </li>
          </ul>
          
            
            <div class="modal fade" id="mymodel">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="text-center text-primary">Login</h3>


                        </div>
                        <div class="modal-body">
                            <form action="checklogin">
                                
                                <div class="form-group">
                                  <label><i class="fa fa-user fa-lg" aria-hidden="true"></i> Username</label>
                                  <input type="text" name="username" class="form-control" placeholder="Username">

                              </div>
                                <div class="form-group">
                                    <label><i class="fa fa-lock fa-lg" aria-hidden="true"></i> Password</label>
                                    <input type="password" name="password" class="form-control" placeholder="Password">

                                </div>
                                <div class="text-center form-sm mt-2">
                                <input type="submit" class="btn btn-info">
                              </div>
                              </form>
                              
                          </div>
                        <div class="modal-footer">
                          <div class="options text-right">
                            <p class="pt-1">New Member? <a href="registration.jsp" class="blue-text">Register</a></p>
                          </div>
                          <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                    </div>

                </div>
              
            </div>
           
      </nav>
      <jsp:include page="/GetProducts" />
      <%
       System.out.println("dghgdf"); 
       List<Product> productList = (List<Product>)request.getAttribute("productList");
       System.out.println(productList); %>
                    

      <div class="container">
        <div class="md-form mt-0">
          <input class="form-control" type="text"placeholder="Search" aria-label="Search">
        </div>
      </div>
      <div class="product-info">
        <div class="container">
            <div class="row">
              <div class="col-12">
                  <table class="table table-image table-dark table-striped">
                    <thead>
                      <tr>
                        <th scope="col">Category</th>
                        <th scope="col">Image</th>
                        <th scope="col">Description</th>
                        <th scope="col">Item</th>
                        <th scope="col">Bid-Price(Rs)</th>
                        <th scope="col">Action</th>
                      </tr>
                    </thead>
                    
                    
                    <tbody>
                   
                   
                   		<%
                     	 	
                     	 	for(int i = 0; i < productList.size(); i++)
                     	 	{
                     	 		Product product = (Product)productList.get(i);
                     	 		%>
                     	 		
                     	 				<tr>
					                        <th scope="row"><% out.print(product.getCategoryName()); %></th>
					                        <td class="w-25">
					                            <img src="../resources/image/bike.jpg" class="img-fluid img-thumbnail" alt="item_type">
					                        </td>
					                        <td><% out.print(product.getProductDescription()); %></td>
					                        <td><% out.print(product.getProductName()); %></td>
					                        <td><% out.print(product.getProductMinPrice()); %></td>
					                        <td> <button class="btn btn-primary " >Register</button></td>
					                      </tr>
                     	 		
                     	 		
           
                     	 		<% 
                     	 	}
                     	 %>
                   
                    </tbody>
                  </table>   
              </div>
            </div>
          </div></div>

  
   <!-- Optional JavaScript; choose one of the two! -->
   <div style="height:400px"></div>
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

  
 </body>
</html>
 