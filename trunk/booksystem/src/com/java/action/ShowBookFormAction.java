package com.java.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

public class ShowBookFormAction extends Action{

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		if(request.getSession().getAttribute("username") == null){
			ActionMessages messages = new ActionMessages();
			messages.add("logonfirst", new ActionMessage("error.logonfirst"));
			this.saveErrors(request, messages);
			return new ActionForward("LogonView");
		}else{
			return new ActionForward("BookFormView");
		}
	}
}