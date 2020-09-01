package org.akginara.mapper;

import java.util.List;

import org.akginara.domain.BoardSellAttachVO;

public interface BoardSellAttachMapper {
	public void insert(BoardSellAttachVO attach);
	public void delete(String uuid);
	public List<BoardSellAttachVO> findByBno(Long bno);
}
