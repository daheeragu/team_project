package global.sesoc.busanonna_tour.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.busanonna_tour.dao.*;
import global.sesoc.busanonna_tour.vo.user.*;


@Controller
@RequestMapping("user") 
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserDAO dao;
	
	// 가입폼으로 이동
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
				
		return "userjsp/joinForm";
	}	
	
	// ID 중복 체크
	@ResponseBody
	@RequestMapping(value = "select", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public Userinfo doubleCheck(String user_id, Model m) {
		logger.info("전달받은 값 : {}", user_id);
		Userinfo user = null;
		user = dao.selectUserinfo(user_id);		
		m.addAttribute("user", user);
		m.addAttribute("searchId", user_id);
		return user;
	}
	
	// 회원가입 폼에 입력한 정보 가져오기 및 가입 처리하기
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Userinfo user) {
		logger.info("전달받은 값 : {}", user);
		int result = 0;
		result = dao.insertUserinfo(user);
		return "redirect:/"; 
	}
		
	// 로그인 폼으로 이동
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
			
		return "userjsp/loginForm";
	}
	
	// 로그인 폼에서 입력한 정보 가져오기
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String id, String password, HttpSession session) {
		logger.info("전달받은 값 : {}, {}", id, password);
		
		Userinfo user = dao.selectUserinfo(id);
		Admin admin = dao.selectAdmin(id);
		System.out.println(user);
		System.out.println(admin);
		if(user != null && user.getUser_password().equals(password)) {
			session.setAttribute("loginId", user.getUser_id());
			session.setAttribute("loginName", user.getUser_name());
			return "redirect:/";
		}
		
		if(admin != null && admin.getAdmin_password().equals(password)) {
			session.setAttribute("loginId", admin.getAdmin_id());
			session.setAttribute("loginName", admin.getAdmin_name());
			return "redirect:/";
		}
		return "redirect:loginForm"; 
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
			session.removeAttribute("loginId");
			session.removeAttribute("loginName");
		return "redirect:/";
	}
	
}