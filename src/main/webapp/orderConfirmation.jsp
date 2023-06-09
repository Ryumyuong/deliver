<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cartId = session.getId();
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			if(n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			if(n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			if(n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			if(n.equals("Shipping_zipCode"))
				shipping_zipCode= URLDecoder.decode(thisCookie.getValue(), "utf-8");
			if(n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %> <br>
				우편번호 : <% out.println(shipping_zipCode); %> <br>
				주소 : <% out.println(shipping_addressName); %>
					(<% out.println(shipping_country); %>) <br>
			</div>
			<div class="col-4" align="right">
				<p> <em>배송일: <% out.println(shipping_shippingDate); %></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">물품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					String p_id = request.getParameter("id");
					String sql = "select s_id, s_name, s_unitPrice, c_id, count(s_id) as num, count(s_id) * s_unitprice as cost from cart where c_id= '" + p_id + "' group by s_id, s_name, s_unitprice, c_id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					int total = 0;
					while(rs.next()) {
						int cost = rs.getInt("cost");
						
						total += cost;
				%>
				<tr>
					<td class = "text-center"><em><%=rs.getString("s_name") %></em></td>
					<td class = "text-center"><%=rs.getInt("num") %></td>
					<td class = "text-center"><%=rs.getString("s_unitPrice") %></td>
					<td class = "text-center"><%=total %></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><%=total %></strong></td>
				</tr>
			</table>
			
			<a href="./shippingInfo.jsp?id=<%=p_id %>" class="btn btn-secondary" role="button"> 이전 </a>
			<a href="./thankCustomer.jsp?cartId=<%=shipping_cartId %>" class="btn btn-success" role="button"> 주문 완료 </a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
		</div>
	</div>
</body>
</html>