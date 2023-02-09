<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="it.generationitaly.cinestars.entity.WatchList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<WatchList> watchListi = (List<WatchList>) request.getAttribute("watchlisti");
	%>
	<table>
		<thead>
			<tr>
				<th>Utente</th>
				<th>watchlist</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (WatchList watchlist : watchListi) {
			%>

			<tr>
				<td> <img alt="" src=""> <%=watchlist.getPellicola().getFotoLocandina()%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>