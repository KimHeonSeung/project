package khs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class RegistCommand extends Command {
	
	private String formPage = "/WEB-INF/forms/regist.jsp";
	private String submitPage = "/WEB-INF/submits/regist.jsp";
	private String errorPage = "/WEB-INF/errors/regist.jsp";

	private UserRegistService urService = new UserRegistService();
	// private UserRegistService urService = new UserRegistService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
		return formPage;
	}

	// POST 요청일 경우의 처리 로직을 구현하는 메소드
	protected String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nick = request.getParameter("user_nick");
		String strUser_tel = request.getParameter("user_tel");
		int user_tel = -1;
		try {
			user_tel = Integer.parseInt(strUser_tel);
		} catch (Exception e) {
			e.printStackTrace();
			user_tel = -1;
		}
		String user_mail = request.getParameter("user_mail");
		
		String strIsCheckID = request.getParameter("isCheckID");
		boolean isCheckID = Boolean.valueOf(strIsCheckID).booleanValue();
		
		String strIsCheckPW = request.getParameter("isCheckPW");
		boolean isCheckPW = Boolean.valueOf(strIsCheckPW).booleanValue();
		
		String strIsCheckPWConfirm = request.getParameter("isCheckPWConfirm");
		boolean isCheckPWConfirm = Boolean.valueOf(strIsCheckPWConfirm).booleanValue();
		
		String strIsCheckNick = request.getParameter("isCheckNick");
		boolean isCheckNick = Boolean.valueOf(strIsCheckNick).booleanValue();
		
		String strIsCheckTelorMail = request.getParameter("isCheckTelOrMail");
		boolean isCheckTelOrMail = Boolean.valueOf(strIsCheckTelorMail).booleanValue();
		

		boolean isPass = isCheckID && isCheckPW && isCheckPWConfirm && isCheckNick && isCheckTelOrMail;
		boolean result = false;
		
		User user = new User(user_id, user_pw, user_nick, user_tel, user_mail, null, 0);
		if(isPass) {
			
			
			try (Connection conn = ConnectionProvider.getConnection()) {
				
				HashMap<String, Object> values = new HashMap<>();
				values.put("conn", conn);
				values.put("user", user);
				
				
				HashMap<String, Object> resultMap = urService.service(values);
				
				result = (boolean)resultMap.get("result");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} 
		
		ArrayList<Boolean> resultList = new ArrayList<Boolean>();
		resultList.add(isCheckID);
		resultList.add(isCheckPW);
		resultList.add(isCheckPWConfirm);
		resultList.add(isCheckNick);
		resultList.add(isCheckTelOrMail);
		resultList.add(isPass);
		
		
		if (result == true) {
			return submitPage;
		} else {
			request.setAttribute("resultList", resultList);
			request.setAttribute("user_password_confirm", request.getAttribute("user_password_confirm"));
			request.setAttribute("user", user);
			return errorPage;
		}
		
		
	}

}
