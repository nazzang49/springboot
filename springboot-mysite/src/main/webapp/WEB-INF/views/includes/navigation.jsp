<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="navigation">
	<ul>
		<c:choose>
			<c:when test='${param.menu == "main" }'>
				<li class="selected"><a href="${pageContext.servletContext.contextPath }">안대혁</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook">방명록</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook/timeline">방명록 AJAX</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/gallery">갤러리</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/board">게시판</a></li>
			</c:when>
			<c:when test='${param.menu == "guestbook" }'>
				<li><a href="${pageContext.servletContext.contextPath }">안대혁</a></li>
				<li class="selected"><a href="${pageContext.servletContext.contextPath }/guestbook">방명록</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook/timeline">방명록 AJAX</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/gallery">갤러리</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/board">게시판</a></li>
			</c:when>
			<c:when test='${param.menu == "board" }'>
				<li><a href="${pageContext.servletContext.contextPath }">안대혁</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook">방명록</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook/timeline">방명록 AJAX</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/gallery">갤러리</a></li>
				<li class="selected"><a href="${pageContext.servletContext.contextPath }/board">게시판</a></li>
			</c:when>
			<c:when test='${param.menu == "timeline" }'>
				<li><a href="${pageContext.servletContext.contextPath }">안대혁</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook">방명록</a></li>
				<li class="selected"><a href="${pageContext.servletContext.contextPath }/guestbook/timeline">방명록 AJAX</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/gallery">갤러리</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/board">게시판</a></li>
			</c:when>
			<c:when test='${param.menu == "gallery" }'>
				<li><a href="${pageContext.servletContext.contextPath }">안대혁</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook">방명록</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/guestbook/timeline">방명록 AJAX</a></li>
				<li class="selected"><a href="${pageContext.servletContext.contextPath }/gallery">갤러리</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/board">게시판</a></li>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
	</ul>
</div>