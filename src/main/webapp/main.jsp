<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="home.css">
<title>Assemble</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<%
	if (userID == null) {
	%>
	<div class="member">
		<div class="btn-group" role="group"
			aria-label="Basic outlined example">
			<button type="button" class="btn btn-outline-primary">
				<a href="join.jsp">회원가입</a>
			</button>
			<button type="button" class="btn btn-outline-primary">
				<a href="login.jsp">로그인</a>
			</button>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="member">
		<div class="btn-group" role="group"
			aria-label="Basic outlined example">
			<button type="button" class="btn btn-outline-primary">
				<a href="profile.jsp">프로필</a>
			</button>
			<button type="button" class="btn btn-outline-primary">
				<a href="logoutAction.jsp">로그아웃</a>
			</button>
		</div>
	</div>
	<%
	}
	%>
	<div style="padding-top: 110px;">
		<p class="logo">ASSEMBLE</p>
	</div>
	<div class="container">
		<a href="subPage/subOTT.jsp?categoryName=Netflix">
			<div class="menu">
				<div class="over">넷플릭스, 디즈니플러스, 왓챠, 티빙 ㆍㆍㆍ</div>
				<img class="icon" src="./icon/ott.png" alt="ott icon" width="120px">
				<p class="title">OTT</p>
			</div>
		</a> <a href="subPage/subSport.jsp?categoryName=Soccer">
			<div class="menu">
				<div class="over">축구, 야구, 농구, 골프 , 기타 스포츠 ㆍㆍㆍ</div>
				<img class="icon" src="./icon/sports.png" alt="sports icon"
					width="120px">
				<p class="title">스포츠</p>
			</div>
		</a> <a href="subPage/subGame.jsp?categoryName=LOL">
			<div class="menu">
				<div class="over">리그오브레전드, 배틀그라운드, 오버워치 ㆍㆍㆍ</div>
				<img class="icon" src="./icon/game.png" alt="game icon"
					width="120px">
				<p class="title">게임</p>
			</div>
		</a> <a href="subPage/subETC.jsp?categoryName=ETC">
			<div class="menu">
				<div class="over">여러 분야에서 파티원을 구해보세요!</div>
				<img class="icon" src="./icon/etc.png" alt="etc icon" width="120px">
				<p class="title">기타</p>
			</div>
		</a>
	</div>
	<footer>
		<div class="container">
			<div class="footer">
				<ul>
					<li>그룹 소개</li>
					<li>서비스 이용약관</li>
					<li>개인정보처리 방책</li>
				</ul>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>