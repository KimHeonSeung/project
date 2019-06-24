package khs.service;

import java.sql.*;
import java.util.*;
import khs.dao.*;
import khs.model.*;

public class Board_InfoService implements Service {
	private Board_InfoDAO board_InfoDAO = new Board_InfoDAO();
	
	public HashMap<String, Object> service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Connection conn = (Connection)values.get("conn");
		
		result.put("boardList", board_InfoDAO.selectAll(conn));
		result.put("result", result.get("boardList") != null);
		
		return result;
	}
}







