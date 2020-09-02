package org.akginara.mapper;

import java.util.List;

import org.akginara.domain.BoardSellVO;
import org.akginara.domain.Criteria;

public interface BoardSellMapper {
	public List<BoardSellVO> getList();
	public List<BoardSellVO> getListWithPaging(Criteria cri);
	public void insert(BoardSellVO sell);
	public BoardSellVO read(Long bno);
	public boolean delete(Long bno);
	public boolean update(BoardSellVO sell);
	public int getTotalCount(Criteria cri);
}
