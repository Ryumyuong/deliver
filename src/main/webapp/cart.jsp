<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="dbconn.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>장바구니</title>
<% 
	String sessionId = (String) session.getAttribute("sessionId");
	String p_id = request.getParameter("id");
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?id=<%=p_id %>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?id=<%=p_id %>" class="btn btn-success">주문하기	</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					String sql = "select s_id, s_name, s_unitPrice, c_id, count(s_id) as num, count(s_id) * s_unitprice as cost from cart where c_id= '" + sessionId + "' group by s_id, s_name, s_unitprice, c_id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					int total = 0;
					while(rs.next()) {
						String s_id = rs.getString("s_id");
						int cost= rs.getInt("cost");
						String c_id = rs.getString("c_id");
				%>
				<c:set var="c_id" value="<%=c_id %>" />
				<c:if test="${sessionId == c_id}">
				<tr>
					<td><%=rs.getString("s_name")%></td>
					<td><%=rs.getString("s_unitPrice")%></td>
					<td><%=rs.getInt("num")%></td>
					<td><%=cost%></td>
					<td><a href="./removeCart.jsp?id=<%=s_id%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					total += cost;
				%>
				</c:if>
				<%	
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=total %></th>
					<th></th>
				</tr>
			</table>
			<a href="./product.jsp?id=<%=p_id %>" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>