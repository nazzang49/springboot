package com.cafe24.springex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	//dispatcher를 통해 분기할 지점
	//(방법1) 데이터가 없는 경우
	@RequestMapping("/hello")
	public String hello() {
		return "/WEB-INF/views/hello.jsp";
	}
	
	//(방법2-1) 데이터가 있는 경우
	@RequestMapping("/hello2")
	public ModelAndView hello2() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("email", "nazzang49@gmail.com");
		mv.setViewName("/WEB-INF/views/hello.jsp");
		
		return mv;
	}
	
	//(방법2-2) 데이터가 있는 경우
	//가장 보편적인 방식
	@RequestMapping("/hello3")
	public String hello3(Model model) {
		model.addAttribute("email", "nazzang49@gmail.com");
		return "/WEB-INF/views/hello.jsp";
	}
	
	@RequestMapping("/hello4")
	//@RequestParam("email") = 정석 구문 / "email"은 전송된 파라미터 이름 / 생략될 시 인자의 변수명이 자동으로 설정
	public String hello4(Model model, @RequestParam("email") String email, @RequestParam String name) {
		model.addAttribute("email", email);
		System.out.println(name);
		return "/WEB-INF/views/hello.jsp";
	}
	
	@RequestMapping("/hello5")
	//다른 기술(HttpServletRequest)이 침투했기 때문에 다소 비효율적인 방식
	public String hello5(Model model, HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		model.addAttribute("email", email);
		return "/WEB-INF/views/hello.jsp";
	}
	
}
