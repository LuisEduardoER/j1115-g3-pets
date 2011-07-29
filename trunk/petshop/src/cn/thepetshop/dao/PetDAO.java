package cn.thepetshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class PetDAO {
	
	/**
	 * 连接数据库
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
	 * @param con 需要关闭的Connecion对象
	 * @param st 需要关闭的Statement对象
	 * @param rs 需要关闭的ResultSet对象
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
	 * @param username 传入用户名
	 * @param password 传入密码
	 * @return boolean 验证成功返回true，否则返回false
	 * 
	 */
	public boolean login(String username, String password) {
		boolean b = false;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select u_name,u_pass from p_users where u_name='"
					+ username + "' and u_pass='" + password + "'";
			rs = st.executeQuery(sql);
			if (rs.next()) {
				b = true;
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
		return b;
	}
	
	/**
	 * 用于注册时新增用户
	 * @param username 用户名
	 * @param password 密码
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
		}
		return b;
	}
	
	/**
	 * 获取用户id
	 * @param username 传入值username
	 * @return 返回用户id
	 */
	public int getUid(String username) {
		int userid = 0;// 用户u_id

		return userid;
	}
	
	/**
	 * 获取订单列表
	 * @param userid 用户id
	 * @return 返回该用户id的所有订单列表
	 */
	public List<Integer> getOrders(int userid) {
		List<Integer> list = new ArrayList<Integer>();
		return list;
	}
	
	/**
	 * 操作p_goods表，传入商品编号，返回商品名称，价格，简介；
	 * @param goodsid 商品id
	 * @return 商品对象
	 */
	public Goods getGoods(int goodsid) {
		Goods goods = new Goods();
		return goods;
	}
}
