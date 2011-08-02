<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品信息</title>
	<script type="text/javascript">
		function go(){
			location.href="admin/addnewGoods.jsp"
		}
		function del(){
			var b = false;
			var chks = document.delForm.goods;
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

  <form action="/delGoodsInfo" method="post" name="delForm" onsubmit="return del()">
    <table border="1" width="80%" style="border-collapse: collapse;">
    		<tr>
    			<th>选择</th>
    			<th>商品编码</th>
    			<th>分类编码</th>
    			<th>商品名称</th>
    			<th>商品价格</th>
    			<th>剩余数量</th>
    			<th>购买过的人数</th>
    			<th>商品评分</th>
    			<th>商品简介</th>
    			<th>操作</th>
    		</tr>
			<logic:present name="allgoodslist" scope="request">
				<logic:iterate id="goodslist" name="allgoodslist" indexId="i">
				<tr>
					<td><input type='checkbox' name='goods' value='${allgoodslist[i].gid }' ></td>
					<td><bean:write name="goodslist" property="gid" /></td>
					<td><bean:write name="goodslist" property="cid" /></td>
					<td><bean:write name="goodslist" property="gname" /></td>
					<td><bean:write name="goodslist" property="gprice" /></td>
					<td><bean:write name="goodslist" property="gnum" /></td>
					<td><bean:write name="goodslist" property="gsold" /></td>
					<td><bean:write name="goodslist" property="gscore" /></td>
					<td><bean:write name="goodslist" property="gbrief" /></td>
					<td><a href="getGoodsInfo.do?gid=${allgoodslist[i].gid }">修改</a></td>
				</tr>
				</logic:iterate>
			</logic:present>
			<tr>
				<td colspan="8" align="center">
					<a href="showAllGoods.do?nowPage=0">首页</a>
    				<a href="showAllGoods.do?nowPage=${page-1 }">上一页</a>
    				<a href="showAllGoods.do?nowPage=${page+1 }">下一页</a>
    				<a href="showAllGoods.do?nowPage=${endPage }">尾页</a><br/>
				</td>
			</tr>
    </table>
    <html:button property="addGoods" value="新增" onclick="go()"></html:button>
    <html:submit value="删除"></html:submit>
 </form>
  </body>
</html>
