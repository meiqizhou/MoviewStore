<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">

  </head>

<body background="imgs/bg.bmp">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="abc">
  <tbody>
    <tr>
      <td colspan="2" align="center">
      <jsp:include flush="true" page="head.jsp"></jsp:include>
      </td>
    </tr>
    <tr>
      <td width="30%">
      <jsp:include flush="true" page="left.jsp"></jsp:include>
      </td>
      <td width="70%">
      <jsp:include flush="true" page="right.jsp"></jsp:include>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
      <jsp:include flush="true" page="tail.jsp"></jsp:include>
      </td>
    </tr>
  </tbody>
</table>
</body>
</html>
