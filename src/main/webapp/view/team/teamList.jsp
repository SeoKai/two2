<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lck.service.TeamService"%>
<%@ page import="lck.domain.dto.TeamDto"%>
<%@ page import="java.util.List"%>

<%
TeamService teamService = new TeamService();
List<TeamDto> teams = teamService.selectAll();
%>

<!DOCTYPE html>
<html>
<head>
<title>팀 목록</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/listStyle.css">
</head>
<body>
	<div class="container">
		<h1>팀 목록</h1>
		<table border="1">
			<tr>
				<th>팀 ID</th>
				<th>팀 이름</th>
				<th>LCK 우승 횟수</th>
				<th>세계 대회 우승 횟수</th>
				<th>팀 색상</th>
				<th>감독</th>
				<th>수정/삭제</th>
			</tr>
			<%
			for (TeamDto team : teams) {
			%>
			<tr>
				<td><%=team.getTeamId()%></td>
				<td><%=team.getTeamName()%></td>
				<td><%=team.getLckTitles()%></td>
				<td><%=team.getWorldsTitles()%></td>
				<td><%=team.getTeamColor()%></td>
				<td><%=team.getTeamHeadCoach()%></td>
				<td><a href="editTeam.jsp?id=<%=team.getTeamId()%>">수정</a> | <a
					href="deleteTeam.jsp?id=<%=team.getTeamId()%>"
					onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<a href="addTeam.jsp" class="new-link">새로운 팀 추가하기</a>
		<a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
		
	</div>
</body>
</html>
