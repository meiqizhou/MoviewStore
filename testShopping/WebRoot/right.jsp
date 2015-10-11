<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	GoodsBeanBo gbb = new GoodsBeanBo();
	int pageNow = 1;
	String pageNow_String = (String) request.getAttribute("pageNow");
	if(pageNow_String != null) {
		pageNow = Integer.parseInt(pageNow_String);
	}
	String type = (String) request.getAttribute("type");
	List<GoodsBean> list = new ArrayList<GoodsBean>();
	if(type == null) {
		list = gbb.getGoodsByPage(6, pageNow);
	}
	else {
		list = gbb.getMovieByPageNowAndType(type, 6, pageNow);
	}
	int pageCount = gbb.getPageCount(6);
%>

<table width="97%" border="0" cellpadding="0" cellspacing="0" class="abc">
  <tbody>
    <tr>
      <td colspan="3"><img src="imgs/logo7.png" width="332" height="37" alt=""/></td>
    </tr>
    <%
    	for(int i = 0; i < 2; i++) {
    		%>
    		<tr>
    		<%
    		for(int j = 0; j < 3; j++) {
    			if(3 * i + j >= list.size()) {
    				%>
    				<td width="33%" height="300"><table width="342" border="0" cellspacing="0" cellpadding="0">
        			<tbody>
          			<tr>
           			<td width="171" height="200" rowspan="2"><img src="imgs/null.jpg" width="171" height="200" alt=""/></a></td>
            		<td width="171" height="100" align="center" class="abc">No Books</td>
          			</tr>
          			<tr>
            		<td height="100" align="center" class="abc">Prices:USD 0.00</td>
          			</tr>
          			<tr>
           			<td height="100" colspan="2" align="left" class="abc">Description:No description</td>
          			</tr>
        			</tbody>
      				</table></td>
    				<%    				
    			}
    			else {
    				GoodsBean gb = list.get(3 * i + j);
    				String goodsId = gb.getGoodsId();
    				String photo = gb.getPhoto();
    				String goodsName = gb.getGoodsName();
    				float price = gb.getGoodsPrice();
    				String goodsInfo = gb.getGoodsInfo();
    				%>
    				<td width="33%" height="300"><table width="342" border="0" cellspacing="0" cellpadding="0">
        			<tbody>
          			<tr>
           			<td width="171" height="200" rowspan="2"><a href="ShowGoodsCIServlet?flag=showdetail&goodsId=<%=gb.getGoodsId()%>"><img src="imgs/<%=photo%>" width="171" height="200" alt=""/></a></td>
            		<td width="171" height="100" align="center" class="abc"><a href="ShowGoodsCIServlet?flag=showdetail&goodsId=<%=gb.getGoodsId()%>"><%=goodsName%></a></td>
          			</tr>
          			<tr>
            		<td height="100" align="center" class="abc">Prices:<%=price%>0</td>
          			</tr>
          			<tr>
           			<td height="100" colspan="2" align="left" class="abc">Description:<%=goodsInfo%></td>
          			</tr>
        			</tbody>
      				</table></td>
    				<%
    			}
   			}
   			%></tr><%
   			if(i == 0) {
   				%>
   				<tr><td colspan="3" height="10" bgcolor="#FFDDDE"></td></tr>
   				<%
   			}
    	}
     %>
    
    <tr>
    <td colspan="3" align="center">
    	<%
    		if(pageNow != 1) {
    			if(type == null) {
    				%>
    				<a href="ShowGoodsCIServlet?flag=fenye&pageNow=<%=pageNow - 1%>">prev</a>
    				<%
    			}
    			else {
    				%>
    				<a href="ShowGoodsCIServlet?flag=fenye&type=<%=type%>&pageNow=<%=pageNow - 1%>">prev</a>
    				<%
    			}
    		}
   	 	%>
      	<%
      		for(int i = pageNow; i <= pageNow + 2 && i <= pageCount; i++) {
      			if(type == null) {
      				%>
      				<a href="ShowGoodsCIServlet?flag=fenye&pageNow=<%=i%>">[<%=i%>] </a>  		
      				<%
      			}
      			else {
      				%>
      				<a href="ShowGoodsCIServlet?flag=fenye&type=<%=type%>&pageNow=<%=i%>">[<%=i%>] </a>  		
      				<%
      			}
      	}
       	%>
       	<%
       		if(pageNow != pageCount) {
       			if(type == null) {
       				%>
       				<a href="ShowGoodsCIServlet?flag=fenye&pageNow=<%=pageNow + 1%>">next</a>
       				<%
       			}
       			else {
       				%>
       				<a href="ShowGoodsCIServlet?flag=fenye&type=<%=type%>&pageNow=<%=pageNow + 1%>">next</a>
       				<%
       			}
       		}
       	 %>
    </td>
    </tr>
  </tbody>
</table>
