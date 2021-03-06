<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 25 -</title>
	<style>
		p{
			padding: 0 !important;
			width: 1300px;
			margin: 0 auto;
		}
	</style>
	<script>
		function notry() {
			//document.iu_form.reset();
			location.href = "/HRD_0210/stud0210/stud0210_insert.jsp";
			//history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "select count(*) from stud0210";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);	
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
	<section>
		<h2>학사 정보 조회 화면</h2>
		<p id="pp">총 <%=no %>명의 학사정보가 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">학번</th>
				<th width="100">성명</th>
				<th width="100">학과</th>
				<th width="100">학년</th>
				<th width="300">주소</th>
				<th width="200">연락처</th>
				<th width="300">취미</th>
				<th width="100">구분</th>
			</tr>
			<%
				try{
					String sql = "select * from stud0210 order by studno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String studno = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String address = rs.getString(5);
						String phone = rs.getString(6);
						String hobby = rs.getString(7);
						%>
						<tr>
							<td><%=studno %></td>
							<td><%=name %></td>
							<td><%=dept %></td>
							<td><%=position %></td>
							<td><%=address %></td>
							<td><%=phone %></td>
							<td><%=hobby %></td>
							<td>
								<a href="stud0210_update.jsp?send_studno=<%=studno%>">수정</a>
								<span>|</span>
								<a href="stud0210_delete.jsp?send_studno=<%=studno%>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){ return false; }">삭제</a>
							</td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();	
				}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">학사정보 추가</button>	
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>