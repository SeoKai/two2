<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerRecordService"%>
<%@ page import="lck.domain.dto.PlayerRecordDto"%>

<%
    int playerId = Integer.parseInt(request.getParameter("id"));
    PlayerRecordService playerRecordService = new PlayerRecordService();
    PlayerRecordDto record = playerRecordService.selectById(playerId);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선수 기록 수정</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editStyle.css">
</head>
<body>
    <div class="container">
        <h1>선수 기록 수정</h1>
        <form action="processEditPlayerRecord.jsp" method="post" class="form-style">
            <input type="hidden" name="playerId" value="<%= record.getPlayerId() %>">

            <label for="totalKills">총 킬 수:</label>
            <input type="number" name="totalKills" id="totalKills" value="<%= record.getTotalKills() %>"><br>

            <label for="totalAssists">총 어시스트:</label>
            <input type="number" name="totalAssists" id="totalAssists" value="<%= record.getTotalAssists() %>"><br>

            <label for="totalDeaths">총 죽음:</label>
            <input type="number" name="totalDeaths" id="totalDeaths" value="<%= record.getTotalDeaths() %>"><br>

            <label for="totalGamesPlayed">경기 수:</label>
            <input type="number" name="totalGamesPlayed" id="totalGamesPlayed" value="<%= record.getTotalGamesPlayed() %>"><br>

            <label for="totalWins">승리 수:</label>
            <input type="number" name="totalWins" id="totalWins" value="<%= record.getTotalWins() %>"><br>

            <label for="totalLosses">패배 수:</label>
            <input type="number" name="totalLosses" id="totalLosses" value="<%= record.getTotalLosses() %>"><br>

            <label for="totalTrophies">총 트로피 수:</label>
            <input type="number" name="totalTrophies" id="totalTrophies" value="<%= record.getTotalTrophies() %>"><br>

            <button type="submit" class="submit-button">수정하기</button>
        </form>
        <a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
    </div>
</body>
</html>
