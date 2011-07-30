package com.java.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmpDao {
	

	// EmpList

	public List findEmpList(int start,int end) {
		List list = new ArrayList();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select * from (select e.*, rownum rn from emp e) where rn >="+start+" and rn <="+end;
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Emp emp = new Emp();
				emp.setEmpno(rs.getString(1));
				emp.setEname(rs.getString(2));
				emp.setJob(rs.getString(3));
				emp.setMgr(rs.getString(4));
				Date d = rs.getDate(5);
				if (d != null) {
					emp.setHiredate(d.toString());
				}
				emp.setSal(rs.getString(6));
				emp.setComm(rs.getString(7));
				emp.setDeptno(rs.getString(8));
				list.add(emp);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			free(con, st, rs);
		}

		return list;
	}

	public int getRowCount(){
		int count = 0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql ="select count(empno) from emp";
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

	private Connection getConnection() throws ClassNotFoundException,
			SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl2";
		Connection con = DriverManager.getConnection(url, "scott", "tiger");
		return con;
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
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


}
