//package com.lguplus.medialog.project.board;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.lguplus.medialog.project.board.Board;
//import com.lguplus.medialog.project.board.BoardService;
//import com.lguplus.medialog.project.common.dto.RestResult;
//import com.lguplus.medialog.project.common.utils.SpringUtils;
//
//import lombok.AllArgsConstructor;
//import lombok.Data;
//
//@Controller
//@RequestMapping("/page/board")
//public class BoardController2 {
//	private final Logger logger = LoggerFactory.getLogger(getClass());
//	@Autowired
//	private BoardService svc;
//
//	@GetMapping("")
//	public String boardHome() {
//		return "board/board.empty";
//	}
//	@RequestMapping("boardList")
//	public String boardList(HttpServletRequest req, ModelMap modelMap,
//			@ModelAttribute("boardSearch") BoardSearch boardSearch) {
//		String jspPath = req.getRequestURI();
//
//		int pageSize = boardSearch.getPageSize();// 한페이지에 나오는 게시물 개수
//		int pageIndex = boardSearch.getPageIndex(); // 현재 선택한 페이지 number
//		int pageGroupSize = boardSearch.getPageGroupSize(); // 페이지 번호가 몇개 나오느냐 개수
//		int startRow = (pageIndex - 1) * pageSize + 1;// 한 페이지의 시작글 번호
//		int endRow = pageIndex * pageSize;// 한 페이지의 마지막 글번호
//
//		boardSearch.setStartRow(startRow);
//		boardSearch.setEndRow(endRow);
//		int count = svc.boardCount(boardSearch); // 게시물 총 개수
//
//		int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
//		int nowPageGroup = (int) Math.ceil((double) pageIndex / pageGroupSize);
//
//		List<Board> boardList = svc.boardList(boardSearch);
//	    modelMap.put("pageIndex", pageIndex);
//	    modelMap.put("pageSize", pageSize);
//	    modelMap.put("count", count);
//	    modelMap.put("pageGroupSize", pageGroupSize);
//	    modelMap.put("nowPageGroup", nowPageGroup);
//	    modelMap.put("pageGroupCount", pageGroupCount);
//	    modelMap.put("articleList", boardList);
//	    modelMap.put("boardSearch", boardSearch);
//	     
//	        return jspPath;
//
//
//	}
//
//	@GetMapping("page") // 글쓰기
//	public String page() {
//		return "board/somePage.empty";
//	}
//	@PostMapping("page/write")
//	public String uploadBoard(Board board, BoardService boardService) {
//		boardService.uploadBoard(board);
//		
//		return "redirect:/page/board";
//	}
//	
//	@GetMapping("view")
//	public String view() {
//		return "board/view.empty";
//	}
//}