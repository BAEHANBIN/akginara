package org.akginara.service;

import java.util.List;

import org.akginara.domain.BoardSellVO;
import org.akginara.domain.Criteria;
import org.akginara.mapper.BoardSellAttachMapper;
import org.akginara.mapper.BoardSellMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class BoardSellServiceImpl implements BoardSellService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardSellMapper sellMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardSellAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardSellVO sell) {
		sellMapper.insert(sell);
		
		if (sell.getAttachList() == null || sell.getAttachList().size() <= 0) {
			return;
		}
		
		sell.getAttachList().forEach(attach -> {
			attach.setBno(sell.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardSellVO get(Long bno) {
		return sellMapper.read(bno);
	}

	@Override
	public boolean modify(BoardSellVO sell) {
		return sellMapper.update(sell) == true;
	}

	@Override
	public boolean remove(Long bno) {
		return sellMapper.delete(bno) == true;
	}

	@Override
	public List<BoardSellVO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri);
		return sellMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return sellMapper.getTotalCount(cri);
	}
}
