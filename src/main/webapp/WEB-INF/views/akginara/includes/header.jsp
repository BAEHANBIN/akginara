<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>중고악기나라</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    <!-- Icon -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
    <div class="jumbotron" style="padding-top: 0; margin-bottom: 0">
        <nav class="navbar navbar-expand-sm justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/akginara/login">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/akginara/logout">로그아웃</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/akginara/join">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">마이페이지</a>
                </li>
            </ul>
        </nav>
        <div class="container">
            <h1><b><a href="/akginara">중고악기나라</a></b></h1>
        </div>
    </div>

	 <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <div class="container-sm">
                <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/akginara/sell/list">거래하기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">사용후기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">묻고답하기</a>
                </li>    
            </ul>
            </div>
        </div>  
    </nav>
    
    <div id="page-wrapper">

    
</body>
</html>