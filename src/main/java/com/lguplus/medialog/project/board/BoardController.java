package com.lguplus.medialog.project.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lguplus.medialog.project.common.dto.RestResult;

import lombok.AllArgsConstructor;
import lombok.Data;

@Controller
@RequestMapping("/page/board")
public class BoardController {

	@GetMapping("")
	public String boardHome() {
		return "board/board.empty";
	}

	@GetMapping("page")
	public String page() {
		return "board/somePage.empty";
	}

	@GetMapping("api")
	@ResponseBody
	public RestResult<?> api() {
		return new RestResult<Article>()
				.setData(new Article(1, "공지사항 1"));
	}

	@Data
	@AllArgsConstructor
	static class Article {
		private int id;
		private String title;
	}

}
