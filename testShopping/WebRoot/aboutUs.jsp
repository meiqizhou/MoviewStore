<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aboutUs.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">

  </head>
  
  <body background="imgs/bg.bmp">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td align="center"><jsp:include flush="true" page="head.jsp"></jsp:include></td>
    </tr>
    <tr>
      <td height="142" align="center"><table width="60%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td width="60%" align="center" bgcolor="pink" class="abc">WebSite Design: Boyang Li</td>
          </tr>
          <tr>
            <td width="60%" align="center" bgcolor="silver" class="abc">Font-end : Boyang Li; Back-end: Boyang Li; Database: Boyang Li</td>
          </tr>
          <tr>
            <td width="60%" align="center" bgcolor="pink" class="abc">email: lby1989825@gmail.com</td>
          </tr>
          <tr>
            <td width="60%" align="center" bgcolor="silver" class="abc">Phone: 1-732 322 9280</td>
          </tr>
          <tr>
            <td width="60%" align="center" bgcolor="pink">Address:289B Crowells RD, HighLand Park, NJ</td>
          </tr>
          <tr>
            <td width="60%" bgcolor="silver" align="center" valign="top"><p class="abc">Description: UML design</p>
              <p class="abc">Front-end: Dreamweaver(html + div + css)</p>
              <p class="abc">Back-end: Myeclipse + Tomcat</p>
              <p class="abc">Database: MySQL</p>
              <p class="abc">Framework: MVC design model (Java.class + JSP + Servlet)</p>
              <p class="abc">Other: Javascript, AJax</p>
              <p>&nbsp;</p></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td align="center"><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
    </tr>
  </tbody>
</table>
</body>
</html>
