<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function paperDelete(paperId){
		if(confirm("确定要删除这条记录吗？")){
			$.post("paper!deletePaper",{paperId:paperId},function(result){
				var result=$.parseJSON(result);
				if(result.error){			
					alert(result.error);				
				}else{				
					alert("删除成功！");
					window.location.href="${pageContext.request.contextPath}/paper!paperList";
				}
			});
		}
	}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<P>试卷管理</P>
	</div>
	<div class="search_content">
		<button style="float: right;margin-bottom:8px;" type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='paper!preSave'">添加试卷</button>
	</div>
	<div class="data_content">
		<table class="table table-hover table-bordered">
			<tr>
				<th>序号</th>
				<th>试卷名称</th>
				<th>添加日期</th>
				<th>操作</th>
			</tr>
			<c:forEach  var="paper" items="${paperList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${paper.paperName}</td>
					<td><fmt:formatDate value="${paper.joinDate}" type="date" pattern="yyyy-MM-dd"/></td>
					<td><button type="button" class="btn btn-info btn-sm" onclick="javascript:window.location='paper!preSave?paperId=${paper.id}'">修改</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="paperDelete('${paper.id}')">删除</button></td>
				</tr>
			</c:forEach>		
		</table>
	</div>
</div>
</body>
</html>