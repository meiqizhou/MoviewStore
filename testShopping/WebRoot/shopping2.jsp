<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String error = (String) request.getAttribute("error");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopping2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">
	

  </head>
  
  <body background="imgs/bg.bmp">
    <table width="100%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td><jsp:include flush="true" page="head.jsp"></jsp:include></td>
  <tr>
    <td colspan="6" align="center"><img src="imgs/cartnavi-2.gif" width="599" height="49" alt=""/></td>
  </tr>
    <%
    if(error != null) {
    	if(error.equals("error1")) {
  		%>
   		<tr>
    	<td colspan="6" align="center"><font color="red">username or password wrong!</font></td>
  		</tr>		
  		<%
  		}
    }
   %>
    <tr>
      <td>
      <table width="26%" border="1" align="center" cellpadding="0" cellspacing="0" class="abc">
  <tbody>
    <tr bgcolor="#FFFE63">
      <td colspan="2" align="center" bgcolor="#FFFFFF" class="abc"><img src="imgs/dl.gif" width="183" height="63" alt=""/></td>
    </tr>
    <form action="LoginCIServlet">
    <tr>
      <td width="37%" height="47" align="right">username:&nbsp;</td>
      <td width="63%" align="left">&nbsp;<input name="username" type="text" size="25" maxlength="50" >      </td>
    </tr>
    <tr>
      <td height="53" align="right">password:&nbsp;</td>
      <td align="left">&nbsp;<input type="password" size="25" maxlength="50" name="password">      </td>
    </tr>
    <tr>
      <td height="57" colspan="2" align="center"><input type="submit" class="abc" value="submit">&nbsp;&nbsp;&nbsp;<a href="userSignup.jsp"><input type="button" class="abc" value="signup"></a></td>
    </tr>
    </form>
  </table>
      </td>
    </tr>
    <tr><td align="right"><img src="imgs/cartnext.gif" width="87" height="19" alt=""/></td><tr>
    <tr>
      <td><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
    </tr>
  </tbody>
</table>
  </body>
</html>
