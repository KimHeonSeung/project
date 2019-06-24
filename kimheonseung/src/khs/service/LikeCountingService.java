package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class LikeCountingService implements Service {
	private Total_BoardDAO total_BoardDAO = new Total_BoardDAO();
	
	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		Boolean like_count_p = (Boolean)values.get("like_count_p");
		Boolean like_count_m = (Boolean)values.get("like_count_m");
		Integer article_num = (Integer)values.get("article_num");
		
		if(like_count_m == false && like_count_p == true) {
			total_BoardDAO.upLikeCount(conn, article_num);
		} else if (like_count_m == true && like_count_p == false) {
			total_BoardDAO.downLikeCount(conn, article_num);
		}
		
		
		
		return result;
	}
}







