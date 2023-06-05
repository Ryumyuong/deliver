<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<%
	String p_id = request.getParameter("id");
	String sessionId = (String) session.getAttribute("sessionId");
	int id_num = (Integer) session.getAttribute("id_num");
	System.out.println(sessionId);
%>
<script type="text/javascript">
		function addToCart() {
			if (confirm("메뉴를 장바구니에 추가하시겠습니까?")) {
				document.addForm.submit();
			} else {		
				document.addForm.reset();
			}
		}
	
		
	</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>

	<%@ include file="dbconn.jsp"%>
	<%
		String sql = "select s_id, replace('" + p_id + "', 'P', '') as code, s_name, s_unitPrice, s_description, s_condition, s_fileName from products where p_id= '" + p_id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
		String s_id = rs.getString("s_id");
		int code = (Integer)rs.getInt("code");
	%>
 	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<span class="badge badge-success"><%=rs.getString("s_condition") %>	</span>
				<h3><%=rs.getString("s_name")%></h3>
				<p><%=rs.getString("s_description")%></p>
				<h5><%=rs.getString("s_unitprice")%>원</h5>
				<p><form name="addForm" action="./addCart.jsp?id=<%=s_id %>" method="post">
					<button class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</button> 
				</form><br>
				<c:set var="code" value="<%=code %>" />
				<c:if test="${sessionId=='admin' || code == id_num}">
					<a href="./updateProductMenu.jsp?id=<%=s_id %>" class="btn btn-secondary"> 메뉴 수정 &raquo;</a>
				</c:if>
			</div>
			<img src="./upload2/<%=rs.getString("s_filename")%>" style="width: 30%" />
		</div>
		<hr>
	</div>
	<%
		}
	%>
	<div class="container">
		<a href="./cart.jsp?id=<%=p_id%>" class="btn btn-warning"> 장바구니 &raquo;</a>
		<a href="./products.jsp" class="btn btn-secondary"> 가게 목록 &raquo;</a>
		<c:if test="${sessionId=='admin' || code == a_id}">
			<a href="./addProductMenu.jsp?id=<%=p_id %>" class="btn btn-secondary"> 메뉴 등록 &raquo;</a>
		</c:if>
	</div>
	
	<%
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>