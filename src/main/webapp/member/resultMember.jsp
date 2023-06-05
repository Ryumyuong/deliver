<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>로그인</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0")) {
					%>
					<div class="jumbotron">
						<div class="container">
							<h1 class="display-3">회원 정보 수정</h1>
						</div>
					</div>
					<div class="container" align="center">
					<%
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
					%>
					</div>
					<%
				}
				else if (msg.equals("1")) {
					%>
					<div class="jumbotron">
						<div class="container">
							<h1 class="display-3">회원 가입 완료</h1>
						</div>
					</div>
					<div class="container" align="center">
					<%
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
					%>
					</div>
					<%
				}
				else if (msg.equals("2")) {
					%>
					<div class="jumbotron">
						<div class="container">
							<h1 class="display-3">로그인 완료</h1>
						</div>
					</div>
					<div class="container" align="center">
					<%
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
					%>
					</div>
					<%
				}				
			} else {
				%>
				<div class="jumbotron">
					<div class="container">
						<h1 class="display-3">회원 탈퇴</h1>
					</div>
				</div>
				<div class="container" align="center">
				<%
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
				%>
				</div>
				<%
			}
		%>	
</body>
</html>