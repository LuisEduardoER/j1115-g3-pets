package cn.thepetshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class PetDAO {
	
	/**
	 * �������ݿ�
	 * @return ����һ��Connection
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
	 * �رո�������
	 * @param con ��Ҫ�رյ�Connecion����
	 * @param st ��Ҫ�رյ�Statement����
	 * @param rs ��Ҫ�رյ�ResultSet����
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
	 * ���ڵ�½ʱ��֤�û���������
	 * @param username �����û���
	 * @param password ��������
	 * @return boolean ��֤�ɹ�����true�����򷵻�false
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
	 * ����ע��ʱ�����û�
	 * @param username �û���
	 * @param password ����
	 * @return boolean ע��ɹ��󷵻�true��ʧ�ܷ���false
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
	 * ��ȡ�û�id
	 * @param username ����ֵusername
	 * @return �����û�id
	 */
	public int getUid(String username) {
		int userid = 0;// �û�u_id

		return userid;
	}
	
	/**
	 * ��ȡ�����б�
	 * @param userid �û�id
	 * @return ���ظ��û�id�����ж����б�
	 */
	public List<Integer> getOrders(int userid) {
		List<Integer> list = new ArrayList<Integer>();
		return list;
	}
	
	/**
	 * ����p_goods��������Ʒ��ţ�������Ʒ���ƣ��۸񣬼�飻
	 * @param goodsid ��Ʒid
	 * @return ��Ʒ����
	 */
	public Goods getGoods(int goodsid) {
		Goods goods = new Goods();
		return goods;
	}
}
