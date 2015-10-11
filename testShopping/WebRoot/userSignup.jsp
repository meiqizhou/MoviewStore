<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String error = (String) request.getAttribute("error");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userSignup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">

  </head>
  
<body background="imgs/bg.bmp">
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td align="center"><jsp:include flush="true" page="head.jsp"></jsp:include></td>
    </tr>
    <form action="SignupCIServlet">
    <%
    	if(error != null) {
    		if(error.equals("usernameexist")) {
    			%><tr><td align="center"><font color="red" class="abc">User name has been registed!</font></td></tr><%
    		}
    		else if(error.equals("emailexist")) {
    			%><tr><td align="center"><font color="red" class="abc">Email has been registed!</font></td></tr><%
    		}
    		else if(error.equals("passwordformat")) {
    			%><tr><td align="center"><font color="red" class="abc">Password must contain digit and letters!</font></td></tr><%
    		}
    		else if(error.equals("lessItem")) {
    			%><tr><td align="center"><font color="red" class="abc">Blank marked * must be filled!</font></td></tr><%
    		}
    		else {
    			%><tr><td align="center"><font color="red" class="abc">Sorry! Sign up failed!</font></td></tr><%
    		}
    	}
     %>
    <tr>
      <td align="center"><table width="42%" height="280" border="1" align="center" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td colspan="2" align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="imgs/signup.png" width="58" height="55" alt=""/>&nbsp;&nbsp;&nbsp;&nbsp;<span class="def">&nbsp;&nbsp;&nbsp;Sign up</span></td>
            </tr>
          <tr>
            <td width="33%" align="right" class="abc"><font color="red">*</font>username:&nbsp;</td>
            <td width="67%" align="left" class="abc">&nbsp;<input name="username" type="text" size="40" maxlength="50"></td>
          </tr>
          <tr>
            <td align="right" class="abc"><font color="red">*</font>password:&nbsp;</td>
            <td align="left" class="abc">&nbsp;<input type="password" name="password" size="40" maxlength="50"></td>
          </tr>
          <tr>
            <td align="right" class="abc"><font color="red">*</font>truename:&nbsp;</td>
            <td align="left" class="abc">&nbsp;<input type="text" name="truename" size="40" maxlength="50"></td>
          </tr>
          <tr>
            <td align="right" class="abc"><font color="red">*</font>email:&nbsp;</td>
            <td align="left" class="abc">&nbsp;<input type="text" name="email" size="40" maxlength="50"></td>
          </tr>
          <tr>
            <td align="right" class="abc"><font color="red">*</font>phone:&nbsp;</td>
            <td align="left" class="abc">&nbsp;<input type="text" name="phone" size="40" maxlength="50"></td>
          </tr>
          <tr>
            <td align="right" class="abc"><font color="red">*</font>address:&nbsp;</td>
            <td align="left" class="abc">&nbsp;<input type="text" name="address" size="40" maxlength="50"></td>
          </tr>
          <tr>
            <td align="right" class="abc"><font color="red">*</font>zipcode:&nbsp;</td>
            <td align="left" class="abc">&nbsp;<input type="text" name="zipcode" size="40" maxlength="50"></td>
          </tr>
<tr>
  <td colspan="2" align="center"><input type="submit" class="abc" value="submit">&nbsp;&nbsp;&nbsp;<input type="reset" class="abc" value="reset"></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    </form>
    <tr>
      <td align="center"><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
    </tr>
  </tbody>
</table>
</body>
</html>        		