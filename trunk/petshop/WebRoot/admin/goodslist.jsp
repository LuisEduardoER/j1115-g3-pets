<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/taglib/common.jsp"%>

<script type="text/javascript">
	function go(){
		location.href="/petshop/getPCategoryMap.do"
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

<style>
<!--
*{
	font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
	font-size: 12px;
}
.admingoodsinfo{
	padding-top:15px;
}
.admingoodsinfo a{
	font-weight:600;
	text-decoration:none;
	color:#69C;
}
.admingoodsinfo a:visited{
	color:#69C;
}
.admingoodsinfo a:hover{
	color:#333;
}
.admingoodsinfo table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.admingoodsinfo td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.admingoodsinfo tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.admingoodsinfo th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}

-->
</style>
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />
<hr/>
<div class="admingoodsinfo">
	<form action="/petshop/delGoodsInfo.do" method="post" name="delForm" onsubmit="return del()" >
		<table border="0" width="100%">
			<tr>
				<th width="14px">选择</th>
				<th width="56px">商品编码</th>
				<th width="28px">分类编码</th>
				<th>商品名称</th>
				<th width="56px">商品价格</th>
				<th width="28px">剩余数量</th>
				<th width="42px">购买过的人数</th>
				<th width="28px">商品评分</th>
				<th>商品简介</th>
				<th width="30px">操作</th>
			</tr>
			<logic:present name="allgoodslist" scope="request">
				<logic:iterate id="goodslist" name="allgoodslist" indexId="i">
					<tr>
						<td><input type='checkbox' name='goods' value='${allgoodslist[i].gid }'></td>
						<td><center><bean:write name="goodslist" property="gid" /></center></td>
						<td><center><bean:write name="goodslist" property="cid" /></center></td>
						<td><bean:write name="goodslist" property="gname" /></td>
						<td><center><bean:write name="goodslist" property="gprice" /></center></td>
						<td><center><bean:write name="goodslist" property="gnum" /></center></td>
						<td><center><bean:write name="goodslist" property="gsold" /></center></td>
						<td><bean:write name="goodslist" property="gscore" /></td>
						<td><bean:write name="goodslist" property="gbrief" /></td>
						<td><a href="getGoodsInfo.do?gid=${allgoodslist[i].gid }">修改</a></td>
					</tr>
				</logic:iterate>
			</logic:present>
			<tr>
				<td colspan="10" align="center">
					<a href="showAllGoods.do?nowPage=0">首页</a>
					<a href="showAllGoods.do?nowPage=${page-1}">上一页</a>
					<a href="showAllGoods.do?nowPage=${page+1}">下一页</a>
					<a href="showAllGoods.do?nowPage=${endPage}">尾页</a>
					<span class="pagenum">${page}/${endPage}</span>
					<br />
				</td>
			</tr>
		</table>
		<html:button property="addGoods" value="新增" onclick="go()"></html:button>
		<html:submit value="删除"></html:submit>
	</form>
</div>