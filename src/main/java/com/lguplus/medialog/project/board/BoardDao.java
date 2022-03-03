package com.lguplus.medialog.project.board;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	int boardCount(BoardSearch boardSearch);
	List<Board> boardList(BoardSearch boardSearch);
	
	void uploadBoard(Board board);

}
