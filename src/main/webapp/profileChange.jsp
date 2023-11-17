<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="profile.css">
<link rel="stylesheet" href="join.css">
<link rel="stylesheet" href="side.css">
<title>Assemble</title>
</head>
<body style="background-color: rgba(224,224,224,0.2)">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 안되어 있습니다.')");
			script.println("location.href = 'main.jsp'");		
			script.println("</script>");
		}
		
		UserDAO dao = new UserDAO();
		User userView = dao.profileView(user, userID);
	%>
	<div class="container" style="padding-top: 50px">
		<div class="col-xs-12 col-md-4">
			<div class="side">
				<aside>
					<p class="logo">
						<a href="main.jsp" style="color: white;">Assemble</a>
					</p>
					<details>
						<summary>▶OTT</summary>
						<ul type="none">
							<li><a href="subPage/subOTT.jsp?categoryName=Netflix" style="color: white;">넷플릭스</a></li>
							<li><a href="subPage/subOTT.jsp?categoryName=Disney" style="color: white;">디즈니플러스</a></li>
							<li><a href="subPage/subOTT.jsp?categoryName=Watcha" style="color: white;">왓챠</a></li>
							<li><a href="subPage/subOTT.jsp?categoryName=Tving" style="color: white;">티빙</a></li>
							<li><a href="subPage/subOTT.jsp?categoryName=Wavve" style="color: white;">웨이브</a></li>
							<li><a href="subPage/subOTT.jsp?categoryName=Laftel" style="color: white;">라프텔</a></li>
						</ul>
					</details>
					<details>
						<summary>▶스포츠</summary>
						<ul type="none">
							<li><a href="subPage/subSport.jsp?categoryName=Soccer" style="color: white;">축구</a></li>
							<li><a href="subPage/subSport.jsp?categoryName=BaseBall" style="color: white;">야구</a></li>
							<li><a href="subPage/subSport.jsp?categoryName=BasketBall" style="color: white;">농구</a></li>
							<li><a href="subPage/subSport.jsp?categoryName=Golf" style="color: white;">골프</a></li>
							<li><a href="subPage/subSport.jsp?categoryName=SportETC" style="color: white;">기타</a></li>
						</ul>
					</details>
					<details>
						<summary>▶게임</summary>
						<ul type="none">
							<li><a href="subPage/subGame.jsp?categoryName=LOL" style="color: white;">리그오브레전드</a></li>
							<li><a href="subPage/subGame.jsp?categoryName=BattleGrounds" style="color: white;">배틀그라운드</a></li>
							<li><a href="subPage/subGame.jsp?categoryName=OverWatch" style="color: white;">오버워치</a></li>
							<li><a href="subPage/subGame.jsp?categoryName=SuddenAttack" style="color: white;">서든어택</a></li>
							<li><a href="subPage/subGame.jsp?categoryName=GameETC" style="color: white;">기타</a></li>
						</ul>
					</details>
					<details>
						<summary>
							<a href="subPage/subETC.jsp?categoryName=ETC" style="color: white;">▶기타</a>
						</summary>
					</details>
					<details>
						<summary>▶마이페이지</summary>
						<ul type="none">
							<li><a href="subPage/subParty.jsp" style="color: white">가입 파티 목록</a></li>
							<li><a href="profile.jsp" style="color: white">회원 정보 수정</a></li>
						</ul>
					</details>
				</aside>
			</div>
		</div>
		<div class="col-xs-12 col-md-4">
			<div class="wrapper">
				<form method="post" action="profileAction.jsp">
					<div><h1>회원정보수정</h1></div>
					<div class="form-group" style="padding-top: 20px">
						<label for="userID">아이디</label>
						<input type="text" class="form-control" value="<%=userView.getUserID() %>" name="userID" readonly>
					</div>
					<div class="form-group">
						<label for="userName">이름</label>
						<input type="text" class="form-control" value="<%=userView.getUserName() %>" name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<label for="userBirth">생년월일</label>
						<div class="form-inline">
							<input type="text" class="form-control birthyy" value="<%=userView.getUserBirthyy() %>" name="userBirthyy" maxlength="4">
							<select class="form-control birthmm" name="userBirthmm">
							<option value="<%=userView.getUserBirthmm() %>" hidden><%=userView.getUserBirthmm() %></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							</select>
							<input type="text" class="form-control birthdd" value="<%=userView.getUserBirthdd() %>" name="userBirthdd" maxlength="2">
						</div>
					</div>
					<div class="form-group">
						<label for="userPhone">전화번호</label>
						<input type="tel" class="form-control" value="<%=userView.getUserPhone() %>" name="userPhone" maxlength="12">
					</div>
					<div class="form-group">
						<label for="userPassword">비밀번호확인</label>
						<input type="password" class="form-control" placeholder="내용을 입력해주세요." name="userPassword" maxlength="20">
					</div>
					<div style="padding-top: 10px">
						<input type="submit" id="submit" class="form-control submit" value="수정하기">
					</div>
				</form>
			</div>
		</div>
		<div class="col-xs-12 col-md-4">
				<div class="member">
					<div class="btn-group" role="group">
	            		<button type="button" class="btn btn-outline-primary"><a href="profile.jsp">프로필</a></button>
	            		<button type="button" class="btn btn-outline-primary"><a href="logoutAction.jsp">로그아웃</a></button>
	       			</div>
	    		</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>