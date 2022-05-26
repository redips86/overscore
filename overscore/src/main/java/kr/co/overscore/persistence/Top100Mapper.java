package kr.co.overscore.persistence;

import java.util.List;

import kr.co.overscore.model.MainTopHeroesModel;

import org.apache.ibatis.annotations.Param;

public interface Top100Mapper {
	List<MainTopHeroesModel> selectTop100Heroes(@Param("server") String server,
			@Param("typeId") int typeId, @Param("heroesId") int heroesId);

	List<MainTopHeroesModel> selectTop100HeroesOrder(@Param("server") String server, 
			@Param("typeId") int typeId, @Param("order") String order, @Param("heroesId") int heroesId);
}
