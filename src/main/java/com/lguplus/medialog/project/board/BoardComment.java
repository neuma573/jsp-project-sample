package com.lguplus.medialog.project.board;

import lombok.*;


// 게시판 댓글 객체
@Data
public class BoardComment {
	private String commentId;
	private String commentUpper;
	private String commentParent;
	private String commentDepth;
	private String commentOrder;
	private String commentUser;
	private String commentContent;
	private String commentRegDt;
	private String commentModDt;
	private String commentDelDt;
	
	
	BoardComment() {
		
	}
	
	
}
