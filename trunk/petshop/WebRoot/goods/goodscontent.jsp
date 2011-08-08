<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/taglib/common.jsp"%>
<link href="<%=request.getContextPath()%>/pages/css/rightcontent.css" rel="stylesheet" type="text/css" />
<div class="mycontent">
	<div class="category_topimage">
		<hr />
		<img src="<%=request.getContextPath()%>/pages/pic/${category}.jpg" />
		<hr />
	</div>
	<div class="mygoodscontent">
		<logic:present name="goodsList">
			<% int goodsindex=0;%>
			<logic:iterate id="goods" name="goodsList" >
				
			<%
				goodsindex++;
				if(goodsindex%4 != 0){
				%>
				<div class="goodsshowbox">
					<div class="con_goodsimage">
						<a href="goodsDetails.do?goodsid=${goods.goodsid}"><img style="margin: 8px;" title="点击查看具体信息" src="<%=request.getContextPath()%>/resource/${goods.goodsid }.jpg"
							height="150px" width="140px" /></a>
					</div>
					<div class="con_goodsname">
						<a href="goodsDetails.do?goodsid=${goods.goodsid}">${goods.goodsName }</a>
					</div>
					<div class="con_goodsprice">
						<span>Price ￥</span><span style="color: #F60; margin-left: 10px;">${goods.goodsPrice }</span>
					</div>
					<div class="con_goodsaddtocart">
						<span class="con_addtocart_btn" onclick="addtocart('${goods.goodsid}')"></span>
					</div>
				</div>
				<%	
				}else{
				%>
				<div class="goodsshowbox_noborder">
					<div class="con_goodsimage">
						<a href="goodsDetails.do?goodsid=${goods.goodsid}"><img style="margin: 8px;" title="点击查看具体信息" src="<%=request.getContextPath()%>/resource/${goods.goodsid }.jpg"
							height="150px" width="140px" /></a>
					</div>
					<div class="con_goodsname">
						<a href="goodsDetails.do?goodsid=${goods.goodsid}">${goods.goodsName }</a>
					</div>
					<div class="con_goodsprice">
						<span>Price ￥</span><span style="color: #F60; margin-left: 10px;">${goods.goodsPrice }</span>
					</div>
					<div class="con_goodsaddtocart">
						<span class="con_addtocart_btn" onclick="addtocart('${goods.goodsid}')"></span>
					</div>
				</div>
				<hr />
				<%
				}
			%>
			</logic:iterate>
			<%
				if(goodsindex%4!=0){
				%>
					<hr/>
				<%
				}
			%>
		</logic:present>
		
		<logic:notPresent name="goodsList">
			<center><span style="font-size:20px; color:666px; height:30px; display:inline-block; font-weight:900; margin-top:60px;">Sorry, But No Goods Available Here...</span></center>
		</logic:notPresent>
		<logic:present name="goodsList">
			<center style="font-size:14px;font-weight:900;">
				<a href="goodsPage.do?nowPage=${firstPage }&category=${category}">|&lt;&lt;</a>&nbsp;&nbsp;
				<a href="goodsPage.do?nowPage=${page-1 }&category=${category}">&lt;&lt;</a>&nbsp;&nbsp;
				<span class="pagenum">${page}/${endPage }</span>&nbsp;&nbsp;
				<a href="goodsPage.do?nowPage=${page+1 }&category=${category}">&gt;&gt;</a>&nbsp;&nbsp;
				<a href="goodsPage.do?nowPage=${endPage }&category=${category}">&gt;&gt;|</a>
			</center>
		</logic:present>
	</div>
</div>
