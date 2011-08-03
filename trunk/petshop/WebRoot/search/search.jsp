<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/taglib/common.jsp" %>
<link href="<%=request.getContextPath()%>/search/css/searchbar.css" rel="stylesheet" type="text/css" />
<div class="topsearch">
	<div class="searchbox">
		<div class="search">
			<form name="search" action="<html:rewrite action="/findGoods"/>">
				<div class="searchinput">
						<input type="text" name="searchkey" />
						|
						<select name="searchcategory">
							<option value="0">All</option>
							<option value="1">Dog</option>
							<option value="2">Cat</option>
							<option value="4">Bird</option>
							<option value="5">Fish</option>
							<option value="6">Reptile</option>
							<option value="3">Small Animal</option>
						</select>
				</div>
				<div class="searchbtn">
					<span onclick="javascript:document.search.submit()" class="gobtn"></span>
				</div>
			</form>
		</div>
	</div>
</div>
