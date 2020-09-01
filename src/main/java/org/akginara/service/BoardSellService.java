package org.akginara.service;

import java.util.List;

import org.akginara.domain.BoardSellVO;

public interface BoardSellService {
	public void register(BoardSellVO sell);
	public BoardSellVO get(Long bno);
	public boolean modify(BoardSellVO sell);
	public boolean remove(Long bno);
	public List<BoardSellVO> getList();
}
