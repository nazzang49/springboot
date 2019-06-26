package com.cafe24.mysite.controller.api;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cafe24.mysite.dto.JSONResult;
import com.cafe24.mysite.service.GuestbookService;
import com.cafe24.mysite.vo.GuestBookVO;

//guestbook-ajax
@Controller("guestbookAPIController")
@RequestMapping("/guestbook/api")
public class GuestbookController {

	@Autowired
	private GuestbookService guestboookService;
	
	@ResponseBody
	@RequestMapping("/write")
	public JSONResult write(@RequestParam (value="name", required=true, defaultValue="") String name,
							 @RequestParam (value="password", required=true, defaultValue="") String password,
			   				 @RequestParam (value="contents", required=true, defaultValue="") String contents) throws SQLException {
		
		//방명록 등록
		GuestBookVO gvo = new GuestBookVO();
		gvo.setName(name);
		gvo.setPassword(password);
		gvo.setContents(contents);
		guestboookService.insert(gvo);
		
		//방명록 리스트
		List<GuestBookVO> guestbookList = guestboookService.getList();
		
		JSONResult result = JSONResult.success(guestbookList);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public JSONResult delete(@RequestParam (value="no", required=true, defaultValue="0") Long no,
							 @RequestParam (value="password", required=true, defaultValue="") String password) throws SQLException {
		
		//방명록 삭제
		boolean flag = guestboookService.delete(no, password);
		Map<String, Object> map = new HashMap<>();
		
		//삭제 실패
		if(!flag) {
			map.put("flag", "false");
			JSONResult result = JSONResult.success(map);
			return result;
		}
		
		//방명록 리스트
		List<GuestBookVO> guestbookList = guestboookService.getList();
		map.put("flag", "true");
		map.put("guestbookList", guestbookList);
		
		JSONResult result = JSONResult.success(map);
		return result;
	}
}
