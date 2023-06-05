<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
	<meta charset="UTF-8">
	<title>가게 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container" style="text-align:center">
			<a href="./welcome.jsp" class="badge badge-success"><img src="./upload2/배민1.jpg" style="width:55%"></a>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				String sql = "select p_id, p_name, p_manufacturer, p_fileName from store";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String p_id = rs.getString("p_id");
			%>
			<div class="col-md-5">
				<p> <a href="./product.jsp?id=<%=p_id %>">
						<img src="./upload2/<%=rs.getString("p_fileName") %>" style="width:100%">
					</a>
				<h3><%=rs.getString("p_name") %></h3>
			</div>
			<%
				}
			%>
			<%
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>