<%@page
	import="it.generationitaly.cinestars.repository.impl.PellicolaRepositoryImpl"%>
<%@ page import="it.generationitaly.cinestars.entity.Genere"%>
<%@ page import="java.util.List"%>
<%
List<Genere> generi = (List<Genere>) request.getAttribute("generi");
String nomeRicerca2 = (String) request.getAttribute("nomeRicerca");
%>
<nav class="navbar navbar-expand-lg bg-light"
	style="background: rgb(38, 44, 106); background: radial-gradient(circle, rgba(38, 44, 106, 1) 0%, rgba(83, 45, 185, 1) 84%);">
	<div class="container">

		<a class="navbar-brand" href="<%=request.getContextPath()%>"
			style="width: 15rem;"> <img
			src="https://i.ibb.co/Brkqknm/Progetto-senza-titolo-1.png"
			alt="Progetto-senza-titolo-1" border="0"
			style="width: 15rem; height: 3rem;">
		</a>

		<button style="color: rgba(205, 206, 215, 255);" class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto align-middle">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="<%=request.getContextPath()%>"
					style="color: rgba(205, 206, 215, 255);">Home</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"
					style="color: rgba(205, 206, 215, 255);">Generi</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Drammatico">Drammatico</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Avventura">Avventura</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Azione">Azione</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Comico">Comico</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Commedia">Commedia</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Fantascienza">Fantascienza</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="film-by-genere?genere=Thriller">Thriller</a></li>
					</ul>
				</li>
				<li style="max-height: 48.6px">
					<form class="d-flex" role="search" action="ricerca-globale">
       					<input name="nomeRicerca" <%if(nomeRicerca2!=null){ %> value="<%=nomeRicerca2 %>"<%} %> class="form-control me-2" type="search" placeholder="Cerca" aria-label="Search">
       					<button type="submit" class="btn btn-outline-link">
					    	<img src="https://i.ibb.co/4Z87m7k/cerca-Eclipse-Ti-Fotto-Ho-Vinto-Io-1.png" style="width: 30; height: 30; margin-top: 5px;">
					    </button>
       				</form>
				</li>
			</ul>

			<%
			if (session == null || session.getAttribute("utenteUsername") == null) {
			%>
			<a type="submit" href="login.jsp"
				class="btn btn-outline-info btn-floating m-1">Login</a>
			<%
			} else {
			%>


				<div class="nav-item dropdown" style="list-style-type: none;"><a
					class="nav-link dropdown-toggle" role="button"
					data-bs-toggle="dropdown" aria-expanded="false" style="color: rgba(205, 206, 215, 255)"><%=session.getAttribute("utenteUsername")%></a>
					<ul class="dropdown-menu">
						<li>
							<form action="profiloutente">
								<button class="dropdown-item" type="submit" name="utenteId"
									value="<%=session.getAttribute("utenteId")%>">Profilo</button>
							</form>
						</li>
						<li>
							<form method="post" action="logout">
								<button class="dropdown-item" type="submit"
									onclick="return confirm('Sei sicuro di voler uscire?')">Logout</button>
							</form>
						</li>
					</ul>
				</div>
			<%
			}
			%>

		</div>
	</div>
</nav>