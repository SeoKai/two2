<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LCK 선수 관리 시스템</title>
    <style>
        /* 인라인 스타일 */
        body {
            background-color: #f4f4f9;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .navigation {
            list-style: none;
            padding: 0;
        }
        .navigation li {
            margin: 15px 0;
        }
        .navigation a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }
        .navigation a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>LCK 선수 관리 시스템</h1>
        
        <ul class="navigation">
            <li><a href="${pageContext.request.contextPath}/view/player/playerList.jsp">선수 목록 (Player)</a></li>
            <li><a href="${pageContext.request.contextPath}/view/playerRecord/playerRecordList.jsp">선수 기록 (PlayerRecord)</a></li>
            <li><a href="${pageContext.request.contextPath}/view/team/teamList.jsp">팀 목록 (Team)</a></li>
        </ul>
    </div>
</body>
</html>
