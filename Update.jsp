<%@page import="com.entities.*,org.hibernate.Session,com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update page</title>
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
		margin-top: 10px;
		box-shadow: 0 10px 25px rgba(0,0,0,0.29) ,0 6px 6px rgba(0,0,0,0.35);
		color: white;
		padding: 20px;
		padding-right: 30px;
		padding-left: 30px;
	}
	h1,button {
		color: white;
		background: #322e2f;
	}
	input,textarea {
		border-radius: 10px;
	}
</style>
</head>
<body>
	<div class="container mt-4 p-4 mb-4" style="border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.19) ,0 6px 6px rgba(0,0,0,0.22);">
		<%@include file="navbar.jsp" %>
		
		<div class="back-black">
			<h1 class="mt-2 mb-4">Update Notes</h1>
		
			<% 
				int note_id = Integer.parseInt(request.getParameter("note_id").trim());
				Session s = FactoryProvider.getFactory().openSession();
				Note notes = (Note)s.get(Note.class,note_id);
			%>
			
			<!-- Form -->
	    	<div >
		    	<form action="UpdateServlet" method="post">
		    		<input type="hidden" name="note_id" value="<%= notes.getId()%>">
				  <div class="form-group ">
				    <label for="exampleInputTitle">Edit Title</label>
				    <input type="text" name="title" class="form-control" id="exampleInputTitle"  placeholder="Enter title" value="<%=notes.getTitle()%>" >
				  </div>
				  <div class="form-group">
				    <label for="exampleInputContent">Edit Content</label>
				    <textarea rows="4" cols="5" id="exampleInputContent" name="content" class="form-control" placeholder="<%=notes.getContent() %>"  style="height: 250px; line-height: 20px;" ></textarea>
				  </div>
				  <div class="text-center">
				  		<button type="submit" class="btn btn-success">Save</button>
				  </div>
				</form>
	    	</div>
		</div>
		
	</div>
</body>
</html>