<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerService"%>
<%@ page import="lck.domain.dto.PlayerDto"%>

<%
request.setCharacterEncoding("utf-8");
int teamId = Integer.parseInt(request.getParameter("teamId"));
String playerName = request.getParameter("playerName");
String inGameName = request.getParameter("inGameName");
String position = request.getParameter("position");
int age = Integer.parseInt(request.getParameter("age"));

PlayerService playerService = new PlayerService();
PlayerDto newPlayer = new PlayerDto(0, teamId, playerName, inGameName, position, age);
playerService.insert(newPlayer);

response.sendRedirect("playerList.jsp");
%>
