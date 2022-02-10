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
			width: 1000px;
			margin: 0 auto;
		}
	</style>
	<script>
		function notry() {
			//document.iu_form.reset();
			location.href = "/HRD_0210/subject0210/subject0210_insert.jsp";
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
			String sql = "select count(*) from subject0210";
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
		<h2>교과목 목록</h2>
		<p id="pp">총 <%=no %>개의 교과목이 있습니다.</p>
		<table id="s_table">
			<tr>
				<th width="100">과목코드</th>
				<th width="300">과목명</th>
				<th width="100">학점</th>
				<th width="100">담당강사</th>
				<th width="100">요일</th>
				<th width="100">시작시간</th>
				<th width="100">종료시간</th>
				<th width="100">구분</th>
			</tr>
			<%
				try{
					String sql = "select * from subject0210 order by id asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String name = rs.getString(2);
						String credit = rs.getString(3);
						String lecturer = rs.getString(4);
						String week = rs.getString(5);
						String start_hour = rs.getString(6);
						String end_end = rs.getString(7);
						%>
						<tr>
							<td><%=id %></td>
							<td><%=name %></td>
							<td><%=credit %></td>
							<td><%=lecturer %></td>
							<td><%=week %></td>
							<td><%=start_hour %></td>
							<td><%=end_end %></td>
							<td>
								<a href="subject0210_update.jsp?send_id=<%=id%>">수정</a>
								<span>|</span>
								<a href="subject0210_delete.jsp?send_id=<%=id%>"
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
		<button id="btn" type="button" onclick="notry()">작성</button>	
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>