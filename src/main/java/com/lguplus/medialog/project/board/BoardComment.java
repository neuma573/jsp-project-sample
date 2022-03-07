package com.lguplus.medialog.project.board;

import lombok.*;


// 게시판 댓글 객체
@Data
public class BoardComment {
	private int commentId;
	private int commentUpper;
	private int commentParent;
	private int commentDepth;
	private int commentOrder;
	private String commentUser;
	private String commentContent;
	private String commentRegDt;
	private String commentModDt;
	private String commentDelDt;
	private int commentLikes;
	
	
	BoardComment() {
		
	}
	
	
}
