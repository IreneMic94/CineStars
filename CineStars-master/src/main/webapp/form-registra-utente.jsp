<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Registrati</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">	
		<style type="text/css">
		
			.error{
				color:red;
				font-size: 80%;
			}
			.container {
  				display: flex;
  				justify-content: center;
			}
		</style>
	</head>
	<body class="text-center" style= "font-family: Bodoni; position: centre; margin-top: 100px; background: rgb(38,44,106);
background: linear-gradient(90deg, rgba(38,44,106,1) 0%, rgba(83,45,185,1) 52%, rgba(96,105,200,1) 100%);">

	<img src= "https://i.ibb.co/Brkqknm/Progetto-senza-titolo-1.png" alt="Progetto-senza-titolo-1" border="0">
	
		 <h1 style="color:rgba(205,206,215,255); font-family: Bodoni;" class="h3 mb-3 fw-normal">Registrazione utente</h1>
		 
  <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/7036/7036987.png" alt="" width="100" height="100">
		 
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<form class="mt-3" action="registra-utente" method="post">
						<div class="form-floating mb-3">
							<input id="nome" type="text" class="form-control" name="nome" placeholder="es. marietto" required minlength="3" maxlength="15">
							<label for="nome">Nome</label>
						</div>
						<div class="form-floating mb-3">
							<input id="cognome" type="text" class="form-control" name="cognome" placeholder="es. rossi" required minlength="3" maxlength="15">
							<label for="cognome">Cognome</label>
						</div>
						<div class="form-floating mb-3">
							<input id="nazionalita" type="text" class="form-control" name="nazionalita" placeholder="es. italiano/a" required maxlength="15">
							<label for="nazionalita">Nazionalità</label>	
						</div>
						<div class="form-floating mb-3">
							<input id="username" type="text" class="form-control" name="username" placeholder="es. marietto" required maxlength="15">
							<label for="username">Username</label>
							<% if(request.getAttribute("usernameExist") != null) { %>
								<span class="error"><%= request.getAttribute("usernameExist") %></span>	
							<% } %>	
						</div>
						<div class="form-floating mb-3">
							<input id="password" type="password" class="form-control" name="password" required minlength="3" maxlength="20">
							<label for="password">Password</label>
						</div>
							<a class="btn btn-outline-danger" href="<%= request.getContextPath()%>">ANNULLA</a>
							<button class="btn btn-outline-info" type="submit">SALVA CREDENZIALI</button>
					</form>
					<br><br>
					<div class="form-floating mb-3">
						<a class="btn btn-outline-info" href="login.jsp">SEI GIÀ REGISTRATO? ACCEDI</a> 
					</div>
				</div>
			</div>
		</div>
		<%@ include file="footer.jsp" %>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>		
	</body>
</html>