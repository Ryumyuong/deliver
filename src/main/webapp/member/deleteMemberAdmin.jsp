<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String id = request.getParameter("id");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="webmarket" password="webmarket" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member2 WHERE id = ?
   <sql:param value="<%=id%>" />
   
</sql:update>
<sql:update dataSource="${dataSource}" >
	alter sequence member_seq increment by -1
</sql:update>
<sql:update dataSource="${dataSource}" >
	select member_seq.nextval from dual
</sql:update>
<sql:update dataSource="${dataSource}" >
	alter sequence member_seq increment by 1
</sql:update>
<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp" />
</c:if>