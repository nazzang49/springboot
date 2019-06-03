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
<link href="${pageContext.servletContext.contextPath }/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="user">
			
				<form id="join-form" name="joinForm" method="post" action="${pageContext.servletContext.contextPath }/user">
				<input type="hidden" name="a" value="join">
					<label class="block-label" for="name">이름</label>
					<input id="name" name="name" type="text" value="">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<input type="button" value="id 중복체크">
					<label class="block-label">패스워드</label>
					<input name="pw" type="password" value="">
					
					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="여성" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="남성">
					</fieldset>
					
					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관 동의</label>
					</fieldset>
					<input type="submit" value="가입">
				</form>
			</div>
		</div>
	</div>
</body>
</html>