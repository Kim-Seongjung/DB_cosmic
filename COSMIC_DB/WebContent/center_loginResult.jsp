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
	<%=name%> �� �ȳ��ϼ��� <br/><br/> 
	<a href="planet/planet_search.jsp">�༺ ���� �˻�</a><br/>
	<a href="planet/planet_enroll.jsp">�༺ ���� ���</a><br/>
	<a href="planet/planet_modify.jsp">�༺ ���� ����</a><br/>
	<a href="planet/planet_delete.jsp">�༺ ���� ����</a><br/>
	<br/><br/>
	<a href="ship/ship_enroll.jsp">���ּ��ۼ� ���� ��� </a><br/>
	<a href="ship/ship_search.jsp">���ּ��ۼ� ���� �˻�</a><br/>
	<a href="ship/ship_modify.jsp">���ּ��ۼ� ���� ���� </a><br/>
	<a href="ship/ship_delete.jsp">���ּ��ۼ� ���� ���� </a><br/>
	<br/><br/>
	<a href="join_page.html">���� ����</a><br/>
	<a href="joinResult.jsp">���� �ӹ� �Ҵ�</a><br/>
	<a href="crew/crew_search.jsp">���� ���� �˻�</a><br/>
	<a href="crew/crew_modify.jsp">���� ���� ���� </a><br/>
	<a href="crew/crew_delete.jsp">���� ����  ���� </a><br/>
	<br/><br/>
	<a href="join_page.html">�� ���� ���</a><br/>
	<a href="client/client_search.html">�� ���� �˻�</a><br/>
	<a href="client/client_modify.jsp">�� ���� ���� </a><br/>
	<a href="client/client_delete.jsp">�� ���� ���� </a><br/>
	<br/><br/>
	
</body>
</html>

