package com.cafe24.springex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * @RequestMapping
 * method
 */

@Controller
public class BoardController {

	//게시물 등록
	@ResponseBody
	@RequestMapping("/board/write")
	//@RequestParam(value="n", required=false) 파라미터 이름 n / 파라미터 없어도 페이지 이동
	//@RequestParam(value="n", required=true, defaultValue="" 파라미터 이름 n / 파라미터 있어야 하는데 만약 없으면 공백으로 기본값
	public String write(@RequestParam(value="n", required=true, defaultValue="") String name,
						@RequestParam(value="age", required=true, defaultValue="0") int age) {
		System.out.println(name);
		System.out.println(age);
		return "BoardController:write";
	}
	
	//게시물 수정
	@ResponseBody
	@RequestMapping("/board/update")
	public String update(String name) {
		//데이터 수신
		//String name
		//@requestparam String name
		//@requestparam("name") String name (파라미터 이름 수시 변경 가능)
		System.out.println(name);
		return "BoardController:update";
	}
	
	//게시물 확인
	@ResponseBody
	@RequestMapping("/board/view/{no}")
	public String view(@PathVariable("no") Long no) {
		return "BoardController:view"+no;
	}
	
}
