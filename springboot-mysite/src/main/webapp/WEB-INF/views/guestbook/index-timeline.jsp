<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>mysite</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/guestbook-ajax.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/lightbox.js"></script>
    <link href="${pageContext.request.contextPath }/assets/css/lightbox.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
<script type="text/javascript">
	
	//간단 유효성 검사 + ajax
	function writeGuestbook(){
		var guestbookName = $('#input-name').val();
		var guestbookPassword = $('#input-password').val();
		var guestbookContents = $('#tx-contents').val();
		
		//입력값 X >> return false
		if(guestbookName == ''){
			alert('이름 입력 필수')
			$('#input-name').focus();
			return false;
		}
		if(guestbookPassword == ''){
			alert('비밀번호 입력 필수')
			$('#input-password').focus();
			return false;
		}
		if(guestbookContents == ''){
			alert('내용 입력 필수')
			$('#tx-contents').focus();
			return false;
		}
		
		$.ajax({
			url:"${pageContext.servletContext.contextPath }/guestbook/api/write?name="+guestbookName+"&password="+guestbookPassword+"&contents="+guestbookContents,
			type:"get",
			dataType:"json",
			//guestbookList 반환
			success:function(response){
				if(response.result != 'success'){
					alert('ajax failure >> check again');
					$('#input-name').focus();
					return false;
				}
				//guestbookList.length == 0 >> 등록 X
				if(response.data == null){
					alert('guestbook write failure >> check again');
					$('#input-name').focus();
					return false;
				}
				var guestbookList = response.data;
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
	
	$(function(){
		
		//방명록 삭제 다이얼 로그
		var dialogUpload = $("#dialog-delete-form").dialog({
			autoOpen: false,
			height: 280,
			width: 300,
			modal: true,
			buttons: {
				"삭제": function() {
					$("#dialog-delete-form form").submit();
					$(this).dialog("close");
				},
				"취소" : function() {
					$(this).dialog("close");
				}
			},
			close: function() {
				$("#dialog-delete-form form").get(0).reset();	
			}
		});
			
		$("#list-guestbook a").click(function(event) {
			event.preventDefault();
			dialogUpload.dialog("open");
		});
	});
</script>
    <div id="container">
        <c:import url="/WEB-INF/views/includes/header.jsp" />
        <div id="content">
            <div id="guestbook">
                <h1>방명록</h1>
                <!-- 유효성 검사 + ajax -->
                <div id="add-form">
                    <input type="text" id="input-name" placeholder="이름">
                    <input type="password" id="input-password" placeholder="비밀번호">
                    <textarea id="tx-contents" placeholder="내용"></textarea>
                    <input type="submit" value="입력" onclick="writeGuestbook()"/>
                </div>
                <ul id="list-guestbook">
                	<c:forEach items="${guestbookList}" var="gvo">
                    <li data-no=''>
                        <strong>${gvo.name}</strong>
                        <p>${gvo.contents}</p>
                        <a href='' data-no=''>삭제</a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="dialog-delete-form" title="방명록 삭제" style="display:none">
                <p class="validateTips normal">비밀번호 확인 후 삭제</p>
                <p class="validateTips error" style="display:none">비밀번호 확인 실패</p>
                <form>
                    <input type="password" id="password-delete" value="" class="text ui-widget-content ui-corner-all">
                    <input type="hidden" id="hidden-no" value="guestbook-timeline">
                    <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
                </form>
            </div>
            <div id="dialog-message" title="" style="display:none">
                <p></p>
            </div>
        </div>
        <c:import url="/WEB-INF/views/includes/navigation.jsp">
            <c:param name="menu" value="timeline" />
        </c:import>
        <c:import url="/WEB-INF/views/includes/footer.jsp" />
    </div>
</body>
</html>