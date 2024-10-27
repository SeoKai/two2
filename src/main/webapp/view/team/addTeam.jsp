<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>새로운 팀 추가</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addStyle.css">
</head>
<body>
    <div class="container">
        <h1>새로운 팀 추가</h1>
        <form action="processAddTeam.jsp" method="post">
            <label for="teamName">팀 이름:</label>
            <input type="text" name="teamName" id="teamName" required>

            <label for="lckTitles">LCK 우승 횟수:</label>
            <input type="number" name="lckTitles" id="lckTitles">

            <label for="worldsTitles">세계 대회 우승 횟수:</label>
            <input type="number" name="worldsTitles" id="worldsTitles">

            <label for="teamColor">팀 색상:</label>
            <input type="text" name="teamColor" id="teamColor">

            <label for="teamHeadCoach">감독:</label>
            <input type="text" name="teamHeadCoach" id="teamHeadCoach">

            <button type="submit">추가하기</button>
        </form>
        <a href="<%= request.getContextPath() %>/index.jsp" class="back-to-home">홈으로</a>
    </div>
</body>
</html>
