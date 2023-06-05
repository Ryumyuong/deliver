<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
	<meta charset="UTF-8">
	<title>메뉴 수정</title>
	<script type="text/javascript">
		function deleteConfirm(id) {
			if (confirm("해당 상품을 삭제합니다!!") == true)
				location.href="./deleteProductMenu.jsp?id=" + id;
			else
				return;
		}
	</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">메뉴 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
	
		String sql = "select s_id, p_id, s_name, s_unitPrice, s_description, s_fileName from products where s_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String s_filename = rs.getString("s_filename");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload2/<%=s_filename %>" alt="image" style="width:100%" />
			</div>
			<div class="col-md-7">
				<form name="newProductMenu" action="./processUpdateProductMenu.jsp?id=<%=rs.getString("s_id") %>" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2"> 상품 코드 </label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("s_id") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"> 상품명 </label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("s_name") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"> 가격 </label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getString("s_unitPrice") %>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"> 상세 설명 </label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("s_description") %></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"> 상태 </label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New " checked> 신제품
							<input type="radio" name="condition" value="Old "> 일반 제품
							<input type="radio" name="condition" value="Recommendation "> 추천 제품
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"> 이미지 </label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
							<a href="#" onclick="deleteConfirm('<%=id %>')" class="btn btn-danger" role="button"> 삭제 &raquo;></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
		
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	%>
</body>
</html>