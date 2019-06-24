package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class Like_InfoService implements Service {
	private Like_InfoDAO like_InfoDAO = new Like_InfoDAO();
	
	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		String user_id = (String)values.get("user_id");
		Integer article_num = (Integer)values.get("article_num");
		Boolean like_result = (Boolean)values.get("like_check");
		
		Like_Info li = new Like_Info(user_id, article_num);
		
		if(like_result == true) {
			like_InfoDAO.like_cancle(conn, li);
			result.put("like_result", false);
		} else {
			like_InfoDAO.like_ok(conn, li);
			result.put("like_result", true);
		}
		
		return result;
	}
}







