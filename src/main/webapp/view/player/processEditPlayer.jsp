<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerService"%>
<%@ page import="lck.domain.dto.PlayerDto"%>

<%
	request.setCharacterEncoding("utf-8");
    int playerId = Integer.parseInt(request.getParameter("playerId"));
    int teamId = Integer.parseInt(request.getParameter("teamId"));
    String playerName = request.getParameter("playerName");
    String inGameName = request.getParameter("inGameName");
    String position = request.getParameter("position");
    int age = Integer.parseInt(request.getParameter("age"));

    PlayerService playerService = new PlayerService();
    PlayerDto updatedPlayer = new PlayerDto(playerId, teamId, playerName, inGameName, position, age);
    playerService.update(updatedPlayer);

    response.sendRedirect("playerList.jsp");
%>
