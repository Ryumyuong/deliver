<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class = "navbar navbar-expand navbar-dark bg-dark">
	<div class = "container">
		<div class = "navbar-header">
			<a class = "navbar-brand" href="<c:url value="/products.jsp"/>">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId }">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp" />">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/addMember.jsp" />">회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color:white"><a style="color:white" href="<c:url value="/member/memberInformation.jsp"/>" >[<%=sessionId %>님]</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp" />">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp" />">회원 수정</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${sessionId=='admin'}">
					<li class="nav-item"><a class="nav-link" href="<c:url value="/member/memberList.jsp"/>">회원 목록</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/addProduct.jsp"/>">가게 등록</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/editProduct.jsp?edit=update"/>">가게 수정</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="/editProduct.jsp?edit=delete"/>">가게 삭제</a></li>
				</c:if>
					<li class="nav-item"><a href="<c:url value="/BoardListAction.do?pageNum=1"/>" class="nav-link">리뷰</a></li>
			</ul>
		</div>
	</div>	
</nav>
