package com.lguplus.medialog.project.board;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

// 매퍼 클래스
@Mapper
public interface BoardDao {
	List<Board> selectBoardList();
	
	void uploadBoard(Board board);
	
	Board getBoardDetail(int id);
	
	public void boardModifyRegist(Board board);
	
	public void boardDelete(int id) throws Exception;
	
	public int boardViewUpdate(int id);

	void commentPost(BoardComment comment);
	
	List<BoardComment> openCommentList(int id);
	
	public void addCommentCnt(int id);
	
	public void subCommentCnt(int id);
	
	public void commentDelete(int id);
}
