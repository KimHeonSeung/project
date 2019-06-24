package khs.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.*;
import khs.jdbc.util.*;
import khs.model.*;
import khs.service.*;

public class Board_InfoCommand extends Command {
	private String formPage = "/WEB-INF/forms/board.jsp";
	private String submitPage = "/WEB-INF/submits/board.jsp";
	private String errorPage = "/WEB-INF/errors/board.jsp";

	private Board_InfoService biService = new Board_InfoService();

	protected String processForm(HttpServletRequest request, HttpServletResponse response) {
		try (Connection conn = ConnectionProvider.getConnection()) {

			HashMap<String, Object> values = new HashMap<>();
			values.put("conn", conn);
			
			HashMap<String, Object> resultMap = biService.service(values);

			if (!(boolean) resultMap.get("result")) {
				request.setAttribute("errorMsg", "게시판이 존재하지 않습니다.");
			}

			ArrayList<Board_Info> boardList = (ArrayList<Board_Info>) resultMap.get("boardList");

			request.setAttribute("boardList", boardList);
			
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
