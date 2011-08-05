<%@page contentType="text/html;charset=utf-8"%>
<%@include file="common.jsp"%>

<p id="whereami">
</p>
<h1>
	新建书籍
</h1>
<p>
	&nbsp;
</p>

<html:form action="/addBook" method="post" enctype="multipart/form-data" onsubmit="return validateBookForm(this);">
	<table cellpadding="0" cellspacing="0" border="0" class="form_table">
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.id" />
				：
			</td>
			<td valign="middle" align="left">
				<html:text styleClass="inputgri" property="id" />
				<html:errors property="id" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.name" />
				：
			</td>
			<td valign="middle" align="left">
				<html:text styleClass="inputgri" property="name" />
				<html:errors property="name" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.author" />
				：
			</td>
			<td valign="middle" align="left">
				<html:text styleClass="inputgri" property="author" />
				<html:errors property="author" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.publisher" />
				：
			</td>
			<td valign="middle" align="left">
				<html:text styleClass="inputgri" property="publisher" />
				<html:errors property="publisher" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.publishDate" />
				：
			</td>
			<td valign="middle" align="left">
				<html:text styleClass="inputgri" property="publishDate" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.price" />
				：
			</td>
			<td valign="middle" align="left">
				<html:text styleClass="inputgri" property="price" />
			</td>
		</tr>

		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.cover" />
				：
			</td>
			<td valign="middle" align="left">
				<html:file styleClass="inputgri" property="file" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="right">
				<bean:message key="book.brief" />
				：
			</td>
			<td valign="middle" align="left">
				<html:textarea styleClass="inputgri" property="brief" />
			</td>
		</tr>
	</table>

	<p>
		<input type="submit" class="button" value="提交 &raquo;" />
	</p>
	<font clolr="red"><html:errors property="upload" /></font>
</html:form>

<p>
	&nbsp;
</p>