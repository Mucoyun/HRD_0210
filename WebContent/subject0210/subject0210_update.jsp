<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 25 -</title>
	<script>
		function gotry() {
			if(document.iu_form.id.value == ""){
				alert("교과목 코드가 입력되지 않았습니다.");
				document.iu_form.id.focus();
			}else if(document.iu_form.name.value == ""){
				alert("교과목명이 입력되지 않았습니다.");
				document.iu_form.name.focus();
			}else if(document.iu_form.credit.value == ""){
				alert("학점이 입력되지 않았습니다.");
				document.iu_form.credit.focus();
			}else if(document.iu_form.lecturer.value == ""){
				alert("담당강사가 입력되지 않았습니다.");
				document.iu_form.lecturer.focus();
			}else if(document.iu_form.week.value == ""){
				alert("요일이 입력되지 않았습니다.");
				document.iu_form.week.focus();
			}else if(document.iu_form.start_hour.value == ""){
				alert("시작시간이 입력되지 않았습니다.");
				document.iu_form.start_hour.focus();
			}else if(document.iu_form.end_end.value == ""){
				alert("종료시간이 입력되지 않았습니다.");
				document.iu_form.end_end.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			//document.iu_form.reset();
			location.href = "/HRD_0210/subject0210/subject0210_select.jsp";
			//history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
		
		String id = "";
		String name = "";
		String credit = "";
		String lecturer = "";
		String week = "";
		String start_hour = "";
		String end_end = "";
		
		try{
			String sql = "select * from subject0210 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				name = rs.getString(2);
				credit = rs.getString(3);
				lecturer = rs.getString(4);
				week = rs.getString(5);
				start_hour = rs.getString(6);
				end_end = rs.getString(7);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>교과목 수정</h2>
		<form name="iu_form" method="post" action="subject0210_update_process.jsp">
			<table id="iu_table">
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<th>과 목 명</th>
					<td><input type="text" name="name" value="<%=name %>" ></td>
				</tr>
				<tr>
					<th>학 점</th>
					<td><input type="text" name="credit" value="<%=credit %>" ></td>
				</tr>
				<tr>
					<th>담 당 강 사</th>
					<td>
						<select name="lecturer">
							<option value="" <%if(lecturer.equals("")){%> selected <%} %>>담당강사 선택</option>
							<option value="1" <%if(lecturer.equals("1")){%> selected <%} %>>김교수</option>
							<option value="2" <%if(lecturer.equals("2")){%> selected <%} %>>이교수</option>
							<option value="3" <%if(lecturer.equals("3")){%> selected <%} %>>박교수</option>
							<option value="4" <%if(lecturer.equals("4")){%> selected <%} %>>우교수</option>
							<option value="5" <%if(lecturer.equals("5")){%> selected <%} %>>최교수</option>
							<option value="6" <%if(lecturer.equals("6")){%> selected <%} %>>강교수</option>
							<option value="7" <%if(lecturer.equals("7")){%> selected <%} %>>황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" name="week" value="1" <%if(week.equals("1")){%> checked <%} %>> 월
						<input type="radio" name="week" value="2" <%if(week.equals("2")){%> checked <%} %>> 화
						<input type="radio" name="week" value="3" <%if(week.equals("3")){%> checked <%} %>> 수
						<input type="radio" name="week" value="4" <%if(week.equals("4")){%> checked <%} %>> 목
						<input type="radio" name="week" value="5" <%if(week.equals("5")){%> checked <%} %>> 금
						<input type="radio" name="week" value="6" <%if(week.equals("6")){%> checked <%} %>> 토
					</td>
				</tr>
				<tr>
					<th>시 작</th>
					<td><input type="text" name="start_hour" maxlength="4" value="<%=start_hour %>" ></td>
				</tr>
				<tr>
					<th>종 료</th>
					<td><input type="text" name="end_end" maxlength="4" value="<%=end_end %>" ></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="notry()">목록</button>
						<button type="button" onclick="gotry()">수정</button>
					</td>
				</tr>
			</table>
		</form>	
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>