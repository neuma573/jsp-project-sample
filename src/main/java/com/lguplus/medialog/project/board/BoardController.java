package com.lguplus.medialog.project.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lguplus.medialog.project.common.utils.SpringUtils;

@Controller
@RequestMapping("/page/board")
public class BoardController {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private BoardService svc;

//	@GetMapping("")
//	public String boardHome() {
//		return "board/board.empty";
//	}

	//게시판 리스트 출력
	@GetMapping("")
	public String openBoardList(Model model) {
	    List<Board> list = svc.selectBoardList();     //service를 이용하여 게시판 목록을 데이터베이스에서 조회한다.
	    model.addAttribute("list",list);                                //설정한 뷰로 넘겨줄 데이터를 추가
	    return "board/board.empty";
	  }
    //게시판 게시글 디테일
	@GetMapping("view")
	public String openBoardDetail(@RequestParam int id, Model model) throws Exception {
		List<BoardComment> list = svc.openCommentList(id);
		model.addAttribute("list",list);
		svc.boardViewUpdate(id);
		Board board = svc.getBoardDetail(id);
		model.addAttribute("board",board);
		return "board/view.empty";
	}


	//게시판 글작성 폼 호출
	@RequestMapping("/page")
	public String page() {
		return "board/somePage.empty";
	}

	//게시판 글쓰기
	@RequestMapping("/pageWrite")
	public String uploadBoard(Board board) throws Exception {
		String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.Sec"));
		board.setBoardUser("foo");
		board.setBoardRegDt(formatDate);
		svc.uploadBoard(board);
		return "redirect:/page/board";
	}
	
	//게시판 수정폼 호출
    @RequestMapping(value="boardModify")
    public String boardModify(@RequestParam("id") int id, Model model) throws Exception {
        Board board = svc.getBoardDetail(id);
        model.addAttribute("board", board);    
        return "board/boardModify.empty";
    }
    
    // 게시판 글 수정
    @RequestMapping(value="boardModifyRegist")
    public String boardModifyRegist(Board board) throws Exception {
		String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.Sec"));
		board.setBoardModDt(formatDate);
			svc.boardModifyRegist(board);
			
		return "redirect:/page/board";
    }
    
    //게시판 글삭제
    @RequestMapping(value="/boardDelete")
    public String boardDelete(@RequestParam("id") int id) throws Exception {
        
        svc.boardDelete(id);
        return "redirect:/page/board";
    }
    //댓글쓰기
	@RequestMapping(value="/commentPost")
	public String commentPost(@RequestParam("commentUpper") int id, BoardComment comment, Board board) throws Exception {
		comment.setCommentUser("foo");
		svc.commentPost(comment);
		svc.addCommentCnt(id);
		return "redirect:/page/board/view?id="+id;
	}
	//댓글삭제
    @RequestMapping(value="/commentDelete")
    public String commentDelete(@RequestParam("id") int id, @RequestParam("bid") int bid  )  throws Exception {
        svc.commentDelete(id);
        svc.subCommentCnt(bid);
        return "redirect:/page/board";
    }
	
    





}