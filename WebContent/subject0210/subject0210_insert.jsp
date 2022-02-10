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
			document.iu_form.reset();
			//location.href = "";
			//history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>교과목추가</h2>
		<form name="iu_form" method="post" action="subject0210_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>과 목 명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>학 점</th>
					<td><input type="text" name="credit"></td>
				</tr>
				<tr>
					<th>담 당 강 사</th>
					<td>
						<select name="lecturer">
							<option value="" selected>담당강사 선택</option>
							<option value="1">김교수</option>
							<option value="2">이교수</option>
							<option value="3">박교수</option>
							<option value="4">우교수</option>
							<option value="5">최교수</option>
							<option value="6">강교수</option>
							<option value="7">황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" name="week" value="1"> 월
						<input type="radio" name="week" value="2"> 화
						<input type="radio" name="week" value="3"> 수
						<input type="radio" name="week" value="4"> 목
						<input type="radio" name="week" value="5"> 금
						<input type="radio" name="week" value="6"> 토
					</td>
				</tr>
				<tr>
					<th>시 작</th>
					<td><input type="text" name="start_hour" maxlength="4"></td>
				</tr>
				<tr>
					<th>종 료</th>
					<td><input type="text" name="end_end" maxlength="4"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form>	
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>