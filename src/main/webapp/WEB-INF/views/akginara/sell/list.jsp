<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	$(function () {
		$("#regBtn").on("click", function () {
			self.location = "/akginara/sell/register";
		});
	});
</script>

    <div class="container" style="margin-top:30px">
        <h2><b>거래하기</b></h2><br>
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
            				<c:when test="${sell.state == false}"><a href="#"><c:out value="${sell.title}"/></a></c:when>
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
    <div class="container" style="text-align: right">
        <button id="regBtn" class="btn btn-primary btn-sm">글쓰기</button>
    </div>
    <div class="container">
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
          </ul>
    </div>
    <div class="container">
        <table class="table table-borderless">
            <tr>
                <th>카테고리</th>
                <td>
                    <select>
                        <option>선택</option>
                        <option>기타</option>
                        <option>베이스</option>
                        <option>드럼</option>
                        <option>신디</option>
                        <option>키보드</option>
                        <option>각종장비</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>지역</th>
                <td>
                    <select>
                        <option>서울</option>
                        <option>대전</option>
                        <option>대구</option>
                        <option>부산</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    <select>
                        <option>제목</option>
                        <option>작성자</option>
                    </select>
                </th>
                <td>
                    <input type="text" name="search" size="20">
                    <button type="button" class="btn btn-primary btn-sm">검색</button>
                </td>
            </tr>
        </table>
    </div>
    
<%@include file="../includes/footer.jsp"%>