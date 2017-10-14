<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function logout(){
		if(confirm("您确定要退出系统吗？")){
			window.location.href="student!logout";
		}
	}
	
	function logout2(){
		if(confirm("您确定要退出系统吗？")){
			window.location.href="manager!logout";
		}
	}
</script>
</head>
<body>
<div class="navbar navbar-default">
	<div class="container-fluid">
		<a class="navbar-brand" href="main.jsp">首页</a>
		<ul class="nav navbar-nav">
			<c:choose>
				<c:when test="${currentUser.flag==2}">
					<li><a href="${pageContext.request.contextPath }/paper!list">在线考试</a></li>
					<li><a href="${pageContext.request.contextPath }/exam!getExams?s_exam.student.id=${currentUser.id}">成绩查询</a></li>
					<li><a href="${pageContext.request.contextPath }/student!preUpdatePassword">修改密码</a></li>
					<li><a href="javascript:logout()">退出系统</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/student!list">考生信息管理</a></li>
					<li><a href="${pageContext.request.contextPath }/exam!list">考生成绩查询</a></li>
					<li><a href="${pageContext.request.contextPath }/paper!paperList">试卷管理</a></li>
					<li><a href="${pageContext.request.contextPath }/question!list">题目管理</a></li>
					<li><a href="javascript:logout2()">退出系统</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
</body>
</html>