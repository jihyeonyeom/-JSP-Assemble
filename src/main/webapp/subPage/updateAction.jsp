<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Assemble</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = '../login.jsp'");		
		script.println("</script>");
	}
	int partyNum = 0;
	if(request.getParameter("partyNum") != null) {
		partyNum = Integer.parseInt(request.getParameter("partyNum"));
	}
	int maxNum = 0;
	if(request.getParameter("maxNum") != null) {
		maxNum = Integer.parseInt(request.getParameter("maxNum"));
	}
	if(maxNum == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('모집 인원수가 입력이 안됐습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	if(partyNum == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시물이 존재하지 않습니다.')");
		script.println("location.href='../main.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(partyNum);
	if(!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	} else {
		if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsOpenChat") == null || request.getParameter("bbsTitle").equals("")
				|| request.getParameter("bbsContent").equals("") || request.getParameter("bbsOpenChat").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.update(partyNum, request.getParameter("bbsTitle"), request.getParameter("bbsContent"), request.getParameter("bbsOpenChat"), maxNum);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'subOTT.jsp?categoryName=Netflix'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>