<%@page import="dao.UserDao"%>
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
    <!-- <meta http-equiv="refresh" content="35"> -->

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
        
    <%
	    int productID = 0;
    	Product product;
    	String pName="";
    	String pDesc="";
    	int bBasePrice=0;
    	String pEndTime="";
		if (request.getParameter("productID") != null)
	    {  
	          productID = Integer.valueOf(request.getParameter("productID"));
	          UserDao userDao = new UserDao();
	          product = userDao.getProductInfo(productID);
	          pName = product.getProductName();
	          pDesc = product.getProductDescription();
	          bBasePrice = product.getProductMinPrice();
	          pEndTime = product.getStopTime();
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
                
                //Product Info Set
                
                var prodName="<%out.print(pName);%>";
                var prodDesc="<%out.print(pDesc);%>";
                var prodBasePrice=<%out.print(bBasePrice);%>
                
                $('#prodNameBox').text(prodName);
                $('#prodDescBox').text(prodDesc);
                $('#basePriceBox').text(prodBasePrice);
                
                //alert("<%out.print(pEndTime);%>");
                loadBidTable();
               
                
            });
    </script>
    
    <script>
		function loadBidTable()
		{
			var prodID=<%out.print(productID);%>
			$.ajax({
		    	url: "RetrieveBids",
		    	data:{sendProductID:prodID},
		    	success: function(result){
		    					var l = Object.keys(result).length;
		    					var maxBidValue = 0;
		    					var content = '';
		    					
		    					
		    					for (var i = 0; i < l; i++) {
		    						content += "<tr><td>"+result[i]["userName"]+"</td><td>"+result[i]["bidAmount"]+"</td></tr>";
		    						if(result[i]["bidAmount"] >= maxBidValue)
		    						{
		    							maxBidValue = result[i]["bidAmount"];
		    						}
		    						$("#rankTable tbody").html(content)
		    						$('#highestBidBox').text(maxBidValue);	
								}
		    					
		    			 }
		  			});
		}
	</script>  
	
	
	
	<script>
    
    $(document).ready(function()
            {
		    	setInterval(function(){
		    		loadBidTable();
		    	}, 5000);           
            });
    </script>
	
	
    
    <%@include  file="navbar.html" %>      
       <div class="container">
        
            <div class="row">
                <div class="col-md-4">
                    <div>
                    <img class="card-img-top" src="getImage.jsp?id=<% out.print(productID); %>" alt="Card image cap" >
                    </div>
                    <div class = "partition1"></div> <!-- partition between image and timer boxes   -->
                     <p id="some_div">
						      <div>
						      		<h4 class="timer-text">Bid Countdown</h4>
						            <p id = "countdown1" class = "timer"></p>
						        </div>
						
						        <script>
						            document.getElementById("countdown1").innerHTML = "BID COUNTDOWN";
						            var countdown1Upto = new Date("Jan 27, 2021 18:40:00").getTime(); /*add bid time here*/
						            
									             var automaticCountdown1 = setInterval(function(){
										            var currentDate1 = new Date().getTime();  /*current time*/
										            var differenceInDate1 = countdown1Upto - currentDate1; /*in milli seconds*/ 
										            /*console.log(differenceInDate); inspect - console and see */
										            var cDays1 = Math.floor(differenceInDate1/(1000*60*60*24));
										            console.log(cDays1);
										            var cHours1 = Math.floor((differenceInDate1%(1000*60*60*24))/(1000*60*60));
										            console.log(cHours1);
										            var cMinutes1 = Math.floor((differenceInDate1%(1000*60*60))/(1000*60));
										            console.log(cMinutes1);
										            var cSeconds1 = Math.floor((differenceInDate1%(1000*60))/1000);
										            console.log(cSeconds1);
										            document.getElementById("countdown1").innerHTML = cDays1 + "d, " + cHours1 + "hrs: " + cMinutes1 + "m: "+ cSeconds1 + "s";
										
										            }, 1000); //to run this function in seconds not milliseconds
									            
						        </script> 
               
                    
                   
                    
                    <!--  < % if(differenceInDate1 < = 900000){ %>  ----- implementing a hide-able timer 2 -->
						      <div>
						      		<h4 class="timer-text">Current Bid Slot Countdown</h4>
						            <p id = "countdown2" class = "timer" style="color:black;">
						            </p>
						        </div>
						
						        <script>
						            document.getElementById("countdown2").innerHTML = "BID COUNTDOWN";
						            var currentTime2 = new Date().getTime();
						            var countdown2Upto = currentTime2 + 37000; /*add bid time here*/
						            
						            
						            	/* if (((countdownUpto == (new Date("Jan 26, 2021 10:00:00")%30) == 0).getTime())) */
									             var automaticCountdown2 = setInterval(function(){
										            var currentDate2 = new Date().getTime();  /*current time*/
										            var differenceInDate2 = countdown2Upto - currentDate2; /*in milli seconds*/ 
										            /*console.log(differenceInDate); inspect - console and see */
										            var cDays2 = Math.floor(differenceInDate2/(1000*60*60*24));
										            console.log(cDays2);
										            var cHours2 = Math.floor((differenceInDate2%(1000*60*60*24))/(1000*60*60));
										            console.log(cHours2);
										            var cMinutes2 = Math.floor((differenceInDate2%(1000*60*60))/(1000*60));
										            console.log(cMinutes2);
										            var cSeconds2 = Math.floor((differenceInDate2%(1000*60))/1000);
										            console.log(cSeconds2);
										            document.getElementById("countdown2").innerHTML = cSeconds2 + "s";
										
										            }, 1000); //to run this function in seconds not milliseconds
									            
						        </script> 
               <!--  < % } %> --> 
                </div>

            
            <div class="col-md-5 ">
                
                <label id="prodNameBox" class="category">Product Name</label>
                <div class="container">
                    <div >
                <label class="category "><b>Description:</b></label> 
                <div id="prodDescBox" style='overflow:auto; width:400px;height:217px;'>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni, explicabo unde! Aliquid, veniam magni tempora nulla ut distinctio ipsam illo ullam incidunt culpa deserunt vel velit nesciunt dolore quasi harum veritatis? Voluptatum ad illum corrupti, illo sequi itaque quae soluta.</div>                
            </div>
                <div  class="mt-lg-5" style = "font-size:19px;" >
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
				<form method="post" action="SubmitBid">
                
                        <button type="button" class="btn btn-success " id="percent1" style="width:25%;">+20%</button>
                        <button type="button" class="btn btn-success ml-lg-4 "id="percent2" style="width:25%;" >+50%</button>
                        
                        <button type="button" class="btn btn-success ml-lg-4" id="showTextArea" style="width:25%;">custom</button>
                        <input type="number" name="bidAmount" id="bidTextArea" style="display:none;" class="ml-3" placeholder="Enter_bid_amount"></input>
                        <input type="hidden" name="productID" value="<%out.print(productID);%>">
                        <input type="hidden" name="userID" value="<%out.print((String)session.getAttribute("username"));%>">
                        
                        <button type="submit" id="lockBidButton" class="btn btn-primary " style="width:100%;">Lock your Bid</button>
              
                            
             </form>          
                        
                        
                         
                          
                    </div>
                    
                  
                
                  </div>
                  <div class="col-md-3 ">
                    <div class="container">
                        <div style=" border-width: 2px;">
                        <label class="category" ><b style = "color: blue; font-size:25 px;" >Base Price:</label> <label id="basePriceBox" class="category">10000</label></b><br>
                        </div><br>
                        <div style=" border-width: 2px;">
                        <label class="category" ><b style="color: blue;font-size:25 px;">Current Highest Bid:</label> <label id="highestBidBox" class="category">14000</label></b><br>
                        </div>
                         <div id="bidRankList " style='overflow:auto; height:400px;' class="mt-md-3">
                            <div>
                              <table id="rankTable" class="table-sm table-bordered table-hover table-light"
                                data-reorderable-rows="true" aria-describedby="Bid Ranking Table">
                                <thead class="table-dark">
                                  <tr >
                                    <th scope="col" style="width: 50%">
                                      User
                                    </th>
                                    <th scope="col" data-sortable="true" style="width: 50%">
                                      Bid Amount
                                    </th>
                                  </tr>
                                </thead>
                                <tbody>
                                 
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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            
           
            
                 
       
    </body>
     </html>