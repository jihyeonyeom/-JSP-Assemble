<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../side.css">
<link rel="stylesheet" href="subPage.css">
<title>Assemble</title>
</head>
<body style="background-color: rgba(224, 224, 224, 0.2);">
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	String categoryName = null;
	if(request.getParameter("categoryName") != null) {
		categoryName = request.getParameter("categoryName");
	}
	if(categoryName == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 카테고리입니다.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<%
	if (userID == null) {
	%>
	<div class="member">
		<div class="btn-group" role="group"
			aria-label="Basic outlined example">
			<button type="button" class="btn btn-outline-primary">
				<a href="../join.jsp">회원가입</a>
			</button>
			<button type="button" class="btn btn-outline-primary">
				<a href="../login.jsp">로그인</a>
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
				<a href="../profile.jsp">프로필</a>
			</button>
			<button type="button" class="btn btn-outline-primary">
				<a href="../logoutAction.jsp">로그아웃</a>
			</button>
		</div>
	</div>
	<%
	}
	%>
	<div class="side">
		<aside>
			<p class="logo">
				<a href="../main.jsp" style="color: white;">Assemble</a>
			</p>
			<details>
				<summary>▶OTT</summary>
				<ul type="none">
					<li><a href="subOTT.jsp?categoryName=Netflix" style="color: white;">넷플릭스</a></li>
					<li><a href="subOTT.jsp?categoryName=Disney" style="color: white;">디즈니플러스</a></li>
					<li><a href="subOTT.jsp?categoryName=Watcha" style="color: white;">왓챠</a></li>
					<li><a href="subOTT.jsp?categoryName=Tving" style="color: white;">티빙</a></li>
					<li><a href="subOTT.jsp?categoryName=Wavve" style="color: white;">웨이브</a></li>
					<li><a href="subOTT.jsp?categoryName=Laftel" style="color: white;">라프텔</a></li>
				</ul>
			</details>
			<details>
				<summary>▶스포츠</summary>
				<ul type="none">
					<li><a href="subSport.jsp?categoryName=Soccer" style="color: white;">축구</a></li>
					<li><a href="subSport.jsp?categoryName=BaseBall" style="color: white;">야구</a></li>
					<li><a href="subSport.jsp?categoryName=BasketBall" style="color: white;">농구</a></li>
					<li><a href="subSport.jsp?categoryName=Golf" style="color: white;">골프</a></li>
					<li><a href="subSport.jsp?categoryName=SportETC" style="color: white;">기타</a></li>
				</ul>
			</details>
			<details>
				<summary>▶게임</summary>
				<ul type="none">
					<li><a href="subGame.jsp?categoryName=LOL" style="color: white;">리그오브레전드</a></li>
					<li><a href="subGame.jsp?categoryName=BattleGrounds" style="color: white;">배틀그라운드</a></li>
					<li><a href="subGame.jsp?categoryName=OverWatch" style="color: white;">오버워치</a></li>
					<li><a href="subGame.jsp?categoryName=SuddenAttack" style="color: white;">서든어택</a></li>
					<li><a href="subGame.jsp?categoryName=GameETC" style="color: white;">기타</a></li>
				</ul>
			</details>
			<details>
				<summary>
					<a href="subETC.jsp?categoryName=ETC" style="color: white;">▶기타</a>
				</summary>
			</details>
			<details>
				<summary>▶마이페이지</summary>
				<ul type="none">
					<li><a href="subParty.jsp" style="color: white">가입 파티 목록</a></li>
					<li><a href="../profile.jsp" style="color: white">회원 정보 수정</a></li>
				</ul>
			</details>
		</aside>
	</div>
	<div id="total">
		<div id="nav"></div>
		<div id="total-right">
			<div id="section-blank"><h1 style="margin-left: 130px; margin-top: 50px;">기 타</h1></div>
			<div id="section">
				<a href="subOTT.jsp?categoryName=Netflix"><img src="../icon/netflix.png" style="width: 64px;" alt="넷플릭스"></a>
				<a href="subOTT.jsp?categoryName=Disney"><img src="../icon/disney.png" style="width: 75px; margin-left: 6px;" alt="디즈니플러스"></a>
				<a href="subOTT.jsp?categoryName=Watcha"><img src="../icon/watcha.png" style="width: 55px; margin-left: 10px;" alt="왓챠"></a>
				<a href="subOTT.jsp?categoryName=Tving"><img src="../icon/tving.png" style="width: 55px; margin-left: 20px;" alt="티빙"></a>
				<a href="subOTT.jsp?categoryName=Wavve"><img src="../icon/wavve.png" style="width: 55px; margin-left: 20px;" alt="웨이브"></a>
				<a href="subOTT.jsp?categoryName=Laftel"><img src="../icon/laftel.png" style="width: 55px; margin-left: 20px;" alt="라프텔"></a>
				<a href="write.jsp?categoryName=<%= categoryName%>" class="btn btn-primary pull-right" 
				style="background-color: rgb(164, 214, 82); margin-left: 450px; color: white; margin-top: 23px; font-size: 20px;">글쓰기</a>
			</div>
			<div id="footer">
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber, categoryName);
					int number = 0;
					if(pageNumber * 12 > list.size()) {
						number = list.size();
					} else {
						number = pageNumber * 12;
					}
					for (int i = 0 + (pageNumber - 1) * 12; i < number; i++) {
				%>
				<ul class="party" type="none">
					<li style="height: 100%;">
						<div class="top" style="cursor: pointer; color: red;" onclick="location.href='view.jsp?partyNum=<%= list.get(i).getPartyNum()%>';"><p>기&nbsp타</p></div>
						<div class="middle" style="cursor: pointer;" onclick="location.href='view.jsp?partyNum=<%= list.get(i).getPartyNum()%>';"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
						<div class="middle-two" style="cursor: pointer;" onclick="location.href='view.jsp?partyNum=<%= list.get(i).getPartyNum()%>';"><%= "작성자 : " + list.get(i).getUserID() %></div>
						<div class="bottom" style="cursor: pointer;" onclick="location.href='view.jsp?partyNum=<%= list.get(i).getPartyNum()%>';"><%= list.get(i).getBbsDate().substring(0, 11) + "&nbsp&nbsp인원 : " + list.get(i).getNowNum() + "/" + list.get(i).getMaxNum()%></div>
					</li>
				</ul>
				<%
					} 
				%>
				<div style="width: 1100px; padding-left: 30px;">
				<%
					 if(pageNumber != 1) {
				%>
					<a href="subETC.jsp?categoryName=<%= categoryName%>&pageNumber=<%= pageNumber - 1%>" class="btn btn-success btn-arrow-left" 
					style="background-color: rgb(164, 214, 82); color: white; font-size: 20px; width: 100px;">이전</a>
				<%
					} if(list.size() - pageNumber * 12 > 0) {
				%>
					<a href="subETC.jsp?categoryName=<%= categoryName%>&pageNumber=<%= pageNumber + 1%>" class="btn btn-success btn-arrow-left" 
					style="background-color: rgb(164, 214, 82); color: white; font-size: 20px; width: 100px;">다음</a>
				<%
					}
				%>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>