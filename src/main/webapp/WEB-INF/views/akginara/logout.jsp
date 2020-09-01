<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function logout() {
		var result = confirm('로그아웃 하시겠습니까?');
		if (result == true) {
			$("form").submit();
			location.href="/akginara";
		}
		return false;
	}
</script>
</head>
<body>
	<script>
		javascript:logout();
	</script>
	<form action="/akginara/logout" method="post" role="form">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</body>
</html>