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
		dao.uploadBoard(board);
	}

	public Board getBoardDetail(int id) throws Exception{
		return dao.getBoardDetail(id);
	}
	
    public void boardModifyRegist(Board board) throws Exception {
        dao.boardModifyRegist(board);
    }
    // 게시글 삭제
    public void boardDelete(int id) throws Exception {
        dao.boardDelete(id);
    }
	// 조회수 올리기
	public int boardViewUpdate(int id) throws Exception {
		return dao.boardViewUpdate(id);
	}
	public void commentPost(BoardComment comment) {
		dao.commentPost(comment);
	}
	
	public List<BoardComment> openCommentList(int id){
		return dao.openCommentList(id);
	}
	public void addCommentCnt(int id) {
		dao.addCommentCnt(id);
	}
	
	public void subCommentCnt(int id) {
		dao.subCommentCnt(id);
	}
	public void commentDelete(int id) {
		dao.commentDelete(id);
	}





	

}
