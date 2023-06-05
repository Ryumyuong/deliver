<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>

<%
String s_id = request.getParameter("id") == null ? "" : request.getParameter("id").trim();
System.out.println("---"+s_id);
String sessionId = (String) session.getAttribute("sessionId");
String sql = "select s_id, p_id, s_name, s_unitPrice from products where s_id = '" + s_id + "'";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if (rs.next()) {
	String p_id = rs.getString("p_id");
	String s_name = rs.getString("s_name");
	int s_unitPrice = rs.getInt("s_unitPrice");
	sql = "insert into cart values(?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.clearParameters();
	pstmt.setString(1, s_id);
	pstmt.setString(2, s_name);
	pstmt.setInt(3, s_unitPrice);
	pstmt.setString(4, sessionId);
	pstmt.executeUpdate();

	response.sendRedirect("product.jsp?id=" + p_id);
}

if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();
%>