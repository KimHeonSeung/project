package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class UserIDCheckService implements Service {
	private UserDAO userDAO = new UserDAO();
	
	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		User user = (User)values.get("user");
		String type = (String)values.get("type");
		
		if(type.equals("idCheck")) {
			result.put("searchedUser", 
					userDAO.selectOne(conn, user));
			result.put("result", 
					result.get("searchedUser") != null);
		} else if (type.equals("nickCheck")) {
			result.put("searchedUser", 
					userDAO.selectOneNick(conn, user));
			result.put("result", 
					result.get("searchedUser") != null);
		} else if (type.equals("login")) {
			result.put("searchedUser", 
					userDAO.selectOne(conn, user));
			result.put("result", 
					result.get("searchedUser") != null);
		}
		
		return result;
	}
}







