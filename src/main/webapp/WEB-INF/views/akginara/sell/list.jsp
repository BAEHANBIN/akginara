<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<style>
	#wrap {
		text-align: center;
	}
</style>

<script>
	$(function () {
		var result = "<c:out value='${result}'/>";
		checkModal(result);
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function () {
			self.location = "/akginara/sell/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".page-item a").on("click", function (e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$("#amount_Select").on("change", function (e) {
			actionForm.submit();
		});
		
		$(".move").on("click", function (e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/akginara/sell/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("#type option:selected").val()) {
				alert("검색종류를 선택하세요!");
				return false;
			}
			
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요!")
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
</script>

    <div class="container" style="margin-top:30px">
        <h2><b>거래하기</b></h2><br>
        <div style="text-align: right; margin-bottom: 20px;">
	        <form action="/akginara/sell/list" method="get" id="actionForm">
		    	<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>">
		    	<%-- <input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}'/>"> --%>
		    	<select class="btn btn-default" id="amount_Select" name="amount">
											<option value="10" <c:out value="${pageMaker.cri.amount == 10 ? 'selected' : ''}"/>>10개씩 보기</option>
											<option value="15" <c:out value="${pageMaker.cri.amount == 15 ? 'selected' : ''}"/>>15개씩 보기</option>
											<option value="20" <c:out value="${pageMaker.cri.amount == 20 ? 'selected' : ''}"/>>20개씩 보기</option>
											<option value="25" <c:out value="${pageMaker.cri.amount == 25 ? 'selected' : ''}"/>>25개씩 보기</option>
											<option value="30" <c:out value="${pageMaker.cri.amount == 30 ? 'selected' : ''}"/>>30개씩 보기</option>
				</select>
		    </form>
	   	</div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th style="width:60px; text-align: center">번호</th>
                    <th style="width:90px; text-align: center">거래상태</th>
                    <th style="width:450px; text-align: center" align="center">제목</th>
                    <th style="width:100px; text-align: center">가격</th>
                    <th style="width:100px; text-align: center">아이디</th>
                    <th style="width:90px; text-align: center">지역</th>
                    <th style="width:100px; text-align: center">등록일</th>
                    <th style="width:60px; text-align: center">조회</th>
                </tr>
            </thead>
            
            <c:forEach items="${list}" var="sell">
            	<tr>
            		<td style="text-align: center"><c:out value="${sell.bno}"/></td>
            		<td style="text-align: center">
            			<c:choose>
            				<c:when test="${sell.state == true}">판매완료</c:when>
            				<c:when test="${sell.state == false}">판매중</c:when>
            			</c:choose>
            		</td>
            		<td>
            			<c:choose>
            				<c:when test="${sell.state == true}"><strike><c:out value="${sell.title}"/></strike></c:when>
            				<c:when test="${sell.state == false}"><a class="move" href="<c:out value='${sell.bno}'/>"><c:out value="${sell.title}"/></a></c:when>
            			</c:choose>
            		</td>
            		<td style="text-align: center"><c:out value="${sell.price}"/></td>
            		<td style="text-align: center"><c:out value="${sell.writer}"/></td>
            		<td style="text-align: center"><c:out value="${sell.district}"/></td>
            		<td style="text-align: center"><fmt:formatDate pattern="MM-dd" value="${sell.regdate}"/></td>
            		<td style="text-align: center"><c:out value="${sell.count}"/></td>
            </c:forEach>
        </table>
    </div>
    <hr>
    <div class="container" style="text-align: right">
        <button id="regBtn" class="btn btn-primary btn-sm">글쓰기</button>
    </div>
    
    <!-- Paging -->
    <div class="container">
        <ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href='<c:out value="${pageMaker.firstPage}"/>'>처음</a></li>
			</c:if>
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href='<c:out value="${pageMaker.startPage - 1}"/>'>이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}"><a class="page-link" href='<c:out value="${num}"/>'>${num}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="page-item"><a class="page-link" href="<c:out value='${pageMaker.endPage + 1}'/>">다음</a></li>
			</c:if>
			<c:if test="${pageMaker.next}">
				<li class="page-item"><a class="page-link" href="<c:out value='${pageMaker.lastPage}'/>">마지막</a></li>
			</c:if>
		</ul>
	</div>
	
	<form id="searchForm" action="/akginara/sell/list" method="get">
		<table class="table table-borderless" style="width: 500px; margin-left: auto; margin-right: auto;">
			<tr>
				<th>카테고리</th>
				<td>
					<select class="form-control" name="category" style="width:150px">
							<option value="" <c:out value="${pageMaker.cri.category == null ? 'selected' : ''}"/>>카테고리 선택</option>
							<option value="기타" <c:out value="${pageMaker.cri.category == '기타' ? 'selected' : ''}"/>>기타</option>
							<option value="베이스" <c:out value="${pageMaker.cri.category == '베이스' ? 'selected' : ''}"/>>베이스</option>
							<option value="드럼" <c:out value="${pageMaker.cri.category == '드럼' ? 'selected' : ''}"/>>드럼</option>
							<option value="키보드" <c:out value="${pageMaker.cri.category == '키보드' ? 'selected' : ''}"/>>키보드</option>
							<option value="신디" <c:out value="${pageMaker.cri.category == '신디' ? 'selected' : ''}"/>>신디</option>
							<option value="이펙터" <c:out value="${pageMaker.cri.category == '이펙터' ? 'selected' : ''}"/>>이펙터</option>
							<option value="음향장비" <c:out value="${pageMaker.cri.category == '음향장비' ? 'selected' : ''}"/>>음향장비</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select class="form-control" name="district" style="width:150px">
							<option value="" <c:out value="${pageMaker.cri.district == null ? 'selected' : ''}"/>>카테고리 선택</option>
							<option value="서울" <c:out value="${pageMaker.cri.district == '서울' ? 'selected' : ''}"/>>서울</option>
							<option value="대전" <c:out value="${pageMaker.cri.district == '대전' ? 'selected' : ''}"/>>대전</option>
							<option value="대구" <c:out value="${pageMaker.cri.district == '대구' ? 'selected' : ''}"/>>대구</option>
							<option value="울산" <c:out value="${pageMaker.cri.district == '울산' ? 'selected' : ''}"/>>울산</option>
							<option value="부산" <c:out value="${pageMaker.cri.district == '부산' ? 'selected' : ''}"/>>부산</option>
							<option value="경기" <c:out value="${pageMaker.cri.district == '경기' ? 'selected' : ''}"/>>경기</option>
							<option value="강원" <c:out value="${pageMaker.cri.district == '강원' ? 'selected' : ''}"/>>강원</option>
							<option value="경남" <c:out value="${pageMaker.cri.district == '경남' ? 'selected' : ''}"/>>경남</option>
							<option value="경북" <c:out value="${pageMaker.cri.district == '경북' ? 'selected' : ''}"/>>경북</option>
							<option value="전남" <c:out value="${pageMaker.cri.district == '전남' ? 'selected' : ''}"/>>전남</option>
							<option value="전북" <c:out value="${pageMaker.cri.district == '전북' ? 'selected' : ''}"/>>전북</option>
							<option value="충남" <c:out value="${pageMaker.cri.district == '충남' ? 'selected' : ''}"/>>충남</option>
							<option value="충북" <c:out value="${pageMaker.cri.district == '충북' ? 'selected' : ''}"/>>충북</option>
							<option value="제주" <c:out value="${pageMaker.cri.district == '제주' ? 'selected' : ''}"/>>제주</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>
					<select name="type" id="type">
						<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>선택</option>
						<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}"/>>제목
						<option value="C" <c:out value="${pageMaker.cri.type == 'C' ? 'selected' : ''}"/>>내용</option>
						<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected' : ''}"/>>작성자</option>
						<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected' : ''}"/>>제목 or 내용</option>
						<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected' : ''}"/>>제목 or 작성자</option>
						<option value="TWC" <c:out value="${pageMaker.cri.type == 'TWC' ? 'selected' : ''}"/>>제목 or 내용 or 작성자</option>
					</select>
				</th>
				<td>
					<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>">
		    		<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}'/>">
					<input type="text" name="keyword" size="20">
					<button class="btn btn-primary btn-sm">검색</button>
				</td>
			</tr>
		</table>
	</form>
	
    
   	<!-- Modal Add  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">메시지</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">글 처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">닫기</button>
				</div>
			</div>
		</div>
	</div>
    
<%@include file="../includes/footer.jsp"%>