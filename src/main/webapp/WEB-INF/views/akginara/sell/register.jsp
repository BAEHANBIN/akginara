<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<style>
	li {
		display: inline-block;
	}
</style>

<script>
	$(function () {
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click", function(e) {
			e.preventDefault();
			var str = "";
			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
			});
			
			formObj.append(str).submit();
		});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pptx)$");
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.")
				return false;
			}
			return true;
		}
		
		function showUploadedResult(uploadResultArr) {
			
			if(!uploadResultArr || uploadResultArr.lenth == 0) {
				return;
			}
			
			var uploadUL = $(".uploadResult ul");
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				if(obj.image) {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'" + fileCallPath + "\'data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/akginara/display?fileName=" + fileCallPath + "'>";
					str += "</div></li>";
				}
			});
			
			uploadUL.append(str);
		}
		
		$(".uploadResult").on("click", "button", function(e) {
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/akginara/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					targetLi.remove();
				}
			});
		});
		
		$("input[type='file']").change(function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax ({
				url: '/akginara/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function (result) {
					showUploadedResult(result);
				}
			});
		});
	});
</script>

	<div class="container" style="margin-top:30px">
		<h2><b>글쓰기</b></h2><hr><br>
		<form action="/akginara/sell/register" method="post" role="form">
				<input type="hidden" class="form-control" name="writer" value="배씨">
			<div class="form-group">
				<label for="category">카테고리</label>
				<select class="form-control" name="category" style="width:150px">
							<option value="무관"selected>카테고리 선택</option>
							<option value="기타">기타</option>
							<option value="베이스">베이스</option>
							<option value="드럼">드럼</option>
							<option value="키보드">키보드</option>
							<option value="신디">신디</option>
							<option value="이펙터">이펙터</option>
							<option value="음향장비">음향장비</option>
				</select>
		 	</div>
			<div class="form-group">
				<label for="district">지역</label>
				<select class="form-control" name="district" style="width:150px">
							<option>지역 선택</option>
							<option value="서울">서울</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="경남">경남</option>
							<option value="경북">경북</option>
							<option value="전남">전남</option>
							<option value="전북">전북</option>
							<option value="충남">충남</option>
							<option value="충북">충북</option>
							<option value="제주">제주</option>
				</select>
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title">
			</div>
			<div class="form-group">
				<label for="price">가격</label>
				<input type="text" class="form-control" name="price">
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
				<textarea class="form-control" rows="20" cols="120" name="content"></textarea>
			</div>
			<hr>
			
			<div class="container" style="text-align: right; margin-bottom: 20px;">
				<button type="submit" class="btn btn-primary">글쓰기</button>
			</div>
		</form>
	</div>
	
<%@include file="../includes/footer.jsp"%>