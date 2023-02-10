<%@page import="java.util.List"%>
<%@page import="com.ict.edu.VO"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String m_idx = request.getParameter("m_idx");
	WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
	DAO dao = (DAO) context.getBean("dao"); /* 가로안에 id */
	List<VO> list = dao.getOneList(m_idx);
	pageContext.setAttribute("vo", list.get(0));
	%>
	<h1>상세 보기 페이지</h1>
	<h2>
		<ul>
			<li>${vo.m_id}</li>
			<li>${vo.m_name}</li>			
			<li>${vo.m_addr}</li>
			<li>${vo.m_reg}</li>
			<li><button onclick="delete_go()">삭제</button></li>
			<!-- li 태그도 공부하자 -->
		</ul>
	</h2>
	<!-- 왜 스크립트가 여기있겠어  -->
	<!-- delete_go()를 실행시키면 자바 문이 실행되어야 하는데
        순번으로 보았을때 여기 있지 않고 위에 있으면 
        m_idx를 못가지고 갈수도 있어  -->
	<script type="text/javascript">
		function delete_go() {
			location.href = "delete.jsp?m_idx=${vo.m_idx}";
		}
	</script>
</body>
</html>