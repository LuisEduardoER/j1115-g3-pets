﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!---->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
td {font-size: 9pt;line-height: 1.5;}
body {font-size: 9pt;line-height: 1.5;}
a:link { font-size: 9pt; color: #000000; text-decoration: none }
a:visited{ font-size: 9pt; color: #000000; text-decoration: none }
a:hover {font-size: 9pt;color: red}
</style>
<!---->
<br />

 <form  enctype="multipart/form-data" id="form1" name="form1" method="post" action="addpro_action.php">
<table width="100%"  border="0" cellPadding="4" cellSpacing="1" bgcolor="#A5D0F1">
  <tr align="left"> 
    <td colspan="5" background="images/wbg.gif"><div align="center"><strong>添加商品</strong></div></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="80">商品ID：</td>
    <td><input name="pid" type="text" id="pid" />
    </a></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="80">商品名称：</td>
    <td><input name="pname" type="text" id="pname" />
    </a></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="80">上市时间：</td>
    <td><label>
      <select name="year">
			<option label="2009" value="2009" selected="selected">2009</option>
			<option label="2008" value="2008">2008</option>
			<option label="2007" value="2007">2007</option>
			<option label="2006" value="2006">2006</option>
			<option label="2005" value="2005">2005</option>
			<option label="2004" value="2004">2004</option>
			<option label="2003" value="2003">2003</option>
			<option label="2002" value="2002">2002</option>
			<option label="2001" value="2001">2001</option>
			<option label="2000" value="2000">2000</option>
			<option label="1999" value="1999">1999</option>
			<option label="1998" value="1998">1998</option>
			<option label="1997" value="1997">1997</option>
			<option label="1996" value="1996">1996</option>
			<option label="1995" value="1995">1995</option>
			<option label="1994" value="1994">1994</option>
			<option label="1993" value="1993">1993</option>
			<option label="1992" value="1992">1992</option>
			<option label="1991" value="1991">1991</option>
			<option label="1990" value="1990">1990</option>
      </select>
      年
      <select name="month">
		<option label="01" value="01">January</option>
		<option label="02" value="02">February</option>
		<option label="03" value="03">March</option>
		<option label="04" value="04">April</option>
		<option label="05" value="05">May</option>
		<option label="06" value="06">June</option>
		<option label="07" value="07" selected="selected">July</option>
		<option label="08" value="08">August</option>
		<option label="09" value="09">September</option>
		<option label="10" value="10">October</option>
		<option label="11" value="11">November</option>
		<option label="12" value="12">December</option>
      </select>
      月
      <select name="day">  
		<option label="01" value="1">01</option>
		<option label="02" value="2">02</option>
		<option label="03" value="3">03</option>
		<option label="04" value="4">04</option>
		<option label="05" value="5">05</option>
		<option label="06" value="6">06</option>
		<option label="07" value="7">07</option>
		<option label="08" value="8">08</option>
		<option label="09" value="9">09</option>
		<option label="10" value="10">10</option>
		<option label="11" value="11">11</option>
		<option label="12" value="12">12</option>
		<option label="13" value="13">13</option>
		<option label="14" value="14">14</option>
		<option label="15" value="15">15</option>
		<option label="16" value="16">16</option>
		<option label="17" value="17">17</option>
		<option label="18" value="18">18</option>
		<option label="19" value="19">19</option>
		<option label="20" value="20">20</option>
		<option label="21" value="21">21</option>
		<option label="22" value="22">22</option>
		<option label="23" value="23">23</option>
		<option label="24" value="24">24</option>
		<option label="25" value="25">25</option>
		<option label="26" value="26">26</option>
		<option label="27" value="27">27</option>
		<option label="28" value="28">28</option>
		<option label="29" value="29">29</option>
		<option label="30" value="30" selected="selected">30</option>
		<option label="31" value="31">31</option>
      </select>
      日
    </label>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="80">价格：</td>
    <td>市场价格：
      <input name="pmprice" type="text" id="pmprice" />
    元 会员价格：
    <input name="ppprice" type="text" id="ppprice" />
    元</a></td>
  </tr>   
  <tr bgcolor="#FFFFFF">
    <td width="80">商品类型：</td>
    <td>
     <select name="ptype">
	 	<option value="">手机</option>
	 	<option value="">电脑</option>		
		<option value="">图书</option>		
		<option value="">服装</option>		
		<option value="">家电</option>		
	 </select>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td class="FormButton">商品等级：</td>
    <td>
      <select name="rate">
	      	<option label="A" value="A" selected="selected">A</option>
		    <option label="B" value="B">B</option>
		    <option label="C" value="C">C</option>
      </select>
    </td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td class="FormButton">商品品牌：</td>
    <td>
      <input name="brand" type="text" id="brand" />
 <A href="user_modify.php?user="></A></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td class="FormButton">商品型号：</td>
    <td>
<!--<!---->
<!---->

<input name="xh" type="text" id="pname22" />
<!---->    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td valign="top" class="FormButton">是否推荐：</td>
    <td><!---->
     <input type="radio"  name="isrec" checked="checked"/>是 <input type="radio" name="isrec" />否
  </tr>
  <tr bgcolor="#FFFFFF">
    <td valign="top" class="FormButton">商品数量：</td>
    <td><!---->
      
      <input name="num" type="text" id="pname232" />
</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td valign="top" class="FormButton">商品图片：</td>
    <td><!---->
      
      <input name="picture" type="file" id="pname233" />
</td>

  </tr><tr bgcolor="#FFFFFF">
    <td valign="top" class="FormButton">商品简介：</td>
    <td><!---->
	   <TEXTAREA name="describe" cols="70" rows="6" class="InputWidth"></TEXTAREA>
	   
	</td>
  </tr>
   <tr align="left"> 
    <td colspan="5" background="images/wbg.gif"><div align="center"><strong><input type="submit" name="Submit2" value="添加" />  <input type="reset" name="Submit" value="重写" /></strong></div></td>
  </tr>

</table>
 </form>
<!---->
<br />

<!----><table border="0" width="980" cellPadding="0" cellSpacing="0" height="40" align="center">
  <tr>
    <td align="center" height="20">Powered by <a href="http://www.netgou.net" target="_blank">NetGou</a>
	<a href="http://www.netgou.net" target="_blank">v4.1</a>
Processed in  29.59(ms) 5queries
</td>
  </tr>
</table>