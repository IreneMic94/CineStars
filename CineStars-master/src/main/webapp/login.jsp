<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<style>
 		.error{
			color:red;
			font-size: 100%;
		}
 	</style>
 	
 	<script>
 		function alreadyLogged(){
 			alert("Non puoi registrarti se sei già loggato. Effettua il logout se vuoi creare un altro account.");
 		}
 	</script>
  </head>
  <body class="text-center" style= "font-family: Bodoni; position: centre; margin-top: 100px; background: rgb(38,44,106);
background: linear-gradient(90deg, rgba(38,44,106,1) 0%, rgba(83,45,185,1) 52%, rgba(96,105,200,1) 100%);">
    <%
    String referer = request.getHeader("referer");
    if (!referer.equals("http://localhost:8080/cinestars/login.jsp")
            && !referer.equals("http://localhost:8080/cinestars/login")
            && !referer.equals("http://localhost:8080/cinestars/login.jsp?")) {
        //         out.println("<p>"+referer+"</p>");
        request.getSession().setAttribute("referer", referer);
        // out.println("<p>"+referer+"</p>");
    }
    %>
	<main class="form-signin w-100 m-auto">
  <form action="login" method="post">
  <img src= "https://i.ibb.co/Brkqknm/Progetto-senza-titolo-1.png" alt="Progetto-senza-titolo-1" border="0">
  <br>
  <br>
  	<img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="" width="130" height="130">
    <h1 style="color:rgba(205,206,215,255); font-family: Bodoni;" class="h3 mb-3 fw-normal">Effettua l'accesso</h1>

    <div class="form-floating m-auto" style="width:300px; height:85px">
      <input type="text" class="form-control" id="username" placeholder="username" name="username" required>
      <label for="username">Username</label>
      <% if(request.getAttribute("error-username") != null) { %>
	  		<span class="error"><%= request.getAttribute("error-username") %></span>	
	  <% } %>
    </div>
    <div class="form-floating m-auto" style="width:300px; height:85px">
      <input type="password" class="form-control" id="password" placeholder="password" name="password" required>
      <label for="password">Password</label>
      <% if(request.getAttribute("error-password") != null) { %>
	  		<span class="error"><%= request.getAttribute("error-password") %></span>	
	  <% } %>
    </div>
    <button class="btn btn-lg btn-outline-info" type="submit" style="margin:25px">Login</button>
    <br>
     <a style="color:rgba(205,206,215,255);">Non sei ancora registrato?</a>
     <br>
     
  </form>
  <% if (session == null || session.getAttribute("utenteUsername") == null) { %>
  		<form action="form-registra-utente.jsp" method="post">
  			<button style="margin-top: 5px; margin-bottom: 3rem;" class="btn btn-lg btn-outline-info" type="submit">Registrati</button>
  		</form>
  <% } else { %>
  		<button style="margin-top: 5px; margin-bottom: 3rem;" class="btn btn-lg btn-outline-info" onclick="alreadyLogged()">Registrati</button>
  <% } %>
</main>

	<%@ include file="footer.jsp"%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>