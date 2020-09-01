package org.akginara.domain;

import lombok.Data;

@Data
public class BoardSellAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long bno;
}
