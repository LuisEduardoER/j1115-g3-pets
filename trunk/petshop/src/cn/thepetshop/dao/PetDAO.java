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
	 * ���ڵ�½ʱ��ѯ�û���������
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
	 * ����ע��ʱ�����û�
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
	 * ����P_users�������û���username�������û����
	 */
	 public int getUid(String username){
		 int userid=0;//�û�u_id
		 
		 return userid;
	 }
	/**
	 * ����P_orders�������û���ţ������������Ϣ�������û���ţ�
	 */
	 public List getPorders(int userid){
		 List list=new ArrayList();
		 
		 return list;
		 
	 }
	 /**
	  * ����p_cart�������û���ţ�������Ʒ���
	  */
	public int getGoodid(int userid){
		int goodid=0;
		return goodid;
	}
	/**
	 * ����P_goods��������Ʒ��ţ�������Ʒ���ƣ��۸񣬼�飻
	 */
	public List getGoods(int goodid){
		List l=new ArrayList();
		return l;
	}
}
