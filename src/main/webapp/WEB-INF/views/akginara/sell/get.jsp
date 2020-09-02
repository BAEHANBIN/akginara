<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	$(function () {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/akginara/sell/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/akginara/sell/list");
			operForm.submit();
		});
	});
	
</script>

	<div class="container" style="margin-top:30px">
		<h2><b>글읽기</b></h2><hr><br>
		<div class="form-group">
			<label for="writer">글쓴이</label>
			<input class="form-control" name="writer" value="<c:out value='${sell.writer}'/>" readonly>
		</div>
		<div class="form-group">
			<label for="district">지역</label>
			<input class="form-control" name="district" value="<c:out value='${sell.district}'/>" readonly>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" name="title" value="<c:out value='${sell.title}'/>" readonly>
		</div>
		<div class="form-group">
			<label for="price">가격</label>
			<input class="form-control" name="price" value="<c:out value='${sell.price}'/>" readonly>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="20" cols="120" name="content" readonly><c:out value="${sell.content}"/></textarea>
		</div>
		<hr>
		<div class="container" style="text-align: right; margin-bottom: 20px;">
			<button data-oper="modify" class="btn btn-success">수정</button>
			<button data-oper="list" class="btn btn-info">목록</button>
		</div>
		<form action="akginara/sell/modify" method="get" id="operForm">
			<input type="hidden" id="bno" name="bno" value="<c:out value='${sell.bno}'/>">
			<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
			<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
		</form>
	</div>

<%@include file="../includes/footer.jsp"%>