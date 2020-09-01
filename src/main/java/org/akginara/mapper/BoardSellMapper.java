package org.akginara.mapper;

import java.util.List;

import org.akginara.domain.BoardSellVO;

public interface BoardSellMapper {
	public List<BoardSellVO> getList();
	public void insert(BoardSellVO sell);
	public BoardSellVO read(Long bno);
	public boolean delete(Long bno);
	public boolean update(BoardSellVO sell);
}
