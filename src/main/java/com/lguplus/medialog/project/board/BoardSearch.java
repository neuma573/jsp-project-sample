package com.lguplus.medialog.project.board;

import com.lguplus.medialog.project.board.BoardPaging;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
public class BoardSearch extends BoardPaging {
	  private String title;
	  private String usr_id;
	  private long bbs_sno;
	  private long blt_rsrc_sno;
	  
}
