package kr.co.overscore.controller;

import java.util.List;

import kr.co.overscore.model.board.BoardListModel;
import kr.co.overscore.model.board.BoardModel;
import kr.co.overscore.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
	public String listmain(Model model, 
			@PathVariable("boardId") String boardId) {
		return list(model, boardId, 1);
	}
	
	@RequestMapping(value = "/board/{boardId}/list/{pageId}", method = RequestMethod.GET)
	public String list(Model model, 
			@PathVariable("boardId") String boardId, 
			@PathVariable("pageId") int pageId) {
		
		BoardModel board = boardService.getBoard(boardId);
		if(board != null){
			List<BoardListModel> boardList = boardService.getBoardList(boardId, pageId);
			
			model.addAttribute("board", board);
			model.addAttribute("boardList", boardList);
			
			return "board/list";
		}else{
			return "404";
		}
		
	}
	
	@RequestMapping(value = "/board/{boardId}/view/{listIdx}", method = RequestMethod.GET)
	public String view(Model model, 
			@PathVariable("boardId") String boardId, 
			@PathVariable("listIdx") String listIdx) {
		return "board/view";
	}
	
	@RequestMapping(value = "/board/{boardId}/write", method = RequestMethod.GET)
	public String write(Model model, 
			@PathVariable("boardId") String boardId) {
		return "board/write";
	}
	
	@RequestMapping(value = "/board/{boardId}/delete/{id}", method = RequestMethod.GET)
	public String delete(Model model, 
			@PathVariable("boardId") String boardId, 
			@PathVariable("id") String id) {
		return "board/delete";
	}
	
	@RequestMapping(value = "/board/{boardId}/modify/{id}", method = RequestMethod.GET)
	public String modify(Model model, 
			@PathVariable("boardId") String boardId, 
			@PathVariable("id") String id) {
		return "board/modify";
	}
}
