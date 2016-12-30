<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 
 <%! String name , id ,pw ,type ; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
	
	name= (String)session.getAttribute("name");
	id = (String) session.getAttribute("id");
	pw= (String) session.getAttribute("pw");
	type=(String) session.getAttribute("type");
	%>
	<%=type%>  
	<%=name%> 님 안녕하세요 <br/><br/> 
	<a href="planet/planet_search.jsp">행성 정보 검색</a><br/>
	<a href="planet/planet_enroll.jsp">행성 정보 등록</a><br/>
	<a href="planet/planet_modify.jsp">행성 정보 수정</a><br/>
	<a href="planet/planet_delete.jsp">행성 정보 삭제</a><br/>
	<br/><br/>
	<a href="ship/ship_enroll.jsp">우주수송선 정보 등록 </a><br/>
	<a href="ship/ship_search.jsp">우주수송선 정보 검색</a><br/>
	<a href="ship/ship_modify.jsp">우주수송선 정보 수정 </a><br/>
	<a href="ship/ship_delete.jsp">우주수송선 정보 삭제 </a><br/>
	<br/><br/>
	<a href="join_page.html">선원 가입</a><br/>
	<a href="joinResult.jsp">선원 임무 할당</a><br/>
	<a href="crew/crew_search.jsp">선원 정보 검색</a><br/>
	<a href="crew/crew_modify.jsp">선원 정보 수정 </a><br/>
	<a href="crew/crew_delete.jsp">선원 정보  삭제 </a><br/>
	<br/><br/>
	<a href="join_page.html">고객 정보 등록</a><br/>
	<a href="client/client_search.html">고객 정보 검색</a><br/>
	<a href="client/client_modify.jsp">고객 정보 수정 </a><br/>
	<a href="client/client_delete.jsp">고객 정보 삭제 </a><br/>
	<br/><br/>
	
</body>
</html>

