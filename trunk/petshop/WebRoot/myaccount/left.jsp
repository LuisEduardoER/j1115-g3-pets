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
	.sub_category_span a:hover{
		
	}
-->
</style>
<div class="lmenu">
	<div class="lmenu_items" style="font-family: 微软雅黑,黑体; font-weight: 600; color: #CCFFCC">
    	<div class="lmenu_title" style="font-family: 'Comic Sans MS'">MainMenu</div>
        <div class="lmenu_item" >
    		<div class="p_category" ><span class="p_category_sapn">个人信息</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/getUserMsg">查询信息</html:link>
            	</span>
            	<span class="sub_category_span">
					<a href="<%=request.getContextPath()%>/jsp/updatepass.jsp">修改密码</a>
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
					<a href="../trading.do" target="_top">订单ING</a>
				</span>
				<span class="sub_category_span">
					<a href="../history.do" target="_top">历史订单</a>
				</span>
                
            </div>
        </div>
 
 		 <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">购物车</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<A href="adsmgr.php" target="right">我的购物车</A>
				</span>
            </div>
        </div>
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">充值</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<A href="<%=request.getContextPath()%>/jsp/recharge.jsp" target='_blank'>网银充值</A>
				</span>
                
            </div>
        </div>
    </div>
</div>
