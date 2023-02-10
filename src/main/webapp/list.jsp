<%@page import="com.ict.edu.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.edu.DAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		WebApplicationContext context =
		WebApplicationContextUtils.getWebApplicationContext(application);
		// DAO 를쓰자 가져오자!
		DAO dao = (DAO)context.getBean("dao");
		//리스트를 담아줘야한다  dao 겟리스트!가져오기
		List<VO> list = dao.getList();
		//저장해주자
		pageContext.setAttribute("list", list);
		
	
	//() application 외우기 
	
	%>
	<h2>전체 보기</h2>
	<h3>
		<table>
			<thead>
				<tr><th>번호</th><th>아이디</th><!-- <th>이름</th><th>주소</th><th>날짜</th></tr> -->
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${empty list }">
			<tr><td colspan="5">원하는 자료가 존재 하지 않습니다</td></tr>
			</c:when>
			<c:otherwise>
			<c:forEach var ="k" items="${list }" varStatus="vs">
			<tr>
					<td>${vs.count}</td>
					<!-- 누를떈 m_idx 를 가져가라  -->
					<td><a href="onelist.jsp?m_idx=${k.m_idx}">${k.m_id}</td>
					<%-- <td>${k.m_name}</td>
					<td>${k.m_addr}</td>
					<td>${k.m_reg}</td> --%>
			
			</tr>
			
			</c:forEach>
			</c:otherwise>
			</c:choose>
			
			</tbody>
		</table>
	</h3>
	
		
		

</body>
</html>