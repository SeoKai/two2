<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.PlayerRecordService"%>
<%@ page import="lck.domain.dto.PlayerRecordDto"%>

<%
    // 요청의 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    // 폼에서 전달된 값 받기
    int playerId = Integer.parseInt(request.getParameter("playerId"));
    int totalKills = Integer.parseInt(request.getParameter("totalKills"));
    int totalAssists = Integer.parseInt(request.getParameter("totalAssists"));
    int totalDeaths = Integer.parseInt(request.getParameter("totalDeaths"));
    int totalGamesPlayed = Integer.parseInt(request.getParameter("totalGamesPlayed"));
    int totalWins = Integer.parseInt(request.getParameter("totalWins"));
    int totalLosses = Integer.parseInt(request.getParameter("totalLosses"));
    int totalTrophies = Integer.parseInt(request.getParameter("totalTrophies"));

    // 업데이트할 PlayerRecordDto 객체 생성
    PlayerRecordDto updatedRecord = new PlayerRecordDto(
        playerId, totalKills, totalAssists, totalDeaths,
        totalGamesPlayed, totalWins, totalLosses, totalTrophies
    );

    // 서비스 호출하여 데이터베이스에 업데이트
    PlayerRecordService playerRecordService = new PlayerRecordService();
    playerRecordService.update(updatedRecord);

    // 업데이트 후 리스트 페이지로 리다이렉트
    response.sendRedirect("playerRecordList.jsp");
%>
