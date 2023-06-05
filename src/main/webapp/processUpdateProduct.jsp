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
	String manufacturer = multi.getParameter("manufacturer");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "select p_id, p_name, p_manufacturer, p_fileName from store where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		if(fileName != null) {
			sql = "UPDATE store SET p_name=?, p_manufacturer=?, p_fileName=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, manufacturer);
			pstmt.setString(3, fileName);
			pstmt.setString(4, productId);
			pstmt.executeUpdate();
		}
		else {
			sql = "UPDATE store SET p_name=?, p_manufacturer=?, p_fileName=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, manufacturer);
			pstmt.setString(3, productId);
			pstmt.executeUpdate();
		}
	}
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>