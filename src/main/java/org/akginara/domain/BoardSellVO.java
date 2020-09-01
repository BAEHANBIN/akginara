package org.akginara.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardSellVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private int price;
	private String district;
	private Date regdate;
	private Date updateDate;
	private String category;
	private boolean state;
	private int count;
	private int replyCnt;
	private List<BoardSellAttachVO> attachList;
}
