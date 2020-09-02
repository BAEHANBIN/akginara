package org.akginara.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardSellControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mock;
	
	@Before
	public void setup() {
		this.mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	//리스트 테스트
	public void testListPaging() throws Exception {
		log.info(mock.perform(MockMvcRequestBuilders.get("/akginara/sell/list").param("pageNum", "2").param("amount", "50")).andReturn().getModelAndView().getModelMap());
	}
	
	//쓰기 테스트
//	public void testRegister() throws Exception {
//		String resultPage = mock.perform(MockMvcRequestBuilders.post("/akginara/sell/register")
//																.param("title", "컨트롤러 테스트 제목")
//																.param("content", "컨트롤러 테스트 내용")
//																.param("writer", "userTest")
//																.param("price", "500000")
//																.param("district", "서울")
//																.param("category", "베이스"))
//								.andReturn()
//								.getModelAndView()
//								.getViewName();
//		log.error(resultPage);
//		log.info("---------------------------" + resultPage);
//	}
	
	//읽기 테스트
//	public void testGet() throws Exception {
//		log.info(mock.perform(MockMvcRequestBuilders.get("/akginara/sell/get").param("bno", "3"))
//						.andReturn()
//						.getModelAndView()
//						.getModelMap());
//	}
	
	//수정 테스트
//	public void testModify() throws Exception {
//		String resultPage = mock.perform(MockMvcRequestBuilders.post("/akginara/sell/modify")
//																.param("bno", "7")
//																.param("title", "수정된 컨트롤러 테스트")
//																.param("content", "asdf")
//																.param("price", "2000000")
//																.param("district", "전주")
//																.param("category", "통기타"))
//								.andReturn()
//								.getModelAndView()
//								.getViewName();
//		log.info(resultPage);
//	}
	
	//삭제 테스트
//	public void testRemove() throws Exception {
//		String resultPage = mock.perform(MockMvcRequestBuilders.post("/sell/remove").param("bno", "6"))
//								.andReturn()
//								.getModelAndView()
//								.getViewName();
//		log.info(resultPage);
//	}
}
