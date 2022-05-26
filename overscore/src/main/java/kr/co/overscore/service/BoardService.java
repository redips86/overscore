package kr.co.overscore.service;

import java.util.List;

import kr.co.overscore.model.board.BoardListModel;
import kr.co.overscore.model.board.BoardModel;
import kr.co.overscore.persistence.BoardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public BoardModel getBoard(String boardId){
		return boardMapper.selectBoard(boardId);
	}
	
	public List<BoardListModel> getBoardList(String boardId, int pageId){
		boardId = "board_" + boardId;
		return boardMapper.selectBoardList(boardId, pageId);
	}
	
}
