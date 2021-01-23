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
      
    <link href="css\navbar.css" rel="stylesheet">
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
              <a class="nav-link" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active mr-auto">
                <a class="nav-link" href="upcomingBids.jsp"><i class="fa fa-list" aria-hidden="true"></i> Bidding List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active mr-auto">
                <a class="nav-link" href="myProducts.jsp"><i class="fa fa-product-hunt" aria-hidden="true"></i>roduct List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item mr-auto">
                <a href="addproduct.jsp"><button class="btn btn-outline-info mr-1 "><i class="fa fa-plus-circle" aria-hidden="true"></i> Add product</button></a>  </li>
                  
                 
                  
                  
                  
                 
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
                                  <label><i class="fa fa-envelope fa-2x"></i>Email:</label>
                                  <input type="text" name="username" class="form-control">

                              </div>
                                <div class="form-group">
                                    <label><i class="fa fa-lock fa-2x"></i>Password:</label>
                                    <input type="password" name="password" class="form-control">

                                </div>
                                <div class="text-center form-sm mt-2">
                                <input type="submit" class="btn btn-info"">
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
        
    </li>
    
    </ul>
          </ul>
         
        </div>
        
        
        
                     
        
        
        
        
        
        
        
      </nav>
      <%
      
      String currentUser = (String)session.getAttribute("username");
      request.setAttribute("currentUser",currentUser); %>
      <jsp:include page="/viewmyproducts" />
      <%
       System.out.println("dghgdf"); 
       List<Product> productList = (List<Product>)request.getAttribute("myProductList");
       System.out.println(productList); %>
                    
<div class="container">
        <div class="md-form mt-0">
          <input class="form-control" type="text"placeholder="Search" aria-label="Search">
        </div>
      </div>
            <div class="container">
                   
                   		<%
                   		
                 	 	
                 	 	for(int i = 0; i < productList.size(); i++)
                 	 	{
                 	 		Product product = (Product)productList.get(i);
                 	 		%>
                 	 		<div class="card mt-3 shadow p-3 mb-5 bg-white rounded" >
                 	 		
        <div class="row">
            <div class="col-md-4">
                <img class="card-img-top" src="getImage.jsp?id=<% out.print(product.getProductID()); %>" alt="Image <% out.print(product.getProductID()); %>" >
            </div>
        
        <div class="col-md-5 ">
            <div class="container">
                <label class="category"><b>Name:</b></label> <label ><% out.print(product.getProductName()); %></label><br>
                <label class="category"><b>Category:</b></label> <label class="category"><% out.print(product.getProductName()); %></label><br>
                
                <label class="category "><b>Description:</b></label> <div style='overflow:auto; width:400px;height:120px;'><% out.print(product.getProductDescription()); %></div>                
              </div>
              </div>
              <div class="col-md-3 ">
                <div class="container">
                    
                    <label class="category" ><b>Bid-price:</b></label> <label class="category"><% out.print(product.getProductMinPrice()); %></label><br>
                    <label class="category mt-md-3"><b>Bidding date:</b></label> <label class="category"><% out.print(product.getBiddingDate()); %></label><br>
                    <label class="category mt-md-3"><b>Start Time:</b></label> <label class="category"><% out.print(product.getStartTime()); %></label><br>
                    
				        
        
                     	 	
                     	 		
                     	 		
           
                     	 		
                   
                      
              </div>
            </div>
          </div></div>
          <% 
                     	 	}
                     	 %>
                     	 </div>


  
   <!-- Optional JavaScript; choose one of the two! -->
   <div style="height:400px"></div>
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

  
 </body>
</html>
 