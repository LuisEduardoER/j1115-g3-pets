package com.java.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

// session �� ���Լ����� 
public class MySessionAttrListener implements HttpSessionAttributeListener{

	// �������Ե���ӣ��� �����ᱻ����
	public void attributeAdded(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		HttpSession session = event.getSession();
		session.setAttribute("a", "a1");
		 
		System.out.println("add......");
	}

	// �����Ƴ�ʱ�������˷���
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("remove......");
	}

	// ���Ը���ʱ��������
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub
		System.out.println("replace......");
	}

}

//��վ����������ͳ�ƣ�����ҳ��ˢ�»����ӷ��������� 
//ͳ�ƣ� ��ǰ�����������ܷ���������  ����л�Ա���ܣ�����Ҫ���ӣ������ο������������߻�Ա������
//ע�⣺�������������ܷ�������Ҳ�������㡣��Ҫ���ݱ��档
