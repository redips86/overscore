package kr.co.overscore.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.overscore.model.ArticleModel;
import kr.co.overscore.model.board.BoardListModel;
import kr.co.overscore.model.board.BoardModel;

public interface BoardMapper {
	public BoardModel selectBoard(String boardId);

	public List<BoardListModel> selectBoardList(@Param("boardId") String boardId, @Param("pageId") int pageId);
}
