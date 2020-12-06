<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="newproduct.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">

    <title>newproduct</title>
  </head>
  
    <body >
        <form>
            <div class="form-row">
                <div class="col-md-6 mb-6">
                  <label for="validationDefault01">Product name</label>
                  <input type="text"  class="form-control" id="validationDefault01" placeholder="Shiny earring" value="Mark" required>
                </div>
                <div class="col-md-6 mb-6">
                  <label for="validationDefault02">Min_bid price</label>
                  <input type="number" class="form-control" id="validationDefault02"  value="500" required>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Product Desciption</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Product Category</label>
                <select class="form-control" id="exampleFormControlSelect1">
                  <option>bike</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1"> Select Bidding date</label>
                <select class="form-control" id="">
                  <option>Jan 19,2019</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1"> Select Bidding time (bidding will be for 2 minutes)</label>
                <select class="form-control" id="">
                  <option>2:00 p.m.</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
              </div>
              
              <div class="form-group">
                <label for="exampleFormControlFile1">Upload picture of product</label>
                <input type="file" class="form-control-file" id="exampleFormControlFile1" accept="image/png, image/jpeg">
              </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
</body>
<!-- Optional JavaScript; choose one of the two! -->
<div style="height:400px"></div>
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>



</html>