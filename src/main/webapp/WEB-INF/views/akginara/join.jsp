<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>

	<div class="container" style="margin-top:30px">
		<form action="/akginara/join" method="post" role="form">
			<div class="form-group">
				<label for="userid">아이디</label>
				<input type="text" class="form-control" name="userid" autofocus>
		 	</div>
			<div class="form-group">
				<label for="userpw">비밀번호</label>
				<input type="password" class="form-control" name="userpw">
			</div>
			<div class="form-group">
				<label for="username">닉네임</label>
				<input type="text" class="form-control" name="username">
			</div>
			<div class="form-group">
				<label for="phone">전화번호</label>
				<input type="text" class="form-control" name="phone" placeholder="'-' 제외하고 써주세요.">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" style="float:right">회원가입</button>
			</div>
		</form>
	</div>
	
<%@ include file="includes/footer.jsp" %>