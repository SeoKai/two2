<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.TeamService"%>
<%@ page import="lck.domain.dto.TeamDto"%>

<%
    int teamId = Integer.parseInt(request.getParameter("id"));
    TeamService teamService = new TeamService();
    TeamDto team = teamService.selectById(teamId);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>팀 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editStyle.css">
</head>
<body>
    <div class="container">
        <h1>팀 정보 수정</h1>
        <form action="processEditTeam.jsp" method="post">
            <input type="hidden" name="teamId" value="<%= team.getTeamId() %>">
            <label>팀 이름: <input type="text" name="teamName" value="<%= team.getTeamName() %>"></label>
            <label>LCK 우승 횟수: <input type="number" name="lckTitles" value="<%= team.getLckTitles() %>"></label>
            <label>세계 대회 우승 횟수: <input type="number" name="worldsTitles" value="<%= team.getWorldsTitles() %>"></label>
            <label>팀 색상: <input type="text" name="teamColor" value="<%= team.getTeamColor() %>"></label>
            <label>감독: <input type="text" name="teamHeadCoach" value="<%= team.getTeamHeadCoach() %>"></label>
            <button type="submit">수정하기</button>
        </form>
        <a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
    </div>
</body>
</html>
