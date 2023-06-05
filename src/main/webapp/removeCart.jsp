<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String id = request.getParameter("id");
	String sessionId = (String) session.getAttribute("sessionId");
	String sql = "select s_id, s_name, s_unitPrice, c_id from cart where s_id = '" + id + "'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "delete from cart where s_id = ? and c_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, sessionId);
		pstmt.executeUpdate();
		response.sendRedirect("cart.jsp?id=" + rs.getString("c_id"));
	}
	else
		out.println("일치하는 상품이 없습니다");
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
%>