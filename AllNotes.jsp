<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.Session,com.helper.FactoryProvider,org.hibernate.Query,java.util.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes : NoteTaker</title>
<%@include file="AllCssJs.jsp" %>
<style type="text/css">
	body {
		font-family: 'Roboto', sans-serif;
		background-image: linear-gradient(to right top, #4dd0e1, #00c6eb, #00baf5, #00acfd, #009cff);;
	}
	.back-black, heading {
		background: #322e2f;
		border-radius: 10px;
		margin-top: 10px;
		box-shadow: 0 10px 25px rgba(0,0,0,0.29) ,0 6px 6px rgba(0,0,0,0.35);
		color: white;
	}
	.all-notes{
		color: black;
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
</style>
</head>
<body>
	<div class="container mt-4 p-4 mb-4" style="background: white;border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.19) ,0 6px 6px rgba(0,0,0,0.22);">
		<%@include file="navbar.jsp"%>
		
		<div class="back-black ">
			<div class="ml-5 mr-5 p-5 all-content" >
				<h1 class="text-uppercase heading" >All Notes <img alt="note image" src="img/notes.png" style="max-width: 50px;"></h1> 
				<div class="row">
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
									    <p class="card-title"><%=note.getTitle() %></p>
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
	
	<%
		HttpSession ses = request.getSession();
	%>
	
	<script type="text/javascript">	
		var Msg ='<%=session.getAttribute("getalert")%>';
		if (Msg == "Yes") {
			alert("Note added successfully");
			'<%ses.invalidate();%>'
		}
	</script>
</body>
</html>