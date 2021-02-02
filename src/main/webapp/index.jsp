<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="model.Product" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.time.LocalTime" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.HashSet" %>
    <%@ page import="dao.UserDao" %>
    
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
    <!-- MDB -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.css" rel="stylesheet" />
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
    
     <style>
    
    
		  .sidenav {
		  height: 100%; /* Full-height: remove this if you want "auto" height */
		  width: 15%; /* Set the width of the sidebar */
		  position: fixed;  /*Fixed Sidebar (stay in place on scroll) */
		  top: 57px; /* Stay at the top */
		  left: 0;
		  overflow-x: hidden; /* Disable horizontal scroll */
		  padding-top: 10px;
		  padding:1%;
		  padding-top:1%;
		}
		.product-info{
				  	margin-left:15%;
				  }
				  .searchbutton
				  {
				  	margin-left:15%;
				  }
				  .slidecontainer {
				  width: 100%;
				  
				}


    </style>
    
    
    
    
    <script type="text/javascript">
	    $(document).ready(function(){
	    var slider = document.getElementById('myRange');
	    
	    var output = document.getElementById('demo');
	    console.log("value"+output);
	    output.innerHTML = "0 - "+slider.value; // Display the default slider value
	
	    // Update the current slider value (each time you drag the slider handle)
	    slider.oninput = function() {
	      var val="0 - "+this.value;	
	      output.innerHTML = val;
	    }
	    });
    </script>
    
    
    <title>Online Auction</title>
    

	
	
    
  </head>
  
  
  
  <body>
  <%LocalTime myObj = LocalTime.now();
  System.out.println(myObj); %>
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
    
    
    
   
    <%@include  file="navbar.html" %>
      <% if(request.getParameter("applyfilter") == null)
    	{
    	  HashSet<String> hs = new HashSet<>();
    	  request.setAttribute("filteredPrice",100000);
    	  request.setAttribute("filteredCategories",hs);
    	  %>
      		<jsp:include page="/GetProducts" />
      	<%
      	System.out.println("inside if ");
      	} %>
      <%
       List<Product> productList = (List<Product>)request.getAttribute("productList");
       System.out.println(productList);
       int userID = -1;
       if(session.getAttribute("userID") != null)
       {
    	   userID = (Integer)session.getAttribute("userID");
       }
       LocalTime currTime = LocalTime.now();
 		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
 	    Date date = new Date();  
 	    System.out.println(formatter.format(date));
 		System.out.println("current time "+currTime);
       	
       %>
      <div style="display:inline"> 
      <form action="ApplyFilter">             
		<div class="sidenav shadow p-3">
		  	<h4>Filters</h4>
		  	
		   	<label class="sidenav_labels" for="exampleFormControlSelect1">Product Category</label><br><br>
                <%
                	
                	UserDao newUser = new UserDao();
                	List<String> categoryList = newUser.getCategories();
                	HashSet<String> filteredCategories = (HashSet<String>)request.getAttribute("filteredCategories");
                	%>
                
                  <%for (int i=0;i<categoryList.size();i++){
                  	if(filteredCategories.contains(categoryList.get(i)))
                  	{%>
                  		<label><input type="checkbox" class="sidenav_names" id="<%out.print(categoryList.get(i));%>" name="<%out.print(categoryList.get(i));%>" value="<%out.print(categoryList.get(i));%>" checked> <%out.print(categoryList.get(i));%></label><br>
   				 	<%}
   				 	else
   				 	{%>
   				 		<label><input type="checkbox" class="sidenav_names" id="<%out.print(categoryList.get(i));%>" name="<%out.print(categoryList.get(i));%>" value="<%out.print(categoryList.get(i));%>"> <%out.print(categoryList.get(i));%></label><br>
   				 	
   				    <%
   				    } %> 
   				 <%} %><br>
   			<label class="sidenav_labels" for="exampleFormControlSelect1">Price</label><br><br>	 
   				 <div class="slidecontainer">
					  <input type="range" min="1" max="100000" value="<%out.print((int)request.getAttribute("filteredPrice"));%>"  id="myRange" name="priceSlider">
					  <p class="sidenav_names" id="demo" style="color:black"></p>
					</div><br><br>
					<div class="text-center">
					<button class="btn btn-secondary">Apply</button>
					<button class="btn btn-secondary" name="clearFilters">Clear</button>
					</div>
		</div>
		
      <div class="container">
      <div class="row">
              <div class="col-12">
        <div class="searchbutton">  
        <div class="input-group">      
        <div class="form-outline">
        <%if(request.getAttribute("filterNameSearch") != null)
        { %>          	
        <input class="form-control col-11" style="width: 1000px;" id="form1" type="search" aria-label="Search" value=<%out.print(request.getAttribute("filteredNameSearch")); %> name="search"><%}
        else 
        {%>	
        	<input class="form-control col-11" style="width: 1000px;" id="form1" type="search"  aria-label="Search" name="search"><%
        } %>
        <label class="form-label" for="form1">Search</label>
        </div>
        <button type="button" class="btn btn-secondary">
    <i class="fa fa-search"></i>
  </button>
        </div>
        </div>
      </div>
      </div>
      </div>
      </form>
      <div class="product-info">
        <div class="container">
            <div class="row">
              <div class="col-12">
                  
                    
                    
                    
                   
                   
                   		<%
                     	 	
                     	 	for(int i = 0; i < productList.size(); i++)
                     	 	{
                     	 		
                     	 		Product product = (Product)productList.get(i);
                     	 		%>
                     	 		<div class="card mt-3 ml-3 mr-3 shadow p-3 mb-5 bg-white rounded" >
            <div class="row">
                <div class="col-md-4">
                    <img class="card-img-top" src="getImage.jsp?id=<% out.print(product.getProductID()); %>" alt="Card image cap" >
                </div>
            
            <div class="col-md-5 ">
                <div class="container">
                    <label class="category"><b>Name:</b></label> <label ><% out.print(product.getProductName()); %></label><br>
                    <label class="category"><b>Category:</b></label> <label class="category"><% out.print(product.getCategoryName()); %></label><br>
                    <label class="category"><b>Registered Users:</b></label> <label class="category"><%=newUser.getProductRegistrationCount(product.getProductID())%></label><br>
                    <label class="category "><b>Description:</b></label> <div style='overflow:auto; width:400px;height:80px;'><% out.print(product.getProductDescription()); %></div>
                                    
                  </div>
                  </div>
                  <div class="col-md-3 ">
                    <div class="container">
                   
                        <label class="category" ><b>Bid-price:</b></label> <label class="category"><% out.print(product.getProductMinPrice()); %></label><br>
                        <label class="category mt-md-3"><b>Bidding date:</b></label> <label class="category"><% out.print(product.getBiddingDate()); %></label><br>
                        <label class="category mt-md-3"><b>Start Time:</b></label> <label class="category"><% out.print(product.getStartTime()); %></label><br>
                        
                        <jsp:include page="/RegisteredProductList">
					                        	<jsp:param name="userID" value="<%=session.getAttribute(\"username\")%>" />
					                        </jsp:include>
					                        
					                       
					                        <button  style="display:none" class ="btn btn-primary mt-md-3">Enter Auction</button>
					                        
					                        
					                        <%
					                        	List<Integer> regProductList = (List<Integer>)request.getAttribute("registeredProductID");
						                        LocalTime start = LocalTime.parse(product.getStartTime());
				                        		LocalTime stop = LocalTime.parse(product.getStopTime());
				                        		System.out.println(start+" stop"+stop);
					                        	if((formatter.format(date).toString().equals(product.getBiddingDate()))   &&   ((start.compareTo(currTime)) < 0 && (stop.compareTo(currTime) > 0)))
					                        	{
					                        		
					                        			%>
					                        				<form action="biddingPage.jsp">
						                        				<input type="hidden" value="<%=product.getProductID()%>" name="productID">
						                        				<button class="btn btn-secondary mt-md-3" type="submit">Enter Auction</button>
					                        				</form>
					                        			<%
					                        	}
					                        	
					                        	else if((formatter.format(date).toString().compareTo(product.getBiddingDate())) > 0 || ((formatter.format(date).toString().equals(product.getBiddingDate())) && stop.compareTo(currTime) < 0))
					                        	{
					                        		%>
					                        		<button class="btn btn-danger  mt-md-3" disabled="disabled">Auction Ended</button>	
					                        	<% 
					                        	}
					                        	
					                        
					                        	else if(regProductList.contains(product.getProductID()))
					                        	{
					                        %>
					                       
												<button class="btn btn-success  mt-md-3" disabled="disabled">Registered</button>					                   			
					                        
					                        <% } else if(product.getSellerId() == userID) { %>
					                        
												<button class="btn btn-primary  mt-md-3" disabled="disabled">Own Product</button>					                   			
					                        
					                        <% } else if(session.getAttribute("username") != null) { %>
					                        	
												<form action = "RegForProducts" method="post">
					                         		<button class="btn btn-success  mt-md-3" id="<%=product.getProductID()%> ">Register</button>
					                        		<input type='hidden' name='productID' value="<%=product.getProductID()%>">
					                        	</form>						                   			
					                        <%}else{
					                        %>
					                        
					                        	<button class="btn btn-danger  mt-md-3" disabled="disabled">Register</button>
					                        
					                        <% } %>
					        
                      </div>
                      </div>
            </div>
            
          </div>
                     	 		
                     	 		<% 
                     	 	}
                     	 %>
                     	 
                     	
                   
                      
              </div>
            </div>
          </div></div></div>

  
   <!-- Optional JavaScript; choose one of the two! -->
   <div style="height:400px"></div>
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
            <!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.js"></script>

  
 </body>
</html>
 