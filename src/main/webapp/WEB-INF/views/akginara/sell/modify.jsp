<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	$(function () {
		var formObj = $("form");
		
		$("button").on("click", function (e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if (operation === 'remove') {
				formObj.attr("action", "/akginara/sell/remove");
				
			} else if (operation === 'list') {
				formObj.attr("action", "/akginara/sell/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
</script>

	<div class="container" style="margin-top:30px">
		<h2><b>글수정하기</b></h2><hr><br>
		<form action="/akginara/sell/modify" method="post" role="form">
			<input type="hidden" name="bno" value="<c:out value='${sell.bno}'/>">
				<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
				<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
			<div class="form-group">
				<label for="category">카테고리</label>
				<select class="form-control" name="category" style="width:150px">
							<option>카테고리 선택</option>
							<option value="기타" <c:if test="${sell.category == '기타'}">selected</c:if>>기타</option>
							<option value="베이스" <c:if test="${sell.category == '베이스'}">selected</c:if>>베이스</option>
							<option value="드럼" <c:if test="${sell.category == '드럼'}">selected</c:if>>드럼</option>
							<option value="키보드" <c:if test="${sell.category == '키보드'}">selected</c:if>>키보드</option>
							<option value="신디" <c:if test="${sell.category == '신디'}">selected</c:if>>신디</option>
							<option value="이펙터" <c:if test="${sell.category == '이펙터'}">selected</c:if>>이펙터</option>
							<option value="음향장비" <c:if test="${sell.category == '음향장비'}">selected</c:if>>음향장비</option>
				</select>
		 	</div>
			<div class="form-group">
				<label for="district">지역</label>
				<select class="form-control" name="district" style="width:150px">
							<option>지역 선택</option>
							<option value="서울" <c:if test="${sell.district == '서울'}">selected</c:if>>서울</option>
							<option value="대전" <c:if test="${sell.district == '대전'}">selected</c:if>>대전</option>
							<option value="대구" <c:if test="${sell.district == '대구'}">selected</c:if>>대구</option>
							<option value="울산" <c:if test="${sell.district == '울산'}">selected</c:if>>울산</option>
							<option value="부산" <c:if test="${sell.district == '부산'}">selected</c:if>>부산</option>
							<option value="경기" <c:if test="${sell.district == '경기'}">selected</c:if>>경기</option>
							<option value="강원" <c:if test="${sell.district == '강원'}">selected</c:if>>강원</option>
							<option value="경남" <c:if test="${sell.district == '경남'}">selected</c:if>>경남</option>
							<option value="경북" <c:if test="${sell.district == '경북'}">selected</c:if>>경북</option>
							<option value="전남" <c:if test="${sell.district == '전남'}">selected</c:if>>전남</option>
							<option value="전북" <c:if test="${sell.district == '전북'}">selected</c:if>>전북</option>
							<option value="충남" <c:if test="${sell.district == '충남'}">selected</c:if>>충남</option>
							<option value="충북" <c:if test="${sell.district == '충북'}">selected</c:if>>충북</option>
							<option value="제주" <c:if test="${sell.district == '제주'}">selected</c:if>>제주</option>
				</select>
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" value="<c:out value='${sell.title}'/>">
			</div>
			<div class="form-group">
				<label for="price">가격</label>
				<input type="text" class="form-control" name="price" value="<c:out value='${sell.price}'/>">
			</div>
			
			<div class="form-group uploadDiv">
				<label for="uploadFile">사진</label><br>
				<input type="file" name="uploadFile" multiple>
			</div>
		
			<div class="uploadResult">
				<ul>
				
				</ul>
			</div>
			
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="20" cols="120" name="content"><c:out value="${sell.content}"/></textarea>
			</div>
			<hr>
			<div class="container" style="text-align: right; margin-bottom: 20px;">
				<button type="button" data-oper="modify" class="btn btn-success">수정</button>
				<button type="button" data-oper="remove" class="btn btn-danger">삭제</button>
				<button type="button" data-oper="list" class="btn btn-info">목록</button>
			</div>
		</form>
	</div>
	
<%@include file="../includes/footer.jsp"%>