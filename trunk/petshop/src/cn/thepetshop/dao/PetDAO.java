package cn.thepetshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import cn.thepetshop.object.Cart;
import cn.thepetshop.object.Category;
import cn.thepetshop.object.Goods;
import cn.thepetshop.object.Menu;
import cn.thepetshop.object.Order;
import cn.thepetshop.object.OrderInfo;
import cn.thepetshop.object.OrderedGoods;
import cn.thepetshop.object.User;

public class PetDAO {

	/**
	 * 连接数据库
	 * 
	 * @return 返回一个Connection
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	private Connection getConnection() throws SQLException,
			ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
//		String url = "driver:oracle:thin:@172.16.53.193:1521:orcl";
		String url = "driver:oracle:thin:@127.0.0.1:1521:orcl";
		return DriverManager.getConnection(url, "scott", "tiger");
	}

	/**
	 * 关闭各种连接
	 * 
	 * @param con
	 *            需要关闭的Connecion对象
	 * @param st
	 *            需要关闭的Statement对象
	 * @param rs
	 *            需要关闭的ResultSet对象
	 */
	private void free(Connection con, Statement st, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 用于登陆时验证用户名及密码
	 * 
	 * @param username 传入用户名
	 * @param password 传入密码
	 * @return boolean 验证成功返回true，否则返回false
	 * 
	 */
	public String login(String username, String password) {
		String userid = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select u_id from p_users where u_name='"
					+ username + "' and u_pass='" + password + "'";
			//System.out.println(sql);
			rs = st.executeQuery(sql);
			if (rs.next()) {
				userid = rs.getString(1);
//				System.out.println(userid);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			free(con, st, rs);
		}
		return userid;
	}

	/**
	 * 用于注册时新增用户
	 * 
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return boolean 注册成功后返回true，失败返回false
	 * 
	 */
	public boolean register(String username, String password) {
		boolean b = false;
		Connection con = null;
		Statement st = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "insert into p_users (u_name,u_pass) values('"
					+ username + "','" + password + "')";
			if (st.executeUpdate(sql) == 1) {
				b = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
		return b;
	}

	/**
	 * 获取用户id
	 * 
	 * @param username
	 *            传入值username
	 * @return 返回用户id
	 */
	public int getUid(String username) {
		int userid = 0;// 用户u_id
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select u_id from p_users where u_name='" + username
					+ "'";
			rs = st.executeQuery(sql);
			if (rs.next()) {
				userid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return userid;
	}

	/**
	 * 根据用户userid查询出用户所有信息
	 * 
	 * @param username
	 * @return User(一个用户)
	 */
	public User findUserById(String userid) {

		User user = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select * from p_users where u_id= "+ userid;
			rs = st.executeQuery(sql);
			if (rs.next()) {
				user = new User();
				user.setId(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setIdentity(rs.getString(4));
				user.setMoney(rs.getString(5));
//				System.out.println(user.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return user;
	}

	/**
	 * 修改用户名密码的方法
	 * 
	 * @param password
	 * @return boolean
	 */
	public boolean updateUserPass(String userid, String oldpass,String newpass) {
		Connection con = null;
		Statement st = null;
		ResultSet rs=null;
		String str="";
		boolean b = false;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select u_pass from p_users where u_id="+userid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				str=rs.getString(1);
			}
			if(str.equals(oldpass)){
				sql="update p_users set u_pass='"+newpass+"' where u_id="+userid;
				int i=st.executeUpdate(sql);
				if(i==1){
					b=true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			free(con, st, rs);
		}
		return b;
	}

	/**
	 * 得到一个限定对象为Order的List
	 * @param userid 用户id
	 * @return 返回一个限定对象为Order的List
	 */
	public List<Order> getOrderList(int userid) {
		List<Order> orderList = new ArrayList<Order>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_orders where u_id="+userid;
			rs=st.executeQuery(sql);
			while(rs.next()){
				Order order=new Order();
				order.setOrderId(rs.getInt(1));
				order.setTime(rs.getDate(3));
				order.setReceiver(rs.getString(4));
				order.setAddress(rs.getString(5));
				order.setPhone(rs.getString(6));
				order.setState(rs.getInt(7));
				orderList.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return orderList;
	}
	/**
	 * 修改管理员密码，先判断原密码是否正确再进行修改
	 * @param oldpass
	 * @param newpass
	 * @return
	 */
	public String updateAdministratorPass(String oldpass,String newpass){
		String str="false";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String pass=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select u_pass from p_users where u_name='Administrator'";
			rs=st.executeQuery(sql);
			if(rs.next()){
				pass=rs.getString(1);
			}
			if(pass.equals(oldpass)){
				sql="update p_users set u_pass='"+newpass+"' where u_name='Administrator'";
				st.executeUpdate(sql);
				str="密码修改成功";
			}else{
				str="原密码错误";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return str;
	}
	
	/**
	 * 根据提供的类别，返回商品id，名字以及价格的list
	 * @param category
	 * @return
	 */
	public List<Goods> listGoods(String category,int start,int end){
		List<Goods> list=new ArrayList<Goods>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="";
			if(pOrc(category)){
				sql="select g_id,g_name,g_price from (select g.*, rownum rn from p_goods g,p_category c where g.c_id=c.c_id and c.p_id="+category+") where rn>="+start+" and rn<="+end;
			}else{
				sql="select g_id,g_name,g_price from (select g.*, rownum rn from p_goods g where c_id="+category+") where rn>="+start+" and rn<="+end;
			}			
			rs=st.executeQuery(sql);
			while(rs.next()){
				Goods goods=new Goods();
				goods.setGoodsid(rs.getInt(1));
				goods.setGoodsName(rs.getString(2));
				goods.setGoodsPrice(rs.getDouble(3));
				list.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	/**
	 * 获得某一类商品总个数
	 * @param category
	 * @return
	 */
	public int getRowCount(String category){
		int count = 0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql="";
			if(pOrc(category)){
				sql="select count(g_id) from p_goods g,p_category c where g.c_id=c.c_id and c.p_id="+category;
			}else{
				sql ="select count(g_id) from p_goods where c_id="+category;
			}			
			rs = st.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			free(con, st, rs);
		}
		
		return count;
	}
	
	/**
	 * 判断一个分类号是主分类还是子分类
	 * @param category
	 * @return
	 */
	public boolean pOrc(String category){
		boolean b=false;
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select p_id from p_category where c_id = "+category;
			rs=st.executeQuery(sql);
			if(rs.next()){
				if(rs.getString(1).equals("0")){
					b=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return b;
	}
	
	/**
	 * 返回所有的父分类
	 * @param category
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getCategoryList(){
		List list= new ArrayList();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_category where p_id = 0";
			rs=st.executeQuery(sql);
			while(rs.next()){
				CategoryJavaBean cjb = new CategoryJavaBean();
				cjb.setCid(rs.getInt(1));
				cjb.setPid(rs.getInt(2));
				cjb.setCname(rs.getString(3));
				list.add(cjb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	/**
	 * 根据cid来修改父分类的名称
	 * @param category
	 * @return
	 */
	public void modParentCategory(int cid,String cname){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_category set c_name = '"+cname+"' where c_id="+cid;
			st.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	/**
	 * 添加父分类的名称
	 * @param category
	 * @return
	 */
	public void addParentCategory(String cname){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="insert into p_category(p_id,c_name)values (0,'"+cname+"')";
			st.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	/**
	 * 根据订单id获取订单内含有的商品list
	 * @param orderid
	 * @return
	 */
	public List<OrderedGoods> getOrderedGoods(int orderid){
		List<OrderedGoods> list=new ArrayList<OrderedGoods>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_orders_info a,p_goods b where a.g_id=b.g_id and a.o_id="+orderid;
			rs=st.executeQuery(sql);
			while(rs.next()){
				OrderedGoods og=new OrderedGoods();
				og.setGoodsid(rs.getInt(2));
				og.setNum(rs.getInt(3));
				og.setGoodsPrice(rs.getDouble(4));
				og.setGoodsName(rs.getString(7));
				og.setGoodsBrief(rs.getString(10));
				list.add(og);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}	
	
	/**
	 * 根据用户id获取用户所有订单信息
	 * @param userid
	 * @return
	 */
	public List<OrderInfo> getOrderInfoByUserId(int userid){
		List<OrderInfo> list=new ArrayList<OrderInfo>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_orders where u_id="+userid;;
			rs=st.executeQuery(sql);
			while(rs.next()){
				Order o=new Order();
				o.setOrderId(rs.getInt(1));
				o.setTime(rs.getDate(3));
				o.setReceiver(rs.getString(4));
				o.setAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setState(rs.getInt(7));
				o.setMoney(rs.getDouble(9));
				List<OrderedGoods> goods =new ArrayList<OrderedGoods>();
				goods=getOrderedGoods(rs.getInt(1));
				OrderInfo oi=new OrderInfo();
				oi.setOrder(o);
				oi.setGoodsList(goods);
				list.add(oi);				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	/**
	 * 根据订单编号修改订单状态
	 * @param orderid
	 * @param tradeStatus
	 */
	public void updateOrderSatatus(int orderid,int tradeStatus){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_orders set o_state = "+tradeStatus+" where o_id = "+orderid;
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 将评价分数加入到数据库
	 * @param orderid
	 * @param score
	 */
	public void addEvalute(int goodid,double score ,int num){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_goods set g_score = "+score+" , g_sold = "+num+" where g_id = "+goodid;
//			System.out.println(sql);
			st.executeQuery(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 根据订单编号删除订单
	 * @param orderid
	 */
	public void deleteOreder(int orderid){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="delete from p_orders where o_id = "+orderid;
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 根据用户编号修改用户的余额  mo
	 * @param userid
	 * @param money
	 */
	public void updateusermoney(int userid,double money){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_users set u_money = "+money+" where u_id ="+userid;
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 根据传入的商品id和新的数量，
	 * 从数据库的购物车表获取并更改数量
	 * 
	 * @param userid 用户id
	 * @param goodsid 商品id
	 * @param newnum 需要修改的数量
	 * @return 如果修改成功返回 "changesuccess"
	 * 如果修改时商品库存不足，则返回商品库存数量的String值
	 * 如果修改时发现传入数量和购物车数量相同则返回"unchange"
	 */
	public String modifyAmount(String userid,String goodsid, String newnum) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		int leftnum=0;
		int buynum=0;
		int	changenum=Integer.valueOf(newnum);
		String str="";
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select g_num from p_goods where g_id="+goodsid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				leftnum=rs.getInt(1);
			}
			sql="select i_num from p_cart where u_id="+userid+" and g_id="+goodsid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				buynum=rs.getInt(1);
			}
			if(changenum==buynum){
				str="unchange";
			}else if(changenum>leftnum){
				str=String.valueOf(leftnum);
			}else{
				sql="update p_cart set i_num ="+changenum+"where g_id="+goodsid+"and u_id="+userid;
				st.executeUpdate(sql);
				str="changesuccess";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return str;
	}
	
	/**
	 * 删除用户购物车内一条商品信息
	 * @param goodsid
	 * @param userid
	 */
	public boolean delGoodsInCart(String goodsid,String userid){
		boolean b=false;
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="delete from p_cart where u_id="+userid+" and g_id = "+goodsid;
			int i=st.executeUpdate(sql);
			if(i==1){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
		return b;
	}

	/**
	 * 根据父分类cid获取子分类
	 * @param category
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getChildrenCategory(int cid){
		List list= new ArrayList();
		Connection con=null;
		Statement st=null;
		ResultSet rs = null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_category where p_id ="+cid;
			rs = st.executeQuery(sql);
			while (rs.next()) {
				CategoryJavaBean ccjb = new CategoryJavaBean();
				ccjb.setCid(rs.getInt(1));
				ccjb.setPid(rs.getInt(2));
				ccjb.setCname(rs.getString(3));
				list.add(ccjb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	/**
	 * 得到用户的购物车对象
	 * @param userid 用户id
	 * @return 返回用户的购物车
	 */
	public Cart getShoppingCart(String userid) {
		Cart c = new Cart();
		List<OrderedGoods> l=new ArrayList<OrderedGoods>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_cart,p_goods where p_cart.g_id = p_goods.g_id and u_id = "+userid;
			rs=st.executeQuery(sql);
			while(rs.next()){				
				OrderedGoods og=new OrderedGoods();
				og.setGoodsid(rs.getInt(2));
				og.setNum(rs.getInt(3));
				og.setGoodsName(rs.getString(6));
				og.setGoodsPrice(rs.getDouble(7));
				og.setGoodsBrief(rs.getString(9));				
				l.add(og);				
			}
			c.setGoodsList(l);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return c;
	}

	/**
	 * 删除子分类
	 * @param cjbno
	 */
	public void deleteChildrenCategory(String[] cjbno) {
		Connection con = null;
		Statement st = null;
		try {
			con = getConnection();
			st = con.createStatement();
			for (int i = 0; i < cjbno.length; i++) {
				String sql = "delete from p_category where c_id ="+cjbno[i];
				st.addBatch(sql);
			}
			int[] is =st.executeBatch();
		} catch (Exception e) {
		}finally{
			free(con, st, null);
		}
	}

	/**
	 * 添加子分类
	 * @param pid 即属于哪个父分类
	 * @param addcname 添加的子分类名称
	 */
	public void addChildrenCategory(int pid, String addcname) {
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="insert into p_category(p_id,c_name)values ("+pid+",'"+addcname+"')";
			st.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}

	/**
	 * 修改子分类并返回新名称
	 * @param pno 即属于哪个父分类
	 * @param newname 修改的子分类名称
	 */
	public String modChildrenCategory(int pno, String newname) {
		Connection con=null;
		Statement st=null;
		ResultSet rs = null;
		String new_name ="";
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_category set c_name = '"+newname+"' where c_id="+pno;
			st.executeUpdate(sql);
			sql = "select c_name from p_category where c_id="+pno;
			rs = st.executeQuery(sql);
			if (rs.next()) {
				new_name = rs.getString(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return new_name;
	}

	/**
	 * 创建订单，并输出订单信息
	 * @param userid 用户id
	 * @param receiver 接收者
	 * @param address 地址
	 * @param phone 电话号码
	 * @return 返回一个OrderInfo对象
	 */
	public OrderInfo createOrder(String userid, String receiver,
			String address, String phone) {
		Connection con=null;
		Statement st=null;
		OrderInfo oi=new OrderInfo();
		Order o=new Order();
		o.setAddress(address);
		o.setPhone(phone);
		o.setReceiver(receiver);
		Date d = new Date();
		o.setTime(d);
		oi.setOrder(o);
		Cart cart=getShoppingCart(userid);		
		oi.setGoodsList(cart.getGoodsList());
		oi.setSumMoney(Double.valueOf(cart.getSumMoney()));
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="insert into p_orders (u_id,o_time,o_receiver,o_address,o_phone,o_sum) " +
					"values("+userid+",sysdate,'"+receiver+"','"+address+"','"+phone+"',"+Double.valueOf(cart.getSumMoney())+")";
			//System.out.println("sql: "+sql);
			st.executeUpdate(sql);
			updateGoodsLeftNum(cart.getGoodsList());
			addSoldNum(cart.getGoodsList());
			clearCart(userid);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
		return oi;
	}
	
	/**
	 * 根据订单内商品购买个数更新商品剩余个数
	 * @param list
	 */
	public void updateGoodsLeftNum(List list){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			for(int i=0;i<list.size();i++){
				OrderedGoods og=(OrderedGoods) list.get(i);
				String sql="update p_goods set g_num = g_num - "+og.getNum()+" where g_id="+og.getGoodsid();
				st.executeUpdate(sql);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 根据订单内商品购买个数更新商品卖出个数
	 * @param list
	 */
	public void  addSoldNum(List list){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			for(int i=0;i<list.size();i++){
				OrderedGoods og=(OrderedGoods) list.get(i);
				String sql="update p_goods set g_sold = g_sold + "+og.getNum()+" where g_id="+og.getGoodsid();
				st.executeUpdate(sql);
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 根据用户id清空用户购物车
	 * @param userid
	 */
	public void clearCart(String userid){
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="delete p_cart where u_id="+userid;
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 获取所有商品信息的列表
	 * @param 
	 * @return list 所有商品对象的列表
	 */
	@SuppressWarnings("unchecked")
	public List getAllGoodsList(int start,int end) {
		List list = new ArrayList();
		Connection con=null;
		Statement st=null;
		ResultSet rs = null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from (select g.*, rownum rn from p_goods g) where rn>="+start+" and rn<="+end;
			rs = st.executeQuery(sql);
			while (rs.next()) {
				GetAllGoods gag = new GetAllGoods();
				gag.setGid(rs.getInt(1));
				gag.setCid(rs.getInt(2));
				gag.setGname(rs.getString(3));
				gag.setGprice(rs.getDouble(4));
				gag.setGnum(rs.getInt(5));
				gag.setGbrief(rs.getString(6));
				gag.setGscore(rs.getFloat(7));
				gag.setGsold(rs.getInt(8));
				list.add(gag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}

	/**
	 * 根据用户名查询是否存在该用户
	 * @param username
	 * @return
	 */
	public boolean checkUser(String username){
		boolean b=false;
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_users where u_name='"+username+"'";
			rs=st.executeQuery(sql);
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return b;		
	}

	/**
	 * 根据父分类查询下面的所有子分类
	 * @param cid
	 * @return 相应子分类
	 */
	@SuppressWarnings("unchecked")
	public List getCNameInOneCid(int cid) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		List list = new ArrayList();
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select c_name from p_category where p_id="+cid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}

	/**
	 * 添加新商品
	 * @param cid
	 * @return 相应子分类
	 */
	public int addNewGoods(int cid,String gname, double gprice, int gnum, String gbrief) {
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		int i=0;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select g_id_seq.nextval from dual";
			rs=st.executeQuery(sql);
			if(rs.next()){
				i=rs.getInt(1);
			}
			sql="insert into p_goods (g_id,c_id,g_name,g_price,g_num,g_brief) values ("+i+","+cid+",'"+gname+"',"+gprice+","+gnum+",'"+gbrief+"')";
//			System.out.println(sql);
			st.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
		return i;
	}

	/**
	 * 获得所有商品总个数
	 * @return
	 */
	public int getCount() {
		int count=0;
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select count(g_id) from p_goods";
			rs=st.executeQuery(sql);
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return count;
	}

	/**
	 * 根据G_ID获取商品信息的列表
	 * @param 
	 * @return list 商品信息的列表
	 */
	public GetAllGoods getGoodsListByGid(int gid) {
		GetAllGoods gag = new GetAllGoods();
		Connection con=null;
		Statement st=null;
		ResultSet rs = null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_goods where g_id="+gid;
			rs = st.executeQuery(sql);
			if (rs.next()) {
				
				gag.setGid(rs.getInt(1));
				gag.setCid(rs.getInt(2));
				gag.setGname(rs.getString(3));
				gag.setGprice(rs.getDouble(4));
				gag.setGnum(rs.getInt(5));
				gag.setGbrief(rs.getString(6));
				gag.setGscore(rs.getFloat(7));
				gag.setGsold(rs.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return gag;
	}

	/**
	 
	 * 修改商品信息
	 * @param gid 商品id
	 * @param gname 商品名称
	 * @param gnum 商品剩余数量
	 * @param gprice 商品价格
	 * @param gbrief 商品描述
	 */
	public void modGoodsInfo(int gid,String gname, int gnum, double gprice,
			String gbrief) {
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_goods set g_name = '"+gname+"',g_num="+gnum+",g_price="+gprice+",g_brief='"+gbrief+"' where g_id="+gid; 
			st.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}

		/**
	 * 根据用户提供是搜索关键词搜索名字内有该关键词的商品
	 * @param findname
	 * @param category
	 * @param start
	 * @param end
	 * @return
	 */
	public List<Goods> findGoods(String findname,String category,int start,int end) {
		List<Goods> list=new ArrayList<Goods>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="";
			if(category.equals("0")){
				sql="select g_id,g_name,g_price from(select g.*, rownum rn from p_goods g where g_name like '%"+findname+"%') where rn>="+start+" and rn<="+end;
			}else{
				sql="select g_id,g_name,g_price from(select g.*, rownum rn from p_goods g,p_category c where g.c_id=c.c_id and p_id="+category+" and g_name like '%"+findname+"%') where rn>="+start+" and rn<="+end;
			}
			rs=st.executeQuery(sql);
			//System.out.println("sql:"+sql);
			while(rs.next()){
				Goods goods=new Goods();
				goods.setGoodsid(rs.getInt(1));
				goods.setGoodsName(rs.getString(2));
				goods.setGoodsPrice(rs.getDouble(3));
				list.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	/**
	 * 得到用户查询的商品总数
	 * @param category
	 * @param findname
	 * @return
	 */
	public int getCountOfFindGoods(String category,String findname){
		int count =0;
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="";
			if(category.equals("0")){
				sql="select count(*) from (select g.*, rownum rn from p_goods g where g_name like '%"+findname+"%')";
			}else{
				sql="select count(*) from (select * from p_goods g,p_category c where g.c_id=c.c_id and p_id="+category+" and g_name like '%"+findname+"%')";
			}
//			System.out.println("PetDAO:getCountOfFindGoods  "+sql);
			rs=st.executeQuery(sql);
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return count;
	}

	/**
	 * 删除商品信息
	 * @param goods
	 */
	public void deleteGoodsInfo(String[] goods) {
		Connection con = null;
		Statement st = null;
		try {
			con = getConnection();
			st = con.createStatement();
			for (int i = 0; i < goods.length; i++) {
				String sql = "delete from p_goods where g_id ="+goods[i];
				st.addBatch(sql);
			}
			int[] is =st.executeBatch();
		} catch (Exception e) {
		}finally{
			free(con, st, null);
		}
	}

	/**
	 * 获取所有父分类的map对象
	 * @return 分类的对象，键：c_id 值：c_name
	 */
	public Map getPCategoryMap() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Map map = new HashMap();
		int cid;
		String cname;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select c_id,c_name from p_category where p_id=0";
			rs = st.executeQuery(sql);
			while (rs.next()) {
				cid= rs.getInt(1);
				cname = rs.getString(2);
				map.put(cid, cname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 查找所有分类
	 * @return
	 */
	public List<Menu> getMenuList(){
		List<Menu> list=new ArrayList<Menu>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_category where p_id=0";
			rs=st.executeQuery(sql);
			while(rs.next()){
				Menu menu=new Menu();
				List<Category> clist=getCMenuName(rs.getString(1));
				menu.setCid(rs.getString(1));
				menu.setPname(rs.getString(3));
				menu.setSubcategoryList(clist);
				list.add(menu);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查找某特定父类下的子类
	 * @param p_id
	 * @return
	 */
	public List<Category> getCMenuName(String p_id){
		List<Category> list=new ArrayList<Category>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_category where p_id="+p_id;
			rs=st.executeQuery(sql);
			while(rs.next()){
				Category c=new Category();
				c.setCid(rs.getString(1));
				c.setPid(rs.getString(2));
				c.setCname(rs.getString(3));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	/**
	 * 获取所有订单的列表
	 * @param 
	 * @return list 所有订单对象的列表
	 */
	@SuppressWarnings("unchecked")
	public List getAllOrderList(int start,int end) {
		List list = new ArrayList();
		Connection con=null;
		Statement st=null;
		ResultSet rs = null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from (select g.*, rownum rn from p_orders g) where rn>="+start+" and rn<="+end;
			rs = st.executeQuery(sql);
			while (rs.next()) {
				GetAllOrder gao = new GetAllOrder();
				gao.setOid(rs.getInt(1));
				gao.setUid(rs.getInt(2));
				gao.setOtime(rs.getDate(3));
				gao.setOreceiver(rs.getString(4));
				gao.setOaddress(rs.getString(5));
				gao.setOphone(rs.getString(6));
				gao.setOstate(rs.getInt(7));
				gao.setOtype(rs.getInt(8));
				gao.setOsum(rs.getInt(9));
				list.add(gao);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return list;
	}
	
	
	
	/**
	 * 删除订单信息
	 * @param orders
	 */
	public void deleteOrderList(String[] orders) {
		Connection con = null;
		Statement st = null;
		try {
			con = getConnection();
			st = con.createStatement();
			for (int i = 0; i < orders.length; i++) {
				String sql = "delete from p_orders where o_id ="+orders[i];
				st.addBatch(sql);
			}
			int[] is =st.executeBatch();
		} catch (Exception e) {
		}finally{
			free(con, st, null);
		}
	}
	
	/**
	 * 将商品添加至购物车
	 * @param userid
	 * @param goodsid
	 * @param num
	 * @return
	 */
	public boolean addGoodsToCart(String userid,String goodsid,String num){
		Connection con=null;
		Statement st=null;
		boolean b=false;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="";
			if(checkGoodsInCart(userid,goodsid)){
				sql="update p_cart set i_num = i_num +"+num+" where u_id = "+userid+" and g_id = "+goodsid;
			}else{
				sql="insert into p_cart values("+userid+","+goodsid+","+num+")";
			}
			int i=st.executeUpdate(sql);
			if(i==1){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
		return b;
	}
	
	/**
	 * 获得购物车内商品总数
	 * @param userid
	 * @return
	 */
	public String getNumInCart(String userid){
		String amount = "";
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select sum(i_num) from p_cart where u_id = "+userid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				amount=rs.getString(1);
//				System.out.println("PetDao getNumInCart .."+amount);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return amount==null?"0":amount;
	}
	
	/**
	 * 判断一个商品是否在某用户的购物车中
	 * @param userid
	 * @param goodsid
	 * @return
	 */
	public boolean checkGoodsInCart(String userid,String goodsid){
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		boolean b=false;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select * from p_cart where u_id="+userid+" and g_id="+goodsid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return b;
	}

	/**
	 * 根据oid更改订单状态
	 * @param oid
	 */
	public void modOrderStateByOid(String oid) {
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="update p_orders set o_state=2 where o_id="+oid;
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}
	
	/**
	 * 根据商品id获得商品售出人数以及平均分
	 * @param goodsid
	 * @return
	 */
	public String[] getGoodsScore(String goodsid){
		String[] str=new String[2];
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select g_score,g_sold from p_goods where g_id = "+goodsid;
			rs=st.executeQuery(sql);
			if(rs.next()){
				str[0]=rs.getString(1);
				str[1]=rs.getString(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return str;
	}

	/**
	 * 获得订单总数
	 * @return
	 */
	public int getOrderCount() {
		int count=0;
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select count(o_id) from p_orders";
			rs=st.executeQuery(sql);
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,rs);
		}
		return count;
	}

}


