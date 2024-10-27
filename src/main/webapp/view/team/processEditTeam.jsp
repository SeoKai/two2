<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lck.service.TeamService"%>
<%@ page import="lck.domain.dto.TeamDto"%>

<%
request.setCharacterEncoding("UTF-8");

int teamId = Integer.parseInt(request.getParameter("teamId"));
String teamName = request.getParameter("teamName");
int lckTitles = Integer.parseInt(request.getParameter("lckTitles"));
int worldsTitles = Integer.parseInt(request.getParameter("worldsTitles"));
String teamColor = request.getParameter("teamColor");
String teamHeadCoach = request.getParameter("teamHeadCoach");

// TeamService 객체를 생성하고, 업데이트 작업을 수행합니다.
TeamService teamService = new TeamService();
TeamDto updatedTeam = new TeamDto(teamId, teamName, lckTitles, worldsTitles, teamColor, teamHeadCoach);
teamService.update(updatedTeam);

// 업데이트 후 목록 페이지로 리다이렉트
response.sendRedirect("teamList.jsp");
%>
