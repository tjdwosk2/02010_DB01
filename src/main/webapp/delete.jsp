<%@page import="com.ict.edu.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.edu.DAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
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
			WebApplicationContext context =
			WebApplicationContextUtils.getWebApplicationContext(application);
			// DAO 를쓰자 가져오자!
			DAO dao = (DAO)context.getBean("dao");
			int result = dao.getDelete(m_idx);
			
			pageContext.setAttribute("result", result);
			
			

	%>
		<h1> 삭제 화면 </h1>
		<script type="text/javascript">
		if (${result} ==1) {
			alert("삭제 성공");
			location.href = "list.jsp";
		}else{
			alert("삭제 실패");
			return;
		}
		</script>
		<p><a href="list.jsp">다시 메인으로</a></p>
</body>
</html>