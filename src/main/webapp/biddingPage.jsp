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
        <a class="navbar-brand" href="#"> <i class="fa fa-usd text-center text-white" aria-hidden="true"></i>Online Auction</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
      
        <div class="collapse navbar-collapse" id="navbarsExample03">
          <ul class="navbar-nav  mr-auto">
            
            <li class="nav-item active mr-auto">
              <a class="nav-link" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active mr-auto">
                <a class="nav-link" href="upcomingBids.jsp"><i class="fa fa-list" aria-hidden="true"></i>Bidding List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active mr-auto">
                <a class="nav-link" href="myProducts.jsp"><i class="fa fa-product-hunt" aria-hidden="true"></i>roduct List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item mr-auto">
                <button class="btn btn-outline-info mr-1 "><i class="fa fa-plus-circle" aria-hidden="true"></i><a href="addproduct.jsp">Add product</a></button>  </li>
                  
                 
                  
                  
                  
                 
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
              <button class="btn btn-success"   id="signinbutton" data-target="#mymodel" data-toggle="modal"  style="display:none;">Login/Signup</button>
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
       <div class="container">
        
            <div class="row">
                <div class="col-md-4">
                    <div>
                    <img class="card-img-top" src="image/bike.jpg" alt="Card image cap" >
                    </div>
                     <p id="some_div">
                        Timer1
                    </p>
                    <p id="some_div">
                        Timer2
                    </p>
                    
                    


                </div>
            
            <div class="col-md-5 ">
                <div class="container">
                    <div >
                <label class="category "><b>Description:</b></label> <div style='overflow:auto; width:400px;height:120px;'>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni, explicabo unde! Aliquid, veniam magni tempora nulla ut distinctio ipsam illo ullam incidunt culpa deserunt vel velit nesciunt dolore quasi harum veritatis? Voluptatum ad illum corrupti, illo sequi itaque quae soluta.</div>                
            </div>
                <div  class="mt-lg-5">
                    <label class="category" ><b>Bid-price:</b></label> <label class="category">1000000</label><br>
                </div>
                 <script>
    
    $(document).ready(function()
            {
          
    	$("#showTextArea").click(function() {
    		document.getElementById("bidTextArea").style.display="inline";
    		document.getElementById("showTextArea").style.display="none";
    	  });
            });
    
    
    </script>

                <div  class="btn-toolbar mt-lg-5" >
                        <button type="button" class="btn btn-success " id="percent1">+20%</button>
                        <button type="button" class="btn btn-success ml-3 "id="percent2">+50%</button>
                        
                        <button type="button" class="btn btn-success ml-3" id="showTextArea">custom</button>
                        <input type="number" id="bidTextArea" style="display:none;" class="ml-3" placeholder="Enter_bid_amount"></input>
                        
                            
                            
                            
                        
                        
                         
                          
                    </div>
                    <div  class="mt-lg-3">
                        <button type="button" class="btn btn-primary ">Lock your Bid</button></div>
                </div>
                  
                
                  </div>
                  <div class="col-md-3 ">
                    <div class="container">
                        <div style="border-style: groove;">
                        <label class="category" ><b>Bid-price:</b></label> <label class="category">1000000</label><br>
                        </div>
                         <div id="bidRankList " style='overflow:auto; height:400px;' class="mt-md-3">
                            <div>
                              <table id="rankTable" class="table-sm table-bordered table-hover table-light"
                                data-reorderable-rows="true" aria-describedby="Bid Ranking Table">
                                <thead class="table-dark">
                                  <tr >
                                    <th scope="col" style="width: 50%">
                                      Rank
                                    </th>
                                    <th scope="col" data-sortable="true" style="width: 50%">
                                      Top Bids
                                    </th>
                                  </tr>
                                </thead>
                                <tbody >
                                  <tr>
                                    <th scope="row">#3</th>
                                    <td>9500</td>
                                  </tr>
                                  <tr class="table-success">
                                    <th scope="row">#4</th>
                                    <th scope="">9000</th>
                                  </tr>
                                  <tr>
                                    <th scope="row">#5</th>
                                    <td>9000000000000</td>
                                  </tr>
                                  <tr class="table-primary">
                                    <th scope="row">#1</th>
                                    <th scope="">10000</th>
                                  </tr>
                                  <tr>
                                    <th scope="row">#2</th>
                                    <td>9500</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">#3</th>
                                    <td>9500</td>
                                  </tr>
                                  <tr class="table-success">
                                    <th scope="row">#4</th>
                                    <th scope="">9000</th>
                                  </tr>
                                  <tr>
                                    <th scope="row">#5</th>
                                    <td>9000</td>
                                  </tr>
                                  <tr class="table-primary">
                                    <th scope="row">#1</th>
                                    <th scope="">10000</th>
                                  </tr>
                                  <tr>
                                    <th scope="row">#2</th>
                                    <td>9500</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">#3</th>
                                    <td>9500</td>
                                  </tr>
                                  <tr class="table-success">
                                    <th scope="row">#4</th>
                                    <th scope="">9000</th>
                                  </tr>
                                  <tr>
                                    <th scope="row">#5</th>
                                    <td>9000</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                      </div>
                      </div>
            </div>
            
          
          
          </div>
          
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    
       
    </body>
     </html>