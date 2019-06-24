package khs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class DetailBoardCommand extends Command {
	private String formPage = "/WEB-INF/forms/detail_board.jsp";
	private String submitPage = "/WEB-INF/submits/detail_board.jsp";
	private String errorPage = "/WEB-INF/errors/detail_board.jsp";

	private LikeCheckService lcService = new LikeCheckService();
	private DetailBoardService dbService = new DetailBoardService();
	private DetailBoardReadCountService dbrcService = new DetailBoardReadCountService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = null;
		String user_id = null;
		if(session!=null && session.getAttribute("login_user")!=null) {
			user = (User)session.getAttribute("login_user");
			user_id = user.getUser_id();
		}
		
		String strArticle_num = request.getParameter("article_num");
		Integer article_num = null;
		article_num = Integer.parseInt(strArticle_num);
		
		
		request.setAttribute("article_num", article_num);
		
		DetailBoard detailBoard = new DetailBoard();
		detailBoard.setArticle_num(article_num);
		boolean result = false;
		try (Connection conn = ConnectionProvider.getConnection()) {

			HashMap<String, Object> values = new HashMap<>();
			values.put("conn", conn);
			values.put("article_num", article_num);
			values.put("detailBoard", detailBoard);
			values.put("user_id", user_id);

			
			dbrcService.service(values);
			
			HashMap<String, Object> resultMap = dbService.service(values);
			
			detailBoard = (DetailBoard)resultMap.get("detailBoard");
					
			request.setAttribute("detailBoard", detailBoard);
			request.setAttribute("read_count", detailBoard.getRead_count());
			request.setAttribute("like_count", detailBoard.getLike_count());
			
			resultMap = lcService.service(values);
			request.setAttribute("like_check", (boolean)resultMap.get("like_check"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("user_id", user_id);
		request.setAttribute("article_num", article_num);
		return formPage;
	}

	// POST 요청일 경우의 처리 로직을 구현하는 메소드
	protected String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

}
