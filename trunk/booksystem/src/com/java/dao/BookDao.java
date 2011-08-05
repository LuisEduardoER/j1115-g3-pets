package com.java.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts.upload.FormFile;

public class BookDao {

	public Connection getConnection() throws ClassNotFoundException,
			SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "driver:oracle:thin:@127.0.0.1:1521:orcl";
		return DriverManager.getConnection(url, "scott", "tiger");
	}

	public void free(Connection con, Statement st, ResultSet rs) {
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

	public boolean newBook(int id, String name, String author, String publisher,
			String publish_date, String price, String brief) {

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		boolean b = false;

		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "INSERT INTO b_book VALUES(" 
					+ id
					+ ",'"
					+ name
					+ "','"
					+ author
					+ "','"
					+ publisher
					+ "',to_date('"
					+ publish_date
					+ "','YYYY-MM-DD'),"
					+ "to_number('" 
					+ price 
					+ "','999999.99'),'"
					+ brief
					+ "')";
//			System.out.println(sql);
			if (st.executeUpdate(sql) == 1) {
				b = true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			free(con, st, rs);
		}

		return b;
	}

	public boolean checkUser(String username, String password) {
		
		boolean b = false;
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select upass from b_user where uname='"+username+"' and upass='"+password+"'";
			rs = st.executeQuery(sql);
			if(rs.next()){
				b = true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public List<Book> getBookList() {
		List<Book> list = new ArrayList<Book>();
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			st = con.createStatement();
			String sql = "select * from b_book";
			rs = st.executeQuery(sql);
			while(rs.next()){
				Book book = new Book();
				
				book.setId(rs.getInt(1));
				book.setName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPublisher(rs.getString(4));
				Date d = rs.getDate(5);
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//				System.out.println(df.format(d));
				book.setPublishDate(df.format(d));
				
				DecimalFormat dformat = (DecimalFormat)(NumberFormat.getInstance());
				dformat.applyPattern("#.00");
//				System.out.println(dformat.format(rs.getDouble(6)));
				book.setPrice(dformat.format(rs.getDouble(6)));
				book.setBrief(rs.getString(7));
				
				list.add(book);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
