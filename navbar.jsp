<link href="css/style.css" rel="stylesheet">
<%@include file="AllCssJs.jsp" %>
<style>
	.navbar{
		font-family: 'Roboto', sans-serif;
		font-weight: 400;
	}
	.nav-link {
		text-shadow: 0 6px 6px rgba(0,0,0,0.19);
		font-size: 18px;
		color: #322e2f;
	}
</style>
<nav class="navbar navbar-expand-lg navbar-dark cyan-color" style="background-color: #4dd0e1 !important; color: white !important;border-radius: 10px;position: sticky;top: 10px;z-index: 1;box-shadow: 0 4px 6px rgba(0,0,0,0.19);">
  <a class="navbar-brand" href="index.jsp">NoteTaker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active ml-3">
        <a class="nav-link" href="index.jsp" >Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active ml-3">
        <a class="nav-link" href="AddNotes.jsp">Add Note</a>
      </li>
      <li class="nav-item active ml-3">
        <a class="nav-link" href="AllNotes.jsp">Show Notes</a>
      </li>

    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-dark my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>