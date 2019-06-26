<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
<body>
<script type="text/javascript">

//방명록 삭제
function deleteGuestbook(){
	var guestbookNo = ${no};
	alert(guestbookNo)
	var guestbookPassword = $('#input-password').val();
	$.ajax({
		url:"${pageContext.servletContext.contextPath }/guestbook/api/delete?no="+guestbookNo+"&password="+guestbookPassword,
		type:"get",
		dataType:"json",
		//guestbookList 반환
		success:function(response){
			if(response.result != 'success'){
				alert('ajax failure >> check again');
				$('#input-password').focus();
				return false;
			}
			//flag = 'false' >> 삭제 X
			if(response.data.flag == 'false'){
				alert('guestbook write failure >> check again');
				$('#input-password').focus();
				return false;
			}
			var guestbookList = response.data.guestbookList;
			//innerHTML
			var htmls = '';
			for(var i=0;i<guestbookList.length;i++){
				var gvo = guestbookList[i];
				htmls += '<li data-no="">';
                htmls += '<strong>'+gvo.name+'</strong>';
                htmls += '<p>'+gvo.contents+'</p>';
                htmls += '<a href="javascript:deleteGuestbook('+gvo.no+')" data-no="">삭제</a>';
            	htmls += '</li>';
			}
			$('#list-guestbook').html(htmls);
		}
	})
}

</script>
	<div id="container">
		<c:import url='/WEB-INF/views/includes/header.jsp'/>
		<div id="content">
			<div id="guestbook" class="delete-form">
				<div>
					<label>비밀번호</label>
					<input type="password" name="password" id="input-password" placeholder="비밀번호">
					<input type="submit" value="확인" onclick="deleteGuestbook()">
				</div>
				<!-- /mysite1/guestbook 으로 이동 -->
				<a href="${pageContext.servletContext.contextPath }/guestbook">방명록 목록</a>
			</div>
		</div>
		<c:import url='/WEB-INF/views/includes/navigation.jsp'>
			<c:param name="menu" value="guestbook"/>
		</c:import>
		<c:import url='/WEB-INF/views/includes/footer.jsp'/>
	</div>
</body>
</html>