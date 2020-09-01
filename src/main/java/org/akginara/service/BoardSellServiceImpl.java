package org.akginara.service;

import java.util.List;

import org.akginara.domain.BoardSellVO;
import org.akginara.mapper.BoardSellMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardSellServiceImpl implements BoardSellService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardSellMapper mapper;
	
	@Override
	public void register(BoardSellVO sell) {
		log.info("register : " + sell);
		mapper.insert(sell);
	}

	@Override
	public BoardSellVO get(Long bno) {
		log.info("get : " + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardSellVO sell) {
		log.info("modify : " + sell);
		return mapper.update(sell) == true;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove : " + bno);
		return mapper.delete(bno) == true;
	}

	@Override
	public List<BoardSellVO> getList() {
		log.info("---------------------------getList---------------------------");
		return mapper.getList();
	}

}
