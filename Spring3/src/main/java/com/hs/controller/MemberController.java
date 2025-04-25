package com.hs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hs.entity.Board;
import com.hs.entity.Member;
import com.hs.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper mapper;
	
	//회원가입 페이지 이동 기능
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}
	
	//아이디 중복체크기능
	@ResponseBody
	@RequestMapping("/registerCheck.do")
	public int registerCheck(@RequestParam("memID")String memID ) {
		
		Member vo=mapper.registerCheck(memID);
		//vo==null 해당이름의 회원이 없음
		//vo!=null 해당회원이 존재함
		
		if(vo==null) {
			return 1;
		}else {
			return 0;
			}
		
	
		
	}
	
	@RequestMapping("/join.do")
	public String join(Member member) {
		
		System.out.println(member.toString());
		
		return null;
		
	}
	

}
