package org.akginara.mapper;

import java.util.List;

import org.akginara.domain.BoardSellVO;
import org.akginara.domain.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardSellMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardSellMapper mapper;
	
	@Test
	//전체리스트 테스트
	public void testGetList() {
		mapper.getList().forEach(sell -> log.info(sell));
	}
	
	//전체 리스트 페이징 테스트
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		cri.setPageNum(3); //페이지 수 
//		cri.setAmount(10); //갯수
//		
//		 List<BoardSellVO> list = mapper.getListWithPaging(cri);
//		 list.forEach(sell -> log.info(sell.getBno()));
//	}
//	
	//삽입 테스트
//	public void testInsert() {
//		BoardSellVO sell = new BoardSellVO();
//		sell.setWriter("newbie");
//		sell.setTitle("뉴비가 작성하는 글");
//		sell.setContent("뉴비가 작성하는 내용");
//		sell.setPrice(1000000);
//		sell.setDistrict("강원");
//		sell.setCategory("신디사이저");
//		
//		mapper.insert(sell);
//		
//		log.info(sell);
//	}
	
	//읽기 테스트
//	public void testRead() {
//		BoardSellVO sell = mapper.read(5L);
//		log.info(sell);
//	}
	
	//삭제 테스트
//	public void testDelete() {
//		log.info("delete count : " + mapper.delete(3L));
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	//수정 테스트
//	public void testUpdate() {
//		BoardSellVO sell = new BoardSellVO();
//		sell.setBno(524305L);
//		sell.setTitle("수정 제목");
//		sell.setContent("수정 내용");
//		sell.setPrice(0);
//		sell.setDistrict("수정 지역");
//		sell.setCategory("수정 목록");
//		
//		mapper.update(sell);
//		
//		log.info(mapper.read(524305L));
//	}
}
