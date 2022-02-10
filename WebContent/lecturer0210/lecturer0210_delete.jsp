<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 25 -</title>
	
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String send_idx = request.getParameter("send_idx");
		
		try{
			String sql = "delete from lecturer0210 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_idx);
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다.");
				location.href = "/HRD_0210/lecturer0210/lecturer0210_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
</body>
</html>