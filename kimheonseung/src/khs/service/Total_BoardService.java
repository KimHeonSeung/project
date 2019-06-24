package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class Total_BoardService implements Service {
	private Total_BoardDAO total_BoardDAO = new Total_BoardDAO();
	
	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		Total_Board total_Board = (Total_Board)values.get("total_Board");
		
		result.put("result", total_BoardDAO.insert(conn, total_Board));
		
		return result;
	}
}







