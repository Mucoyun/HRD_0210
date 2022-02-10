<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 25 -</title>
	<script>
		function gotry() {
			if(document.iu_form.name.value == ""){
				alert("강사명이 입력되지 않았습니다.");
				document.iu_form.name.focus();
			}else if(document.iu_form.major.value == ""){
				alert("전공이 입력되지 않았습니다.");
				document.iu_form.major.focus();
			}else if(document.iu_form.field.value == ""){
				alert("세부 전공이 입력되지 않았습니다.");
				document.iu_form.field.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			//document.iu_form.reset();
			location.href = "/HRD_0210/lecturer0210/lecturer0210_select.jsp";
			//history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_idx = request.getParameter("send_idx");
	
		String idx = "";
		String name = "";
		String major = "";
		String field = "";
		
		try{
			String sql = "select * from lecturer0210 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				idx = rs.getString(1);
				name = rs.getString(2);
				major = rs.getString(3);
				field = rs.getString(4);
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
	<section>
		<h2>강사 수정</h2>
		<form name="iu_form" method="post" action="lecturer0210_update_process.jsp">
			<table id="iu_table">
				<tr>
					<th>강사 ID</th>
					<td><input type="text" name="idx" value="<%=idx %>" readonly></td>
				</tr>
				<tr>
					<th>강 사 명</th>
					<td><input type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>전 공</th>
					<td><input type="text" name="major" value="<%=major %>"></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><input type="text" name="field" value="<%=field %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">수정</button>
						<button type="button" onclick="notry()">목록</button>
					</td>
				</tr>
			</table>
		</form>	
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>