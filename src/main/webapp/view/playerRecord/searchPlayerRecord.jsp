<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerRecordService"%>
<%@ page import="lck.domain.dto.PlayerRecordDto"%>

<%
    PlayerRecordService playerRecordService = new PlayerRecordService();
    PlayerRecordDto record = null;
    String playerIdParam = request.getParameter("playerId");
    
    if (playerIdParam != null && !playerIdParam.isEmpty()) {
        try {
            int playerId = Integer.parseInt(playerIdParam);
            record = playerRecordService.selectById(playerId);
        } catch (NumberFormatException e) {
            out.println("<p>잘못된 선수 ID입니다.</p>");
        }
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선수 기록 조회</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/searchStyle.css">
</head>
<body>
    <div class="container">
        <h1>특정 선수 기록 조회</h1>
        
        <form action="searchPlayerRecord.jsp" method="get">
            선수 ID: <input type="number" name="playerId">
            <button type="submit">조회</button>
        </form>

        <% if (record != null) { %>
            <table border="1">
                <tr><th>선수 ID</th><td><%= record.getPlayerId() %></td></tr>
                <tr><th>총 킬 수</th><td><%= record.getPlayerName() %></td></tr>
                <tr><th>총 킬 수</th><td><%= record.getTotalKills() %></td></tr>
                <tr><th>총 어시스트</th><td><%= record.getTotalAssists() %></td></tr>
                <tr><th>총 죽음</th><td><%= record.getTotalDeaths() %></td></tr>
                <tr><th>경기 수</th><td><%= record.getTotalGamesPlayed() %></td></tr>
                <tr><th>승리 수</th><td><%= record.getTotalWins() %></td></tr>
                <tr><th>패배 수</th><td><%= record.getTotalLosses() %></td></tr>
                <tr><th>총 트로피 수</th><td><%= record.getTotalTrophies() %></td></tr>
            </table>
            <a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
        <% } else if (playerIdParam != null) { %>
            <p>해당 선수의 기록이 존재하지 않습니다.</p>
        <% } %>
    </div>
</body>
</html>
