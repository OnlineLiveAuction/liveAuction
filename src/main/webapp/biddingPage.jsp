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
        
        .timer{
        		
        		height: 60px;
                width: 360px;
                background-image: linear-gradient(#16bffd, #49c9bd);
                /* box-shadow: inset 0 0 10px #0000000; */
                color: white;
                line-height: 60px;
                text-align:center;
                font-size: 40px;
                /* margin-top: 0px; */
                /* box-shadow: 1px 1px 0px #000,
                2px 2px 0px #000,
                3px 3px 0px #000,
                4px 4px 0px #000,
                5px 5px 0px #000,
                6px 6px 0px #000; */
        }
        
        .partition1{
        	height: 49px;   
        }
        .timer-text{
        	font-size: 20px;
        	text-align:center;
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
                <a class="nav-link" href="upcomingBids.jsp"><i class="fa fa-list" aria-hidden="true"></i>Upcoming Bids<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active mr-auto">
                <a class="nav-link" href="myProducts.jsp"><i class="fa fa-product-hunt" aria-hidden="true"></i>Product List <span class="sr-only">(current)</span></a>
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
                    <div class = "partition1"></div> <!-- partition between image and timer boxes   -->
                     <p id="some_div">
						      <div>
						      		<h4 class="timer-text">Bid Countdown</h4>
						            <p id = "countdown1" , class = "timer"></p>
						        </div>
						
						        <script>
						            document.getElementById("countdown1").innerHTML = "BID COUNTDOWN";
						            var countdownUpto = new Date("Jan 26, 2021 21:00:00").getTime(); /*add bid time here*/
						            if (countdownUpto == (new Date("Jan 26, 2021 21:00:00").getTime()))
									            { var automaticCountdown = setInterval(function(){
										            var currentDate = new Date().getTime();  /*current time*/
										            var differenceInDate = countdownUpto - currentDate; /*in milli seconds*/ 
										            /*console.log(differenceInDate); inspect - console and see */
										            var cDays = Math.floor(differenceInDate/(1000*60*60*24));
										            console.log(cDays);
										            var cHours = Math.floor((differenceInDate%(1000*60*60*24))/(1000*60*60));
										            console.log(cHours);
										            var cMinutes = Math.floor((differenceInDate%(1000*60*60))/(1000*60));
										            console.log(cMinutes);
										            var cSeconds = Math.floor((differenceInDate%(1000*60))/1000);
										            console.log(cSeconds);
										            document.getElementById("countdown1").innerHTML = cDays + "d, " + cHours + "hrs: " + cMinutes + "m: "+ cSeconds + "s";
										
										            }, 1000); //to run this function in seconds not milliseconds
									            }
						        </script> 
                    </p>
                    
                    
                    <p id="some_div">
                     
						      <div>
						      		<h4 class="timer-text">Current Bid Slot Countdown</h4>
						            <p id = "countdown2" class = "timer" style="color:red;">
						            </p>
						        </div>
						
						        <script>
						            document.getElementById("countdown2").innerHTML = "BID COUNTDOWN";
						            var countdownUpto = new Date("Jan 26, 2021 21:00:00").getTime(); /*add bid time here*/
						            
						            if (countdownUpto == (new Date("Jan 26, 2021 21:00:00").getTime()))
						            	/* if (((countdownUpto == (new Date("Jan 26, 2021 10:00:00")%30) == 0).getTime())) */
									            { var automaticCountdown = setInterval(function(){
										            var currentDate = new Date().getTime();  /*current time*/
										            var differenceInDate = countdownUpto - currentDate; /*in milli seconds*/ 
										            /*console.log(differenceInDate); inspect - console and see */
										            var cDays = Math.floor(differenceInDate/(1000*60*60*24));
										            console.log(cDays);
										            var cHours = Math.floor((differenceInDate%(1000*60*60*24))/(1000*60*60));
										            console.log(cHours);
										            var cMinutes = Math.floor((differenceInDate%(1000*60*60))/(1000*60));
										            console.log(cMinutes);
										            var cSeconds = Math.floor((differenceInDate%(1000*60))/1000);
										            console.log(cSeconds);
										            document.getElementById("countdown2").innerHTML = cSeconds + "s";
										
										            }, 1000); //to run this function in seconds not milliseconds
									            }
						        </script> 
                    </p>
                    
                    


                </div>
            
            <div class="col-md-5 ">
                <div class="container">
                    <div >
                <label class="category "><b>Description:</b></label> <div style='overflow:auto; width:400px;height:217px;'>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni, explicabo unde! Aliquid, veniam magni tempora nulla ut distinctio ipsam illo ullam incidunt culpa deserunt vel velit nesciunt dolore quasi harum veritatis? Voluptatum ad illum corrupti, illo sequi itaque quae soluta.</div>                
            </div>
                <div  class="mt-lg-5" style = "font-size:19px; color: red" >
                    <label class="category"><b>Current-Price:</b></label> <label class="category">14000</label><br>
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
                        <button type="button" class="btn btn-primary " style="height:70px; width: 240px;">Lock your Bid</button></div>
                </div>
                  
                
                  </div>
                  <div class="col-md-3 ">
                    <div class="container">
                        <div style="border-style: groove; border-width: 2px;">
                        <label class="category" ><b style = "color: blue;">Product Price:</label> <label class="category">10000</label></b><br>
                        </div><br>
                        <div style="border-style: groove; border-width: 2px;">
                        <label class="category" ><b style="color: blue;">Current Highest Bid:</label> <label class="category">14000</label></b><br>
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