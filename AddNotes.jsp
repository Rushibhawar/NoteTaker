<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="AllCssJs.jsp" %>
<style type="text/css">
	body {
		font-family: 'Roboto', sans-serif;
		background-image: linear-gradient(to right top, #4dd0e1, #00c6eb, #00baf5, #00acfd, #009cff);;
	}
	.container {
		background: white;
	}
	.back-black {
		background: #322e2f;
		border-radius: 10px;
		margin-top: 0px;
		box-shadow: 0 10px 25px rgba(0,0,0,0.29) ,0 6px 6px rgba(0,0,0,0.35);
		color: white;
		padding: 20px;
	}
	h1,button {
		color: white;
		background: #322e2f;
	}
	
</style>
</head>
<body>
	<div class="container mt-4 p-4 mb-4" style="border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.19) ,0 6px 6px rgba(0,0,0,0.22);">
    	<%@include file="navbar.jsp"%>
    	<br>
    	
    	<div class="back-black">
    		<h1>Add Notes</h1>
	    	<!-- Form -->
	    	<form action="SaveNoteServlet" method="post">
			  <div class="form-group">
			    <label for="exampleInputTitle">Note Title</label>
			    <input type="text" name="title" class="form-control" id="exampleInputTitle"  placeholder="Enter title" required="required">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputContent">Note Content</label>
			    <textarea rows="4" cols="5" id="exampleInputContent" name="content" class="form-control" placeholder="Enter content here" style="height: 250px;line-height: 20px;" required="required"></textarea>
			  </div>
			  <div class="text-center">
			  		<button type="submit" class="btn btn-primary">Add</button>
			  </div>
			</form>
    	</div>
    </div>

</body>
</html>