<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerService"%>
<%@ page import="lck.service.TeamService"%>
<%@ page import="lck.domain.dto.PlayerDto"%>
<%@ page import="lck.domain.dto.TeamDto"%>
<%@ page import="java.util.List"%>

<%
    int playerId = Integer.parseInt(request.getParameter("id"));
    PlayerService playerService = new PlayerService();
    TeamService teamService = new TeamService();
    PlayerDto player = playerService.selectById(playerId);
    List<TeamDto> teams = teamService.selectAll(); // 팀 목록 가져오기
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선수 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editStyle.css">
</head>
<body>
    <div class="container">
        <h1>선수 정보 수정</h1>
        
        <form action="processEditPlayer.jsp" method="post" class="form-style">
            <input type="hidden" name="playerId" value="<%= player.getPlayerId() %>">

            <!-- 소속 팀 드롭다운 -->
            <label for="teamId">소속 팀:</label>
            <select name="teamId" id="teamId">
                <% for (TeamDto team : teams) { %>
                    <option value="<%= team.getTeamId() %>" <%= team.getTeamId() == player.getTeamId() ? "selected" : "" %>>
                        <%= team.getTeamName() %>
                    </option>
                <% } %>
            </select><br>

            <!-- 선수 이름 -->
            <label for="playerName">선수 이름:</label>
            <input type="text" name="playerName" id="playerName" value="<%= player.getPlayerName() %>"><br>

            <!-- 닉네임 -->
            <label for="inGameName">닉네임:</label>
            <input type="text" name="inGameName" id="inGameName" value="<%= player.getInGameName() %>"><br>

            <!-- 포지션 드롭다운 -->
            <label for="position">포지션:</label>
            <select name="position" id="position">
                <option value="TOP" <%= "TOP".equals(player.getPosition()) ? "selected" : "" %>>TOP</option>
                <option value="JG" <%= "JG".equals(player.getPosition()) ? "selected" : "" %>>JG</option>
                <option value="MID" <%= "MID".equals(player.getPosition()) ? "selected" : "" %>>MID</option>
                <option value="AD" <%= "AD".equals(player.getPosition()) ? "selected" : "" %>>AD</option>
                <option value="SUP" <%= "SUP".equals(player.getPosition()) ? "selected" : "" %>>SUP</option>
            </select><br>

            <!-- 나이 -->
            <label for="age">나이:</label>
            <input type="number" name="age" id="age" value="<%= player.getAge() %>"><br>

            <button type="submit" class="submit-button">수정 완료</button>
        </form>
    </div>
</body>
</html>
