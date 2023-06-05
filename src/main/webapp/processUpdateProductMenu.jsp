<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "upload2";
	System.out.println("경로확인---->"+realFolder);
	String encType = "utf-8";
	int maxSize = 5 * 1024 * 1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String condition = multi.getParameter("condition");
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	String id = request.getParameter("id");
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "select s_id, p_id, s_name, s_unitPrice, s_description, s_condition, s_fileName from products where s_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		if(fileName != null) {
			sql = "UPDATE products SET s_id=?, s_name=?, s_unitPrice=?, s_description=?, s_condition=?, s_fileName=? where s_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, description);
			pstmt.setString(5, condition);
			pstmt.setString(6, fileName);
			pstmt.setString(7, id);
			pstmt.executeUpdate();
		}
		else {
			sql = "UPDATE products SET s_id=?, s_name=?, s_unitPrice=?, s_description=?, s_condition=?, s_fileName=? where s_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, description);
			pstmt.setString(5, condition);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		}
	}
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("products.jsp");
%>