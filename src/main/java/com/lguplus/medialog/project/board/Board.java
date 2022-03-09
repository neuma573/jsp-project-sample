package com.lguplus.medialog.project.board;

import lombok.*;


//게시판 객체
@Data
public class Board {
	private int boardId; // [PK] BOARD_ID
	private String boardUser; // BOARD_USER
	private String boardNm; // BOARD_NM
	private String boardContent; // BOARD_CONTENT
	private String boardRegDt; // BOARD_REG_DT
	private String boardDelDt; // BOARD_DEL_DT
	private String boardModDt; // BOARD_MOD_DT
	private int boardView; // BOARD_VIEW
	private int boardComment; // BOARD_COMMENT



    public Board() {
    // TODO Auto-generated constructor stub
    }
 

}