<%@page import="org.hibernate.Session,com.helper.FactoryProvider,org.hibernate.Query,java.util.*,com.entities.*" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>NoteTaker</title>
    <%@include file="AllCssJs.jsp" %>
   	<style type="text/css">
   		body {
			font-family: 'Roboto', sans-serif;
			background-image: linear-gradient(to right top, #4dd0e1, #00c6eb, #00baf5, #00acfd, #009cff);;
		}
		.container {
			background: white;
		}
   		.home-content {
   			margin-top: 10px;
   			border-radius: 10px; 
   			background: #322e2f;
   			color: white;
   			box-shadow: 0 10px 25px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
   			padding: 25px;
   		}
   		h1,p{
   			margin: 5px;			line-h
   		}
   		h1{
   			font-weight: 400;
   		}
   		.description {
   			font-weight: 100;
   		}
   		.all-notes{
			color: black;
		}
		.blur-content {
			filter: blur(3px);
		}
		.card-text {
			text-spacing: 2px;
			letter-spacing: 1px;
			font-size: 16px;
			white-space: pre-line;
			font-weight: 300;
		}
		.card-title {
			font-size: 22px;
		}
		.btn {
			background-color: #4dd0e1;
			text-shadow: 0 6px 6px rgba(0,0,0,0.19);
			color: black;
			box-shadow: 0 10px 25px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
			margin-left: 10px;
		}
		.btn:hover {
			background-color: #1e88e5;
			color: white;
		}
   	</style>
  </head>
  <body>
    
    <div class="container mt-4 p-4 mb-4" style="border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.19) ,0 6px 6px rgba(0,0,0,0.22);">
    	<%@include file="navbar.jsp"%>
    	
    	<div class="home-content">
    		<h1>NoteTaker</h1>
    		<p class="description">NoteTaker support student learning by providing clear and accurate notes to document classes or lectures.</p>
    		
    		<a href="AddNotes.jsp"><button type="button" class="btn" >Get Started</button></a>
    		<br>
    		<br>
    		<div class="blur-content mt-0">
    			<div class="row mr-5 ml-5 pl-2 pr-2">
					<div class="col-12 all-notes">
						<%
							Session s = FactoryProvider.getFactory().openSession();
							Query q = s.createQuery("from Note");	
							List<Note> list = q.list();
							for(Note note : list) {
								%>
									<!-- card  -->
									<div class="card mt-2 p-4 mb-4" style="border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.19) ,0 6px 6px rgba(0,0,0,0.22);">
									  <div class="card-body">
									    <h5 class="card-title"><%=note.getTitle() %></h5>
									    <p class="card-text"><%=note.getContent() %></p>
									    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
									    <a href="Update.jsp?note_id=<%=note.getId() %>" class="btn btn-success" onclick="">Update</a>
									  </div>
									</div>
								<% 
							}
						
							s.close();
						%>
					</div>
				</div>
    		</div>
    		
    	</div>
    </div>

    
  </body>
</html>