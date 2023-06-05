<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/dbconn.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원정보</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	<div class="container">
		<%
			String sessionId = (String) session.getAttribute("sessionId");
			String sql = "select id, password, name, gender, birth, mail, phone, address, lpad(regist_day, 8) as regist_day from member2 where id = '" + sessionId + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
		%>
			<p>아이디 : <%=rs.getString("id") %></p>
			<p>비밀번호 : <%=rs.getString("password") %></p>
			<p>이름 : <%=rs.getString("name") %></p>
			<p>성별 : <%=rs.getString("gender") %></p>
			<p>생일 : <%=rs.getString("birth") %></p>
			<p>이메일 : <%=rs.getString("mail") %></p>
			<p>전화번호 : <%=rs.getString("phone") %></p>
			<p>주소 : <%=rs.getString("address") %></p>
			<p>가입날짜 : <%=rs.getString("regist_day") %></p>
		
		<%
			}
		%>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>