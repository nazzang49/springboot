package com.cafe24.springex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.springex.vo.UserVO;

/*
 * @RequestMapping
 * type+method
 */

@Controller
//user를 최상단 경로로 미리 지정 = 공통사항
@RequestMapping("/user")
public class UserController {

	//요청되는 방식 = GET /user/join
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "/WEB-INF/views/join.jsp";
	}
	
	//요청되는 방식 = POST /user/join
	//ResponseBody의 경우 리턴값을 바디 태그에 표시
	//@ResponseBody
	@RequestMapping(value= {"/join","/j"}, method=RequestMethod.GET)
	//@PostMapping({"/join","/j"})
	public String join(@ModelAttribute UserVO vo) {
		if(!valid(vo)) {
			return "/WEB-INF/views/join.jsp";
		}
		System.out.println(vo);
		//HelloController로 돌림
		return "redirect:/hello";
	}
	
	//데이터가 있는지 검증하는 메소드 테스트
	private boolean valid(UserVO vo) {
		return false;
	}
}
