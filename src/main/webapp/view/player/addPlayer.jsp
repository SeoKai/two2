<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.TeamService"%>
<%@ page import="lck.domain.dto.TeamDto"%>
<%@ page import="java.util.List"%>

<%
    request.setCharacterEncoding("UTF-8");  // 한글 인코딩 설정
    TeamService teamService = new TeamService();
    List<TeamDto> teams = teamService.selectAll();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>새로운 선수 추가</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editStyle.css">
</head>
<body>
    <div class="container">
        <h1>새로운 선수 입력하기</h1>
        
        <form action="processAddPlayer.jsp" method="post" class="form-style">
            <!-- 소속 팀 선택 -->
            <label for="teamId">소속 팀:</label>
            <select name="teamId" id="teamId">
                <% for (TeamDto team : teams) { %>
                    <option value="<%= team.getTeamId() %>"><%= team.getTeamName() %></option>
                <% } %>
            </select><br>

            <!-- 선수 정보 입력 -->
            <label for="playerName">선수 이름:</label>
            <input type="text" name="playerName" id="playerName"><br>

            <label for="inGameName">닉네임:</label>
            <input type="text" name="inGameName" id="inGameName"><br>
            
            <!-- 포지션 드롭다운 -->
            <label for="position">포지션:</label>
            <select name="position" id="position">
                <option value="TOP">TOP</option>
                <option value="JG">JG</option>
                <option value="MID">MID</option>
                <option value="AD">AD</option>
                <option value="SUP">SUP</option>
            </select><br>
            
            <label for="age">나이:</label>
            <input type="number" name="age" id="age"><br>
            
            <button type="submit" class="submit-button">추가하기</button>
        </form>
        
        <a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
    </div>
</body>
</html>
