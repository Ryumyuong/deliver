<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String id = request.getParameter("id");

	String sql = "select s_id, p_id, s_name, s_unitPrice, s_description, s_condition, s_fileName from products where s_id = '" + id + "'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		String p_id = rs.getString("p_id");
		sql = "delete from products where s_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		response.sendRedirect("product.jsp?id=" + p_id);
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