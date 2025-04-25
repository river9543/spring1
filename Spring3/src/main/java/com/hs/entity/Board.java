package com.hs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {
	//번호,제목,내용,작성자,작성일,조회수->Board Vo
	
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	
	//기본생성자-spring에서는 필수로있어야한다.
	
	

}
