package org.akginara.service;

import org.akginara.domain.BoardSellVO;
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
public class BoardSellServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardSellService service;
	
	@Test
	
	//연결 테스트
/*	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}*/
	
	//리스트 테스트
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}
	
	//쓰기 테스트
//	public void testRegister() {
//		BoardSellVO sell = new BoardSellVO();
//		sell.setWriter("newbie");
//		sell.setTitle("뉴비가 작성하는 글");
//		sell.setContent("뉴비가 작성하는 내용");
//		sell.setPrice(70000);
//		sell.setDistrict("경북");
//		sell.setCategory("이펙터");
//		
//		service.register(sell);
//		
//		service.getList().forEach(board -> log.info(board));
//	}
	
	//읽기 테스트
//	public void testGet() {
//		log.info(service.get(5L));
//	}
	
	//수정 테스트
//	public void testModify() {
//		BoardSellVO sell = service.get(2L);
//		
//		if(sell == null) {
//			return;
//		}
//		
//		sell.setTitle("제목을 수정합니다.");
//		log.info("modify result : " + service.modify(sell));
//	}
	
	//삭제 테스트
	 public void testRemove() {
		log.info("remove result : " + service.remove(4L));
	}
}
