<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息表</title>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>考生信息表</p>
	</div>
	<div class="search_content">
		<form action="student!list" method="post" >
			<table align="center">
				<tr>
					<td><label>准考证号:</label></td>
					<td><input type="text" id="s_id" name="s_student.id" value="${s_student.id}" class="form-control"></td>
					<td>&nbsp;</td>
					<td><label>姓名:</label></td>
					<td><input type="text" id="s_name" name="s_student.name" value="${s_student.name}" class="form-control"></td>
					<td><button type="submit" class="btn btn-primary">查询</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
			    <th>序号</th>
				<th>准考证号</th>
				<th>姓名</th>
				<th>专业</th>
				<th>性别</th>
			</tr>
			<c:forEach var="student" items="${studentList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${student.cardNo}</td>
					<td>${student.name}</td>
					<td>${student.prefession}</td>
					<td>${student.sex}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<ul class="pagination">
			${pageCode}
		</ul>
	</div>

</div>
</body>
</html>