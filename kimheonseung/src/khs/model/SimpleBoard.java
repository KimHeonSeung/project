package khs.model;

import java.util.*;
import java.sql.*;
import java.text.*;

public class SimpleBoard {
	private int board_id;
	private int article_num;
	private String writer_nick;
	private String article_title;
	private Timestamp write_date;
	private int read_count;
	private int like_count;
	
	public SimpleBoard() {}
	
	public SimpleBoard(int board_id, int article_num, String writer_nick, String article_title, Timestamp write_date,
			int read_count, int like_count) {
		super();
		this.board_id = board_id;
		this.article_num = article_num;
		this.writer_nick = writer_nick;
		this.article_title = article_title;
		this.write_date = write_date;
		this.read_count = read_count;
		this.like_count = like_count;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getArticle_num() {
		return article_num;
	}

	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}

	public String getWriter_nick() {
		return writer_nick;
	}

	public void setWriter_nick(String writer_nick) {
		this.writer_nick = writer_nick;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	
	
}
	
