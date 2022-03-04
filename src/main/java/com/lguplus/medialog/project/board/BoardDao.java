package com.lguplus.medialog.project.board;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	List<Board> selectBoardList();
	
	void uploadBoard(Board board);
	
	Board getBoardDetail(int id);

}
