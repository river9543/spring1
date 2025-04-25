package com.hs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hs.entity.Board;
import com.hs.mapper.BoardMapper;

@RequestMapping("/board")
@RestController //비동기 기능만 처리하는 콘트롤러,뷰네임이 아닌 데이터만 돌려줌
public class RestBoardController {
	
	@Autowired //spring 컨테이너 안에 있는 객체를 연결하는 방법,SqlSessionFactoryBean->upcasting->BoardMapper
	private BoardMapper mapper;
	
	//boardContent.do->비동기 게시글 하나 보내기 기능(상세보기)
		@GetMapping("/{idx}")
		
		public Board boardContent(@PathVariable("idx")int idx) {
			Board vo=mapper.boardContent(idx);
			return vo;
		}
		
		
		//boardCount.do->비동기 게시글 조회수 기능
		
		@PutMapping("/count/{idx}")
	    public void boardCount(@PathVariable("idx")int idx) {
			mapper.count(idx);
		}
		
		//boardInsert.do->비동기 게시글 입력
		
		@PostMapping("/new")
		public void boardInsert(Board vo) {
			mapper.boardInsert(vo);
		}
		
		//boardList.do->게시글 전체를 json형태로 데이터 반환
		//동기방식->viewName
		//비동기방식->data(json)
		
		@GetMapping("/all")//requestmapping은 get,post 둘다 요청 가능,GetMapping은 get만 받음
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
		//
		@RequestMapping("/{idx}")
		public void boardDelete(@PathVariable("idx")int idx) {
			mapper.boardDelete(idx);
		}
		
		
		//boardUpdate.do->비동기 게시글 수정기능
		
		@PutMapping("/update")
		public void boardUpdate(@RequestBody Board vo) {
			mapper.boardUpdate(vo);
			
		}

}
