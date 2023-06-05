<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String productId = request.getParameter("id");

	String sql = "select p_id, p_name, p_manufacturer, p_fileName from store";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "delete from store where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	}
	else
		out.println("일치하는 가게가 없습니다");
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>