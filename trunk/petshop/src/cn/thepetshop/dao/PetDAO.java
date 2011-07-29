package cn.thepetshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class PetDAO {

	private Connection getConnection() throws SQLException,
			ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "driver:oracle:thin:@127.0.0.1:1521:orcl";
		return DriverManager.getConnection(url, "scott", "tiger");
	}

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
	 * 
	 * @param username
	 * @param password
	 * @return boolean
	 * 用于登陆时查询用户名及密码
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
		}finally{
			free(con,st,rs);
		}
		return b;
	}

	/**
	 * 
	 * @param username
	 * @param password
	 * @return boolean
	 * 用于注册时新增用户
	 * 
	 */
	public boolean register(String username,String password) {
		boolean b = false;
		Connection con=null;
		Statement st=null;
		try {
			con=getConnection();
			st=con.createStatement();
			String sql="insert into p_users (u_name,u_pass) values('"+username+"','"+password+"')";
			if(st.executeUpdate(sql)==1){
				b=true;
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
	 * 操作P_users表，传入用户名username，返回用户编号
	 */
	 public int getUid(String username){
		 int userid=0;//用户u_id
		 
		 return userid;
	 }
	/**
	 * 操作P_orders表，传入用户编号，返回里面的信息（除了用户编号）
	 */
	 public List getPorders(int userid){
		 List list=new ArrayList();
		 
		 return list;
		 
	 }
	 /**
	  * 操作p_cart表，传入用户编号，返回商品编号
	  */
	public int getGoodid(int userid){
		int goodid=0;
		return goodid;
	}
	/**
	 * 操作P_goods表，传入商品编号，返回商品名称，价格，简介；
	 */
	public List getGoods(int goodid){
		List l=new ArrayList();
		return l;
	}
}
