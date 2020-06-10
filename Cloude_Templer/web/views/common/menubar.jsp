<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath }/views/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>


.inputinfo {
	margin: 0 auto !important;
}

.navi > li > ul{
	display:none !important;
}

.navi > li:hover > ul{
	display: block !important;
} 




ul li ul li:hover{
	background-color:red !important;
}
</style>

</head>
<body>
<header id="menu">
		<div id="logo">
			<a href="${contextPath}/amateur.master" class="logo">
				<img src="${contextPath }/views/img/logo-02.png">
			</a>
		</div>
		<ul class="navi">
			<li><a href="${contextPath }/views/about/about.jsp">ABOUT</a></li>
			<li><a href="${contextPath }/list.po">STORE</a></li >
			<li><a href="#">COMMUNITY</a>
				<ul>
					<li><a href="${contextPath }/list.am">아마추어 게시판</a></li>
					<li><a href="${contextPath }/list.ee">자유게시판</a></li>
				</ul></li>
			<li><a href="#">NOTICE</a>
				<ul>
					<li><a href="${contextPath }/list.no">공지사항</a></li>
					<li><a href="${contextPath }/list.in">1:1문의</a></li>
				</ul></li>
				</ul>
		<div id="loginWrap" >
			
			<ul class="navi">

			<a href="${contextPath }/views/member/login.jsp"class="icon1"><!-- class=icon1 무엇? -->
			<img src="${contextPath }/views/img/login2.png"  style="width:30px; "></a>
			</ul>
			</div>
				</header>	


</body>
</html>