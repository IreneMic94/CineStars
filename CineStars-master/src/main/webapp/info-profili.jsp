<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinestars.entity.Utente"%>
<%@ page import="it.generationitaly.cinestars.entity.Recensione"%>
<%@ page import="it.generationitaly.cinestars.entity.WatchList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	
 <style>
 	.module-border-wrap {
 	padding: 1rem;
 	position: relative;
 	background: rgb(34,139,195);
	background: linear-gradient(0deg, rgba(34,139,195,1) 0%, rgba(158,45,253,0.8309698879551821) 100%);
 	padding: 3px; 
 	margin-bottom: 3rem;
 	
 	}  
 	
 	.module {
 	background: rgb(68,79,197);
	background: radial-gradient(circle, rgba(68,79,197,1) 0%, rgba(38,44,106,1) 100%);
 	color: white;
 	padding: 2rem; 
 	}

    
    section.inner_content div.column_content.flex.scroller.loaded {
        min-height: 0;
        height: auto;
    }
    
    section.inner_content.video div.column_content.flex.scroller {
        min-height: 295px;
    }
    
    section.inner_content div.column_content.flex.scroller {
        width: 100%;
        max-width: var(--maxPrimaryPageWidth);
        min-height: 355px;
        overflow-x: scroll;
        overflow-y: hidden;
        transition: height .5s linear;
    }
    
    div.column_wrapper div.column_content {
        padding-top: 20px;
    }
    
    div.scroller {
        -webkit-overflow-scrolling: touch;
        overflow-y: hidden;
        overflow-x: scroll;
        white-space: nowrap;
        padding-bottom: 10px;
    }
     
    html {
        --scrollerGrey: 219,219,219;
     }

    section.inner_content div.column_content.flex.scroller::-webkit-scrollbar {
        height: 8px;
        width: 8px;
    }
    div.scroller::-webkit-scrollbar {
        height: 8px;
        width: 8px;
    }
    section.inner_content div.column_content.flex.scroller::-webkit-scrollbar-thumb {
        background-color: rgba(var(--scrollerGrey), 1);
        border-radius: 20px;
    }
    div.scroller::-webkit-scrollbar-thumb {
        background-color: rgba(var(--scrollerGrey), 1);
        border-radius: 20px;
    }
    section.inner_content div.column_content.flex.scroller::-webkit-scrollbar-track {
        background: transparent;
    }
    div.scroller::-webkit-scrollbar-track {
        background: transparent;
        }
        
    .card-style {
      max-width: 10rem;
       display: inline-block;
       margin-right: 3rem;
       background: transparent;
    border: transparent;
    color: white;
    }
    
    .div-text {
       font-size:19px;
      text-overflow: ellipsis;
      white-space: nowrap;
        overflow: hidden;
    }
 </style>
</head>
<body  
class="text-center"
	style="position: centre; background: rgb(38, 44, 106); background: linear-gradient(90deg, rgba(38, 44, 106, 1) 0%, rgba(83, 45, 185, 1) 52%, rgba(96, 105, 200, 1) 100%);">
	<header>
  		<%@ include file="navbar.jsp" %>
    </header>
 	<br>
 	<br>  
    <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/4497/4497244.png" alt="" width="130" height="130">
	<%
	Utente utente = (Utente) request.getAttribute("utente");
	List<WatchList> watchlisti = (List<WatchList>) request.getAttribute("watchlisti");
	List<Recensione> recensioni = (List<Recensione>) request.getAttribute("recensioni");
	%>
	
	<div class="container text-center module-border-wrap">
	<div class="module">
		<div class="row">
		<div>
			<div class="col">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			</div>
				<h1 style="color: rgba(205, 206, 215, 255); font-family: Bodoni;"
					class="h3 mb-3 fw-normal">PROFILO DI: <%=utente.getUsername() %></h1>
				<table class="table table-borderless">
					<thead>
						<tr>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="color:rgba(205,206,215,255); font-size: 23px">Username: <a><%=utente.getUsername()%></a></td>
						</tr>
						<tr>
							<td style="color:rgba(205,206,215,255); font-size: 23px">Nome: <a><%=utente.getNome()%></a></td>
						</tr>
						<tr>
							<td style="color:rgba(205,206,215,255); font-size: 23px">Cognome: <a><%=utente.getCognome()%></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col mt-5">
				<h1 style="color: rgba(205, 206, 215, 255); font-family: Bodoni;"
					class="h3 mb-3 fw-normal">Watchlist:</h1>
			</div>
			<div class="column_content flex scroller loaded module">
						<%
							for (WatchList watchList : watchlisti) {
						%>
					<div class="card-style">
							<a href="info-pellicola?id=<%=watchList.getPellicola().getId()%>">
								<img src="<%=watchList.getPellicola().getFotoLocandina()%>" class="card-img-top"
								style="width: 175px; height: 225px; border-radius: 5%">
							</a>
							<div class="card-title div-text" style="height: 30px">
								<%=watchList.getPellicola().getNome()%>
							</div>
					</div>
				<%
				}
				%>
				</div>
			</div>
				<div class="row mt-5 text-center module module-border-wrap">
				<h1 style="color: rgba(205, 206, 215, 255); font-family: Bodoni;"
					class="h3 mb-3 fw-normal">Recensioni:</h1>
					<hr class="featurette-divider">
					<%
						for (Recensione recensione : recensioni) {
					%>
				<div>
						<img style="margin-right: 1rem;"
							src="https://i.ibb.co/VD08Q8F/Progetto-senza-titolo-2.png">
						<span style="color: #0DCAF0"><%=recensione.getUtente().getUsername()%></span>
						<%=recensione.getVoto()%>/5
					<br>
					<a href="info-pellicola?id=<%=recensione.getPellicola().getId()%>"><p><%=recensione.getPellicola().getNome() %></p></a>
					<p>
						<%=recensione.getDescrizione()%>
					</p>
					<h6>
						<%=recensione.getDataRecensione()%>
					</h6>
				</div>
				<hr class="featurette-divider">
				<%
				}
				%>
				<br>
			</div>
			
				</div>
			</div>
			</div>
		<%@ include file="footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>