package com.hs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.xml.crypto.KeySelector.Purpose;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.entity.Board;
import com.hs.mapper.BoardMapper;

@Controller//동기방식의 요청만 받겠다
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	
	//boardContent.do->비동기 게시글 하나 보내기 기능(상세보기)
	@RequestMapping("/boardContent.do")
	@ResponseBody
	public Board boardContent(@RequestParam("idx")int idx) {
		Board vo=mapper.boardContent(idx);
		return vo;
	}
	
	
	@RequestMapping("/boardMain.do")
	public String main() {
		return "board/main";
	}
	
	//boardCount.do->비동기 게시글 조회수 기능
	@ResponseBody
	@RequestMapping("/boardCount.do")
    public void boardCount(@RequestParam("idx")int idx) {
		mapper.count(idx);
	}
	
	//boardInsert.do->비동기 게시글 입력
	@ResponseBody
	@RequestMapping("/boardInsert.do")
	public void boardInsert(Board vo) {
		mapper.boardInsert(vo);
	}
	
	//boardList.do->게시글 전체를 json형태로 데이터 반환
	//동기방식->viewName
	//비동기방식->data(json)
	@ResponseBody
	@RequestMapping("/boardList.do")
	public List<Board> boardList(){
		List<Board> list=mapper.getList();
		return list;
	}
	//데이터만 뿌려주는 서버
	//안드로이드,ios,태블릿 어디서든 씀
	//{"idx":1,"title":"spring study1","content":"spring study1","writer":"iochi2837","indate":"2025-04-15 13:44:51","count":27},{"idx":2,"title":"spring study2","content":"spring study2","writer
	//":"iochi2837","indate":"2025-04-15 13:44:51","count":0}
	//이런식으로 나옴
	
	//boardDelete.do->비동기 게시글 삭제
	@ResponseBody
	@RequestMapping("/boardDelete.do")
	public void boardDelete(@RequestParam("idx")int idx) {
		mapper.boardDelete(idx);
	}
	
	
	//boardUpdate.do->비동기 게시글 수정기능
	@ResponseBody
	@RequestMapping("/boardUpdate")
	public void boardUpdate(Board vo) {
		mapper.boardUpdate(vo);
		
	}

}
