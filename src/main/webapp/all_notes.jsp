<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes</title>

<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@ include file="navbar.jsp"%>
	</div>

	<div class="row">
		<div class="col-12">
			<%
				Session s = FactoryProvider.getFactory().openSession();
				//HQL	
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy  hh:mm:ss");
				for(Note note : list) {
			%>
			<div class="card p-4 mt-3 mx-3 my-3">
				<img src="images/notes.png" class="card-img-top m-4" alt="image"
					style="max-width: 100px;">
					
				<div class="card-body">
					<h5 class="card-title"><%= note.getTitle()%></h5>
					<p class="card-text"><%= note.getContent()%></p>
					<label class="form-label" style="font-size:15px; text-align: left; color: grey">Last Updated On: <%= format.format(note.getAddedDate()) %></label>
					<div class="container text-center">
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
					</div>
				</div>
			</div>
			<%
				}
				s.close();
			%>
		</div>
	</div>


</body>
</html>