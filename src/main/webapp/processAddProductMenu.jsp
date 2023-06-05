<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = getServletContext().getRealPath("/") + "upload2";
	
	
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
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
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String id = request.getParameter("id");
	String sql = "insert into products values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, id);
	pstmt.setString(3, name);
	pstmt.setInt(4, price);
	pstmt.setString(5, description);
	pstmt.setString(6, condition);
	pstmt.setString(7, fileName);
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	response.sendRedirect("products.jsp?");
%>