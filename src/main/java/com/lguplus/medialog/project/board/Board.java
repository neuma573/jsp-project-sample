package com.lguplus.medialog.project.board;

import lombok.*;

@Data
public class Board extends BoardPaging {
	private int boardId; // [PK] BOARD_ID
	private String boardUser; // BOARD_USER
	private String boardName; // BOARD_NM
	private String boardCont; // BOARD_CONTENT
	private String boardRegDt; // BOARD_REG_DT
	private String boatdDelDt; // BOARD_DEL_DT
	private String boardModDt; // BOARD_MOD_DT
	private int boardView; // BOARD_VIEW
	private int boardComment; // BOARD_COMMENT
	private int boardLikes; // BOARD_LIKES



    public Board() {
    // TODO Auto-generated constructor stub
    }
 

}