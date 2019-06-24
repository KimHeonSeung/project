package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class UserUpdateService implements Service {
	private UserDAO userDAO = new UserDAO();

	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		User user = (User)values.get("user");
		
		String type = (String)values.get("type");
		
		if( type.equals("isLogin") ) {
			result.put("result", userDAO.updateCountday(conn, user));
		} else if( type.equals("user_update") ) {
			result.put("updateResult", userDAO.updateInfo(conn,user));
		}
		
		return result;
	}
}
