<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="data_list">
		<div class="data_content">
			<form action="paper!getDetailPaper" method="post" onsubmit="return checkForm()">
				<table width="40%" align="center">
					<tr>
						<td><label><strong>请选择考试试卷</strong></label></td>
						<td>
							<select id="paperId" name="paperId" class="form-control">
								<option value="">请选择...</option>
								<c:forEach var="paper" items="${paperList}">
									<option value="${paper.id}">${paper.paperName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
			 		<td colspan="2">&nbsp;</td>
			 	</tr>
			 	<tr>
			 		<td>
			 			<input type="submit" class="btn btn-primary" value="确定">
			 		</td>
			 		<td>
			 			<input type="button" class="btn btn-primary" value="返回" onclick="javascript:history.back()">
			 		</td>
			 	</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>