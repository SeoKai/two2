<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerService"%>

<%
    int playerId = Integer.parseInt(request.getParameter("id"));

    PlayerService playerService = new PlayerService();
    playerService.delete(playerId);

    response.sendRedirect("playerList.jsp");
%>
