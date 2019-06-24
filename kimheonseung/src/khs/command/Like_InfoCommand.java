package khs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.io.PrintWriter;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class Like_InfoCommand extends Command {

	private Like_InfoService liService = new Like_InfoService();
	private LikeCheckService lcService = new LikeCheckService();
	private LikeCountingService lctService = new LikeCountingService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	// POST 요청일 경우의 처리 로직을 구현하는 메소드
	protected String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String strArticle_num = request.getParameter("article_num");
		Integer article_num = null;
		article_num = Integer.parseInt(strArticle_num);
		
		boolean like_check = false;
		Boolean like_result = null;
		
		// ajax로 보낼 result. 좋아요 됐으면 true, 좋아요 취소면 false가 전달되게 만든다.
		Boolean result = null;
		
		try (Connection conn = ConnectionProvider.getConnection()) {

			HashMap<String, Object> values = new HashMap<>();
			values.put("conn", conn);
			values.put("user_id", user_id);
			values.put("article_num", article_num);
			
			HashMap<String, Object> resultMap = lcService.service(values);
			like_check = (boolean)resultMap.get("like_check");
			values.put("like_check", like_check);
			
			resultMap = liService.service(values);
			
			// like result는 좋아요 결과가 true, 좋아요 취소 결과가 false이다.
			like_result = (Boolean)resultMap.get("like_result");
			
			// 좋아요가 true 인 경우 totla_board에서 likecount를 1 올린다.
			if(like_result == true) {
				values.put("like_count_p", like_result);
				values.put("like_count_m", !like_result);
				lctService.service(values);
			} else if (like_result == false) {
				values.put("like_count_p", like_result);
				values.put("like_count_m", !like_result);
				lctService.service(values);
			}
			
			result = like_result;
			request.setAttribute("like_result", like_result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/plane;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.println(result);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
