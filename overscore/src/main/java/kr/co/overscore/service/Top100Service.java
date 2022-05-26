package kr.co.overscore.service;

import java.util.List;

import kr.co.overscore.model.MainTopHeroesModel;
import kr.co.overscore.persistence.Top100Mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Top100Service {
	@Autowired
	Top100Mapper mapper;

	public List<MainTopHeroesModel> getTop100Heroes(String server, int typeId,
			int heroesId) {
		return mapper.selectTop100Heroes(server, typeId, heroesId);
	}

	public List<MainTopHeroesModel> getTop100HeroesOrder(String server,
			int typeId, String order, int heroesId) {
		return mapper.selectTop100HeroesOrder(server, typeId, order, heroesId);
	}
}
