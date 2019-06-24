package khs.command;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class RegistNickCheckCommand extends Command {

	private UserIDCheckService uicService = new UserIDCheckService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	// POST 요청일 경우의 처리 로직을 구현하는 메소드
	protected String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		String user_nick = request.getParameter("user_nick");

		User user = new User();
		user.setUser_nick(user_nick);
		
		boolean result = false;

		try (Connection conn = ConnectionProvider.getConnection()) {

			HashMap<String, Object> values = new HashMap<>();
			values.put("conn", conn);
			values.put("user", user);
			values.put("type", "nickCheck");
			HashMap<String, Object> resultMap = uicService.service(values);
			result = (boolean)resultMap.get("result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/plane;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.println(result);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
