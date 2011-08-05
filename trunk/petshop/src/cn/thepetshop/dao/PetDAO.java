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
	 * �������ݿ�
	 * 
	 * @return ����һ��Connection
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
	 * �رո�������
	 * 
	 * @param con
	 *            ��Ҫ�رյ�Connecion����
	 * @param st
	 *            ��Ҫ�رյ�Statement����
	 * @param rs
	 *            ��Ҫ�رյ�ResultSet����
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
	 * 
	 * @param username �����û���
	 * @param password ��������
	 * @return boolean ��֤�ɹ�����true�����򷵻�false
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
	 * ����ע��ʱ�����û�
	 * 
	 * @param username
	 *            �û���
	 * @param password
	 *            ����
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
		}finally{
			free(con,st,null);
		}
		return b;
	}

	/**
	 * ��ȡ�û�id
	 * 
	 * @param username
	 *            ����ֵusername
	 * @return �����û�id
	 */
	public int getUid(String username) {
		int userid = 0;// �û�u_id
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
	 * �����û�userid��ѯ���û�������Ϣ
	 * 
	 * @param username
	 * @return User(һ���û�)
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
	 * �޸��û�������ķ���
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
	 * �õ�һ���޶�����ΪOrder��List
	 * @param userid �û�id
	 * @return ����һ���޶�����ΪOrder��List
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
	 * �޸Ĺ���Ա���룬���ж�ԭ�����Ƿ���ȷ�ٽ����޸�
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
				str="�����޸ĳɹ�";
			}else{
				str="ԭ�������";
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
	 * �����ṩ����𣬷�����Ʒid�������Լ��۸��list
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
	 * ���ĳһ����Ʒ�ܸ���
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
	 * �ж�һ��������������໹���ӷ���
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
	 * �������еĸ�����
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
	 * ����cid���޸ĸ����������
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
	 * ��Ӹ����������
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
	 * ���ݶ���id��ȡ�����ں��е���Ʒlist
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
	 * �����û�id��ȡ�û����ж�����Ϣ
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
	 * ���ݶ�������޸Ķ���״̬
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
	 * �����۷������뵽���ݿ�
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
	 * ���ݶ������ɾ������
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
	 * �����û�����޸��û������  mo
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
	 * ���ݴ������Ʒid���µ�������
	 * �����ݿ�Ĺ��ﳵ���ȡ����������
	 * 
	 * @param userid �û�id
	 * @param goodsid ��Ʒid
	 * @param newnum ��Ҫ�޸ĵ�����
	 * @return ����޸ĳɹ����� "changesuccess"
	 * ����޸�ʱ��Ʒ��治�㣬�򷵻���Ʒ���������Stringֵ
	 * ����޸�ʱ���ִ��������͹��ﳵ������ͬ�򷵻�"unchange"
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
	 * ɾ���û����ﳵ��һ����Ʒ��Ϣ
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
	 * ���ݸ�����cid��ȡ�ӷ���
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
	 * �õ��û��Ĺ��ﳵ����
	 * @param userid �û�id
	 * @return �����û��Ĺ��ﳵ
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
	 * ɾ���ӷ���
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
	 * ����ӷ���
	 * @param pid �������ĸ�������
	 * @param addcname ��ӵ��ӷ�������
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
	 * �޸��ӷ��ಢ����������
	 * @param pno �������ĸ�������
	 * @param newname �޸ĵ��ӷ�������
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
	 * ���������������������Ϣ
	 * @param userid �û�id
	 * @param receiver ������
	 * @param address ��ַ
	 * @param phone �绰����
	 * @return ����һ��OrderInfo����
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
	 * ���ݶ�������Ʒ�������������Ʒʣ�����
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
	 * ���ݶ�������Ʒ�������������Ʒ��������
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
	 * �����û�id����û����ﳵ
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
	 * ��ȡ������Ʒ��Ϣ���б�
	 * @param 
	 * @return list ������Ʒ������б�
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
	 * �����û�����ѯ�Ƿ���ڸ��û�
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
	 * ���ݸ������ѯ����������ӷ���
	 * @param cid
	 * @return ��Ӧ�ӷ���
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
	 * �������Ʒ
	 * @param cid
	 * @return ��Ӧ�ӷ���
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
	 * ���������Ʒ�ܸ���
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
	 * ����G_ID��ȡ��Ʒ��Ϣ���б�
	 * @param 
	 * @return list ��Ʒ��Ϣ���б�
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
	 
	 * �޸���Ʒ��Ϣ
	 * @param gid ��Ʒid
	 * @param gname ��Ʒ����
	 * @param gnum ��Ʒʣ������
	 * @param gprice ��Ʒ�۸�
	 * @param gbrief ��Ʒ����
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
	 * �����û��ṩ�������ؼ��������������иùؼ��ʵ���Ʒ
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
	 * �õ��û���ѯ����Ʒ����
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
	 * ɾ����Ʒ��Ϣ
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
	 * ��ȡ���и������map����
	 * @return ����Ķ��󣬼���c_id ֵ��c_name
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
	 * �������з���
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
	 * ����ĳ�ض������µ�����
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
	 * ��ȡ���ж������б�
	 * @param 
	 * @return list ���ж���������б�
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
	 * ɾ��������Ϣ
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
	 * ����Ʒ��������ﳵ
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
	 * ��ù��ﳵ����Ʒ����
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
	 * �ж�һ����Ʒ�Ƿ���ĳ�û��Ĺ��ﳵ��
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
	 * ����oid���Ķ���״̬
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
	 * ������Ʒid�����Ʒ�۳������Լ�ƽ����
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
	 * ��ö�������
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


