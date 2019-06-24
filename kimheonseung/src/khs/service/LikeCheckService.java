package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class LikeCheckService implements Service {
	private Like_InfoDAO like_InfoDAO = new Like_InfoDAO();
	
	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		String user_id = (String)values.get("user_id");
		Integer article_num = (Integer)values.get("article_num");
		Like_Info li = new Like_Info(user_id, article_num);
		
		if (like_InfoDAO.like_check(conn, li) == true) {
			result.put("like_check", true);
		} else {
			result.put("like_check", false);
		}
		
		
		return result;
	}
}







