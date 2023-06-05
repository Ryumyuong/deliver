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
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>생일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입날짜</th>
				<th>비고</th>
			</tr>
				<%
					String sessionId = (String) session.getAttribute("sessionId");
					
					String sql = "select id, password, name, gender, birth, mail, phone, address, lpad(regist_day, 8) as regist_day from member2";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						String id = rs.getString("id");
				%>
				<tr>
					<td><%=id %></td>
					<td><%=rs.getString("password") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("gender") %></td>
					<td><%=rs.getString("birth") %></td>
					<td><%=rs.getString("mail") %></td>
					<td><%=rs.getString("phone") %></td>
					<td><%=rs.getString("address") %></td>
					<td><%=rs.getString("regist_day") %></td>
					<td><a href="./deleteMemberAdmin.jsp?id=<%=id %>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
		</table>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>