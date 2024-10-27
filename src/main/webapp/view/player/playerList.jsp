<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerService"%>
<%@ page import="lck.domain.dto.PlayerDto"%>
<%@ page import="java.util.List"%>

<%
// PlayerService 객체를 생성하고, 전체 선수 리스트를 가져옵니다.
PlayerService playerService = new PlayerService();
List<PlayerDto> players = playerService.selectAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 목록</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/listStyle.css">
</head>
<body>
	<div class="container">
		<h1>LCK 선수 목록</h1>

		<table border="1">
			<tr>
				<th>식별 ID</th>
				<th>소속 팀</th>
				<th>선수 이름</th>
				<th>닉네임</th>
				<th>포지션</th>
				<th>나이</th>
				<th>수정/삭제</th>
			</tr>

			<%
			// 각 선수의 정보를 테이블에 출력합니다.
			for (PlayerDto player : players) {
			%>
			<tr>
				<td><%=player.getPlayerId()%></td>
				<td><%= player.getTeamName() %></td>
				<td><%=player.getPlayerName()%></td>
				<td><%=player.getInGameName()%></td>
				<td><%=player.getPosition()%></td>
				<td><%=player.getAge()%></td>
				<td>
					<!-- 수정 및 삭제 링크 --> <a
					href="editPlayer.jsp?id=<%=player.getPlayerId()%>">수정</a> | <a
					href="deletePlayer.jsp?id=<%=player.getPlayerId()%>"
					onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
				</td>
			</tr>
			<%
			}
			%>
		</table>

		<!-- 새로운 선수 입력 링크 -->
		<a href="addPlayer.jsp" class="new-link">새로운 선수 입력하기</a>
		<a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
		
	</div>
</body>
</html>
