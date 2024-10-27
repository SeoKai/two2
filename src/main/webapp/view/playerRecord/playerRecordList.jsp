<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerRecordService"%>
<%@ page import="lck.domain.dto.PlayerRecordDto"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>


<%
PlayerRecordService playerRecordService = new PlayerRecordService();
List<PlayerRecordDto> records = playerRecordService.selectAll();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>선수 기록 목록</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/listStyle.css">
</head>
<body>
	<div class="container">
		<h1>선수 기록 목록</h1>
		<table border="1">
			<tr>
				<th>선수 이름</th>
				<!-- 선수 이름 컬럼 추가 -->
				<th>총 킬 수</th>
				<th>총 어시스트</th>
				<th>총 죽음</th>
				<th>경기 수</th>
				<th>승리 수</th>
				<th>패배 수</th>
				<th>총 트로피 수</th>
				<th>수정/삭제</th>
			</tr>

			<%
			for (PlayerRecordDto record : records) {
			%>
			<tr>
				<td><%=record.getPlayerName()%></td>
				<!-- 선수 이름 표시 -->
				<td><%=record.getTotalKills()%></td>
				<td><%=record.getTotalAssists()%></td>
				<td><%=record.getTotalDeaths()%></td>
				<td><%=record.getTotalGamesPlayed()%></td>
				<td><%=record.getTotalWins()%></td>
				<td><%=record.getTotalLosses()%></td>
				<td><%=record.getTotalTrophies()%></td>
				<td><a
					href="editPlayerRecord.jsp?id=<%=record.getPlayerId()%>">수정</a> |
					<a href="deletePlayerRecord.jsp?id=<%=record.getPlayerId()%>"
					onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<a href="addPlayerRecord.jsp" class="back-to-home">새로운 기록 추가</a> 
		<a href="searchPlayerRecord.jsp" class="back-to-home">선수 ID로 검색</a>
		<a href="<%=request.getContextPath()%>/index.jsp" class="back-to-home">홈으로</a>
	</div>
</body>
</html>
