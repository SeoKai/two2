<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerRecordService"%>
<%@ page import="lck.domain.dto.PlayerRecordDto"%>

<%
    request.setCharacterEncoding("utf-8");
    
    int playerId = Integer.parseInt(request.getParameter("playerId"));
    int totalKills = Integer.parseInt(request.getParameter("totalKills"));
    int totalAssists = Integer.parseInt(request.getParameter("totalAssists"));
    int totalDeaths = Integer.parseInt(request.getParameter("totalDeaths"));
    int totalGamesPlayed = Integer.parseInt(request.getParameter("totalGamesPlayed"));
    int totalWins = Integer.parseInt(request.getParameter("totalWins"));
    int totalLosses = Integer.parseInt(request.getParameter("totalLosses"));
    int totalTrophies = Integer.parseInt(request.getParameter("totalTrophies"));
    
    PlayerRecordDto newRecord = new PlayerRecordDto(playerId, totalKills, totalAssists, totalDeaths, totalGamesPlayed, totalWins, totalLosses, totalTrophies);
    
    PlayerRecordService playerRecordService = new PlayerRecordService();
    playerRecordService.insert(newRecord);
    
    response.sendRedirect("playerRecordList.jsp");
%>
