<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/taglib/common.jsp" %>
<link href="<%=request.getContextPath()%>/pages/css/leftmenu.css" rel="stylesheet" type="text/css" />
<style>
<!--
.sub_category_span a {
	color: #666;
}
.sub_category_span a:visited{
	color: #666;
}
.lmenu_items{
	color: #CCFFCC;
}
-->
</style>
<div class="lmenu">
	<div class="lmenu_items">
    	<div class="lmenu_title" style="font-family: 'Comic Sans MS'">MainMenu</div>
        <div class="lmenu_item" >
    		<div class="p_category" ><span class="p_category_sapn">个人信息</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/getUserMsg">查询信息</html:link>
            	</span>
            	<span class="sub_category_span">
            		<html:link action="/modUserPassword">修改密码</html:link>
            	</span>
            	<span class="sub_category_span">
					<html:link action= "/getUserMoney">余额查询</html:link>
            	</span>
            </div>
        </div>
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">订单管理</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/trading">订单ING</html:link>
				</span>
				<span class="sub_category_span">
					<html:link action="/history">历史订单</html:link>
				</span>
                
            </div>
        </div>
 
		<div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">购物车</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/getCart.do">我的购物车</html:link>
				</span>
            </div>
        </div>
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">充值</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/eBank">网银充值</html:link>
				</span>
            </div>
        </div>
    </div>
</div>
