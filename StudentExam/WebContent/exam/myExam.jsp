<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="data_list"> 
	<div class="data_info">
		<p>${currentUser.name }&nbsp;成绩列表</p>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th>序号</th>
				<th>试卷名称</th>
				<th>考试日期</th>
				<th>单选题得分</th>
				<th>多选题得分</th>
				<th>总分</th>
			</tr>
			<c:forEach var="exam" items="${examList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${exam.paper.paperName }</td>
					<td><fmt:formatDate value="${exam.examDate }" type="date" pattern="yyyy-MM-dd"/></td>
					<td>${exam.singleScore }</td>
					<td>${exam.moreScore }</td>
					<td><font color="red">${exam.score }</font></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>		
		<ul class="pagination" >
			${pageCode}
		</ul>
		
	</div>
</div>
</body>
</html>