<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@ include file="navbar.jsp"%>
	</header>
	<%
	List<Pellicola> pellicole = (List<Pellicola>) request.getAttribute("pellicole");
	String genere = (String) request.getAttribute("genere");
	%>
	<h1 style="margin-left: 10px">Genere:
			<%=genere%></h1>
	<div style="margin-top: 100px" class="container text-center">
		
		<%
		if (pellicole != null) {
		%>
		<%
		for (Pellicola pellicola : pellicole) {
		%>

		<div class="row"></div>
		<div class="card mb-3 mx-auto" style="width: 240px;">
			<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
				src="<%=pellicola.getFotoLocandina()%>" class="card-img-top"
				alt="..."></a>
			<div class="card-body">
				<h5 class="card-title"><%=pellicola.getNome()%></h5>
			</div>
		</div>
		<%
		}
		%>
		<%
		}
		%>
	</div>
	<%@ include file="footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

</body>
</html>