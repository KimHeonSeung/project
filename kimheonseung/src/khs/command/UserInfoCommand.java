package khs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class UserInfoCommand extends Command {
	private String formPage = "/WEB-INF/forms/user_info.jsp";
	private String submitPage = "/WEB-INF/submits/user_info.jsp";
	private String errorPage = "/WEB-INF/errors/user_info.jsp";

	private UserIDCheckService uicService = new UserIDCheckService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
	
		
		return formPage;
	}

	// POST 요청일 경우의 처리 로직을 구현하는 메소드
	protected String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		User login_user = (User)session.getAttribute("login_user");
		String user_pw_confirm = (String)request.getParameter("user_pw_confirm");
		String type = "idCheck";
		User searchedUser = null;
		boolean result = false;
		
		try (Connection conn = ConnectionProvider.getConnection()) {

			HashMap<String, Object> values = new HashMap<>();
			values.put("conn", conn);
			values.put("user", login_user);
			values.put("type", "idCheck");
			
			HashMap<String, Object> resultMap = uicService.service(values);
			
			searchedUser = (User)resultMap.get("searchedUser");
			result = user_pw_confirm.equals(searchedUser.getUser_pw()) ? true : false;
			if(result == true) {
				return submitPage;
			} else {
				return errorPage;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return errorPage;
	}

}
