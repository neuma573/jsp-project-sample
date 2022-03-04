//package com.lguplus.medialog.project.board;
//
//import java.util.List;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//@Service
//public class BoardService2 {
//	private final Logger logger = LoggerFactory.getLogger(getClass());
//	long start = System.currentTimeMillis();
//	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss.Sec");
//	LocalDateTime now = LocalDateTime.now();
//	@Autowired
//	private BoardDao dao;
//	public int boardCount(BoardSearch boardSearch) {
//
//		return dao.boardCount(boardSearch);
//
//	}
//
//
//
//	public List<Board> boardList(BoardSearch boardSearch){
//		long finish = System.currentTimeMillis();
//		double elapsedTime = (finish - start)/1000d;
//		logger.debug("build new menu tree... ({}) elapsed={}", boardSearch, elapsedTime);
//		return dao.boardList(boardSearch);
//
//	}
//	
//	public void uploadBoard(Board board) {
//
//		board.setBoardRegDt(now.format(formatter));
//		dao.uploadBoard(board);
//	}
//
//
//
//
//
//}
