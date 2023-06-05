<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="/dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String sql = "select id_num from member2 where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		session.setAttribute("id_num", rs.getInt("id_num"));
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="webmarket" password="webmarket" />

<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT * FROM MEMBER2 WHERE ID=? and password=?  
	<sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>
<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2" />
</c:forEach>

<c:redirect url="loginMember.jsp?error=1" />