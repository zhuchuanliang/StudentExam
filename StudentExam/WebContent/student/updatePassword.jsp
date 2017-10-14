<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<script type="text/javascript">
function checkForm(){
	var oldPassword=$("#oldPassword").val();
	var newPassword=$("#newPassword").val();
	var newPassword2=$("#newPassword2").val();
	if(oldPassword==null||oldPassword==""){
		alert("请输入原密码！");
		return false;
	}
	if(oldPassword!='${currentUser.password}'){
		alert("原密码错误，请重新输入！");
		return false;
	}
	if(newPassword==null||newPassword==""){
		alert("请输入新密码！");
		return false;
	}
	if(newPassword2==null||newPassword2==""){
		alert("请输入确认新密码！");
		return false;
	}
	if(newPassword!=newPassword2){
		alert("新密码与确认密码不相同，请重新输入！");
		return false;
	}
	return true;
}

function reset(){
	$("#oldPassword").val()="";
	$("#newPassword").val()="";
	$("#newPassword2").val()="";
}
</script>
</head>
<body>
<div class="data_list">
	<div class="data_info">
		<p>修改个人密码</p>
	</div>
	<div class="data_content" align="center" >
		<form action="student!updatePassword" method="post" onsubmit="return checkForm()">
			<table align="center">
				<tr>
					<td><label>用户名:</label></td>
					<td>
						<input type="text" class="form-control" value="${currentUser.id}" name="student.id" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td><label>原密码:</label></td>
					<td>
						<input type="password" class="form-control" id="oldPassword">
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td><label>新密码:</label></td>
					<td>
						<input type="password" class="form-control" id="newPassword" name="student.password">
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td><label>确认新密码:</label></td>
					<td>
						<input type="password" class="form-control" id="newPassword2">
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr align="right">
					<td>
						<button type="submit" class="btn btn-primary">保存</button>
					</td>
					<td>
						<button type="button" class="btn btn-primary" onclick="reset()">重置</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>