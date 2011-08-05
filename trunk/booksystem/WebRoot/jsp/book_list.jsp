<%@page contentType="text/html;charset=utf-8"%>
<%@include file="common.jsp"%>
<p id="whereami">
</p>
<h1>
	书籍列表
</h1>
<logic:present name="bookList">
<logic:iterate id="book" name="bookList">
	<p>
		<strong><bean:write name="book" property="name" />
			<bean:write name="book" property="price" format="(￥#.##)" /></strong>
	</p>
	<table width="100%" class="table">
		<tr>
			<td width="15%" rowspan="6">
				<img src="<%=request.getContextPath()%>/res/${book.id}.jpg"
					class="img_left" alt="Picture inside a parragraph"/>
			</td>
			<td width="25%">
				<strong>书名：</strong>
				<bean:write name="book" property="name" />
			</td>
			<td rowspan="6" align="left" valign="top">
				<strong>简介：</strong>
				<bean:write name="book" property="brief" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>作者：</strong>
				<bean:write name="book" property="author" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>出版社：</strong>
				<bean:write name="book" property="publisher" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>出版日期：</strong>
				<bean:write name="book" property="publishDate" format="yyyy年M月d日" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>编号：</strong>
				<bean:write name="book" property="id" />
			</td>
		</tr>
		<tr>
			<td>
				<strong>定价：</strong>
				<bean:write name="book" property="price" format="￥#.##" />
			</td>
		</tr>
	</table>
	<hr />
</logic:iterate>
</logic:present>