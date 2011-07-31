package cn.thepetshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import cn.thepetshop.form.User;
import cn.thepetshop.object.Goods;
import cn.thepetshop.object.Order;
import cn.thepetshop.object.OrderShow;

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
			String sql = "select u_id,u_name,u_pass from p_users where u_name='"
					+ username + "' and u_pass='" + password + "'";
			rs = st.executeQuery(sql);
			if (rs.next()) {
				userid = rs.getString(1);
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
				System.out.println(user.getId());
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
	public boolean updateUserPass(String userid, String password) {
		Connection con = null;
		Statement st = null;
		boolean b = false;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "update p_users set u_pass='" + password
					+ "' where u_name='" + userid + "'";
			System.out.println(sql);
			int conn = st.executeUpdate(sql);
			if (conn == 1)
				b = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			free(con, st, null);
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
	public List<Goods> listGoods(String category){
		List<Goods> list=new ArrayList<Goods>();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select o_id,o_name,o_price from p_goods where c_id="+category;
			rs=st.executeQuery(sql);
			if(rs.next()){
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
	 * 返回所有的父分类
	 * @param category
	 * @return
	 */
	public List getCategoryList(){
		List list= new ArrayList();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="select c_id,c_name from p_category where p_id = 0";
			rs=st.executeQuery(sql);
			while(rs.next()){
				CategoryJavaBean cjb = new CategoryJavaBean();
				cjb.setCid(rs.getInt(1));
				cjb.setCname(rs.getString(2));
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
			System.out.println(sql);
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
			System.out.println(sql);
			st.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			free(con,st,null);
		}
	}

	//根据用户编号获得所有订单
	public List<OrderShow> getOrdersByUserId(int userId)
	{
	
		List<OrderShow> list = new ArrayList<OrderShow>();
		return list;
	}
	
	//根据订单编号修改订单状态
	public void updateOrderSatatus(int orderid,int tradeStatus)
	{
	
	
	}
	//将评价分数加入到数据库
	public void addEvalute(int orderid,int score )
	{
		
	}
	
	//根据订单编号删除订单
	public void deleteOreder(int orderid)
	{
		
	}
	//根据用户编号修改用户的余额  money=用户余额
	public void updateusermoney(int userid,double money){
		
	}
	//根据订单编号获得订单的总金额
	public double getmoneybyid(String orderid){
		 double money=0;
		 return money;
	}
}
