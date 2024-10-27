<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerService"%>
<%@ page import="lck.domain.dto.PlayerDto"%>
<%@ page import="java.util.List"%>

<%
    // 전체 선수 목록을 불러와 드롭다운에 표시
    PlayerService playerService = new PlayerService();
    List<PlayerDto> players = playerService.selectAll();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선수 기록 추가</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editStyle.css">
</head>
<body>
    <div class="container">
        <h1>선수 기록 추가</h1>
        <form action="processAddPlayerRecord.jsp" method="post" class="form-style">
            <!-- 선수 선택 드롭다운 -->
            <label for="playerId">선수 선택:</label>
            <select name="playerId" id="playerId" required>
                <% for (PlayerDto player : players) { %>
                    <option value="<%= player.getPlayerId() %>"><%= player.getPlayerName() %> (<%= player.getInGameName() %>)</option>
                <% } %>
            </select><br>

            <label>총 킬 수</label>
            <input type="number" name="totalKills" required><br>
            <label>총 어시스트</label>
            <input type="number" name="totalAssists" required><br>
            <label>총 데스</label>
            <input type="number" name="totalDeaths" required><br>
            <label>경기 수</label>
            <input type="number" name="totalGamesPlayed" required><br>
            <label>승리 수</label>
            <input type="number" name="totalWins" required><br>
            <label>패배 수</label>
            <input type="number" name="totalLosses" required><br>
            <label>총 트로피 수</label>
            <input type="number" name="totalTrophies" required><br>

            <button type="submit" class="submit-button">추가하기</button>
        </form>
        <a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
    </div>
</body>
</html>
