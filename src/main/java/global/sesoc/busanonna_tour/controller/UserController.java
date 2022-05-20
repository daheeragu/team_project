package global.sesoc.busanonna_tour.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.busanonna_tour.dao.*;

@Controller
@RequestMapping("user") 
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserDAO dao;
	
	// 가입폼으로 이동
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
			
		return "userjsp/loginForm";
	}
	
	// 로그인 폼에서 입력한 정보 가져오기
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String id, String password, HttpSession session) {
			logger.info("전달받은 값 : {}, {}", id, password);
		return "redirect:/"; 
	}
	
}
