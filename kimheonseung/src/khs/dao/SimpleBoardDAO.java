package khs.dao;

import java.sql.*;
import java.util.*;
import java.util.Date;

import khs.jdbc.util.*;
import khs.model.*;

public class SimpleBoardDAO {
	private SimpleBoard getInstance(ResultSet rs) throws SQLException {		
		SimpleBoard obj = new SimpleBoard(
				rs.getInt("board_id"),
				rs.getInt("article_num"),
				rs.getString("writer_nick"),
				rs.getString("article_title"),
				rs.getTimestamp("write_date"),
				rs.getInt("read_count"),
				rs.getInt("like_count"));
		return obj;
	}
	
	
	public ArrayList<SimpleBoard> selectSimpleBoard(Connection conn, int board_id) {
		ArrayList<SimpleBoard> result = new ArrayList<>();
		String sql = "select * from simpleBoard where board_id=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, board_id);
			rs = pstmt.executeQuery();
			
			while( rs.next() )
				result.add(getInstance(rs));
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		Closer.close(rs);
		Closer.close(pstmt);
		
		return result;
	}
	
	
}
	
