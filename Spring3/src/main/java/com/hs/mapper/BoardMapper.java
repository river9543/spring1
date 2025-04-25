package com.hs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hs.entity.Board;

@Mapper
public interface BoardMapper {
	//jdbc메서드를 작성하는 곳
	
	//게시글 전체조회 기능
	public List<Board> getList();

	public void boardInsert(Board vo);

	public Board boardContent(int idx);
	//리턴타입 Board,매개변수타입 int
    
	
	//조회수 올리기 기능
	public void count(int idx);
    
	//게시글 삭제 기능
	public void boardDelete(int idx);
    
	//게시글 수정 기능
	public void boardUpdate(Board vo);
	

}
