<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="bbsOpenChat" />
<jsp:setProperty name="bbs" property="maxNum" />
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
	String categoryName = null;
	if(request.getParameter("categoryName") != null) {
		categoryName = (String) request.getParameter("categoryName");
	}
	if(categoryName == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 카테고리입니다.')");
		script.println("location.href = '../main.jsp'");		
		script.println("</script>");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = '../login.jsp'");		
		script.println("</script>");
	} else {
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null
				|| bbs.getBbsOpenChat() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getBbsOpenChat(), bbs.getMaxNum(), categoryName);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				int result2 = bbsDAO.makeParty(userID);
				if (result2 == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
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
	}
	%>
</body>
</html>