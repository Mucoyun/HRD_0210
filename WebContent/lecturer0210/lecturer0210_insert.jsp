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
		int idx = 0;
		try{
			String sql = "select max(idx) from lecturer0210";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				idx = rs.getInt(1);
				idx++;
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
	<section>
		<h2>강사추가</h2>
		<form name="iu_form" method="post" action="lecturer0210_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>강사 ID</th>
					<td><input type="text" name="idx" value="<%=idx %>" readonly>자동증가(마지막번호+1)</td>
				</tr>
				<tr>
					<th>강 사 명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전 공</th>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><input type="text" name="field"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">목록</button>
					</td>
				</tr>
			</table>
		</form>	
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>