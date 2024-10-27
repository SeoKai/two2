<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lck.service.TeamService"%>

<%
    int teamId = Integer.parseInt(request.getParameter("id"));
    TeamService teamService = new TeamService();
    teamService.delete(teamId);
    response.sendRedirect("teamList.jsp");
%>
