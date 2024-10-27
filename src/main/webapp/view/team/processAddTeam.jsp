<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.TeamService"%>
<%@ page import="lck.domain.dto.TeamDto"%>

<%
    request.setCharacterEncoding("UTF-8");

    String teamName = request.getParameter("teamName");
    int lckTitles = Integer.parseInt(request.getParameter("lckTitles"));
    int worldsTitles = Integer.parseInt(request.getParameter("worldsTitles"));
    String teamColor = request.getParameter("teamColor");
    String teamHeadCoach = request.getParameter("teamHeadCoach");

    TeamService teamService = new TeamService();
    TeamDto team = new TeamDto();
    team.setTeamName(teamName);
    team.setLckTitles(lckTitles);
    team.setWorldsTitles(worldsTitles);
    team.setTeamColor(teamColor);
    team.setTeamHeadCoach(teamHeadCoach);

    teamService.insert(team);
    response.sendRedirect("teamList.jsp");
%>
