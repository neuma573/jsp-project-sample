package com.lguplus.medialog.project.board;

import java.util.List;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	@Autowired
	private BoardDao dao;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	long start = System.currentTimeMillis();


	public List<Board> selectBoardList()  {
		
		return dao.selectBoardList();
	}
	public void uploadBoard(Board board) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss.Sec");
		LocalDateTime now = LocalDateTime.now();
		dao.uploadBoard(board);
	}

	public Board getBoardDetail(int id) throws Exception{
		return dao.getBoardDetail(id);
	}
	

}
