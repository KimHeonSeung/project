package khs.dao;

import java.sql.*;
import java.util.*;
import java.util.Date;

import khs.jdbc.util.*;
import khs.model.*;

public class DetailBoardDAO {
	private DetailBoard getInstance(ResultSet rs) throws SQLException {		
		DetailBoard obj = new DetailBoard(
				rs.getInt("article_num"),
				rs.getString("article_title"),
				rs.getString("writer_nick"),
				rs.getString("article_content"),
				rs.getTimestamp("write_date"),
				rs.getInt("read_count"),
				rs.getInt("like_count"));
		return obj;
	}
	
	
	public DetailBoard select(Connection conn, int article_num) {
		DetailBoard result = null;
		String sql = "select * from detailBoard where article_num=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, article_num);
			rs = pstmt.executeQuery();
			
			if( rs.next() )
				result = getInstance(rs);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		Closer.close(rs);
		Closer.close(pstmt);
		
		return result;
	}
	
	
	public boolean updateReadCount(Connection conn, DetailBoard obj) {
		boolean result = false;
		String sql = "update total_board set read_count=read_count+1 where article_num=?";
		
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, obj.getArticle_num());
			result = pstmt.executeUpdate() == 1 ? true : false;
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		Closer.close(pstmt);
		
		return result;
	}

}
