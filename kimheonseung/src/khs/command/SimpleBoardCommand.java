package khs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class SimpleBoardCommand extends Command {
	private String formPage = "/WEB-INF/forms/simple_board.jsp";
	private String submitPage = "/WEB-INF/submits/simple_board.jsp";
	private String errorPage = "/WEB-INF/errors/simple_board.jsp";

	private SimpleBoardService saService = new SimpleBoardService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
		String strBoard_id = request.getParameter("board_id");
		Integer board_id = null;
		board_id = Integer.parseInt(strBoard_id);
		
		request.setAttribute("board_id", board_id);
		try (Connection conn = ConnectionProvider.getConnection()) {

			HashMap<String, Object> values = new HashMap<>();
			values.put("conn", conn);
			values.put("board_id", board_id);
			
			HashMap<String, Object> resultMap = saService.service(values);
			
			
			ArrayList<SimpleBoard> simpleBoard = (ArrayList<SimpleBoard>) resultMap.get("simpleBoard");

			request.setAttribute("simpleBoard", simpleBoard);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return formPage;
	}

	// POST 요청일 경우의 처리 로직을 구현하는 메소드
	protected String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

}
