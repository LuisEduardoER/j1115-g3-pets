<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'orderlist.jsp' starting page</title>
	<script type="text/javascript">
		function del(){
			var b = false;
			var chks = document.delForm.orders;
			for(i=0;i<chks.length;i++){
				if(chks[i].checked)
					b = true;
			}
			if(b){
				if(confirm("您是否要删除")){
					return true;
				}else{
					return false;
				}
			}else{
				alert("请选择要删除的选项");
				return false;
			}
			}
	</script>
  </head>
  
  <body>
    <form action="/petshop/delOrderList.do" method="post" name="delForm" onsubmit="return del()">
    <table border="1" width="80%" style="border-collapse: collapse;">
    		<tr>
    			<th>选择</th>
    			<th>订单编号</th>
    			<th>用户编号</th>
    			<th>订单时间</th>
    			<th>收货人</th>
    			<th>送货地址</th>
    			<th>收货人电话</th>
    			<th>付款方式</th>
    			<th>订单状态</th>
    			<th>操作</th>
    		</tr>
			<logic:present name="allorderlist" scope="request">
				<logic:iterate id="orderlist" name="allorderlist" indexId="i">
				<tr>
					<td><input type='checkbox' name='orders' value='${allorderlist[i].oid }' ></td>
					<td><bean:write name="orderlist" property="oid" /></td>
					<td><bean:write name="orderlist" property="uid" /></td>
					<td><bean:write name="orderlist" property="otime" /></td>
					<td><bean:write name="orderlist" property="oreceiver" /></td>
					<td><bean:write name="orderlist" property="oaddress" /></td>
					<td><bean:write name="orderlist" property="ophone" /></td>
					<td><bean:write name="orderlist" property="otype" /></td>
					<td>
					<logic:equal value="0" name="orderlist" property="ostate">未发货</logic:equal>
					<logic:equal value="1" name="orderlist" property="ostate">已付款</logic:equal>
					<logic:equal value="2" name="orderlist" property="ostate">已确认收货</logic:equal>
					</td>
					<td><a href="modOrder.do?oid=${allorderlist[i].oid }">修改</a></td>
				</tr>
				</logic:iterate>
			</logic:present>
			<tr>
				<td colspan="8" align="center">
					<a href="showAllOrder.do?nowPage=0">首页</a>
    				<a href="showAllOrder.do?nowPage=${page-1 }">上一页</a>
    				<a href="showAllOrder.do?nowPage=${page+1 }">下一页</a>
    				<a href="showAllOrder.do?nowPage=${endPage }">尾页</a><br/>
				</td>
			</tr>
    </table>
    <html:submit value="删除"></html:submit>
 </form>
  </body>
</html>
