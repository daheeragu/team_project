package global.sesoc.busanonna_tour.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
	public int doubleCheck(String user_id) {
		logger.info("전달받은 값 : {}", user_id);
		Userinfo user = null;
		user = dao.selectUserinfo(user_id);		
		System.out.println(user);
		int result = 0;
		if(user != null) {
			result = 1;
			return result;
		}
		return result;
		
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
	public String loginForm(Model m, @CookieValue(value = "id", defaultValue = "none") String id) {
			if(!id.equals("none")) {
				m.addAttribute("id", id);
				return "userjsp/loginForm";
			}
		return "userjsp/loginForm";
	}
	
	// 로그인 아이디 비번이 일치하지 않을 시 띄울 문구
	@ResponseBody
	@RequestMapping(value = "select", method = RequestMethod.POST)
	public int loginCheck(String id, String pwd) {
		logger.info("전달받은 값 : {}, {}", id, pwd);
		Userinfo user = null;
		user = dao.selectUserinfo(id);		
		System.out.println(user);
		int result = 0;
		Admin admin = null;
		admin = dao.selectAdmin(id);
		if(user != null && user.getUser_password().equals(pwd)) {
			result = 1;
			return result;
			
		} else if(admin != null && admin.getAdmin_password().equals(pwd)) {
			result = 2;
			return result;
		}
		
		return result;
	}
	
	// 로그인 폼에서 입력한 정보 가져오기
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String id, String password,String remember, 
			HttpSession session, HttpServletResponse hsr) {
		logger.info("전달받은 값 : {}, {}, {}", id, password, remember);
		
		Userinfo user = dao.selectUserinfo(id);
		Admin admin = dao.selectAdmin(id);
		System.out.println(user);
		System.out.println(admin);
		Cookie cookie = new Cookie("id", id);
		if(remember == null){ 
			
			cookie.setMaxAge(0);
			hsr.addCookie(cookie);
		} else if(remember.equals("remember")) {
			
			cookie.setMaxAge(60*60*24*30*3);
			hsr.addCookie(cookie);
		}
		
		
		if(user != null && user.getUser_password().equals(password)) {
			session.setAttribute("loginId", user.getUser_id());
			session.setAttribute("loginName", user.getUser_name());
			
			return "redirect:/";
			
		} else if(admin != null && admin.getAdmin_password().equals(password)) {
			session.setAttribute("loginAdmin", admin.getAdmin_id());
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
			session.removeAttribute("loginAdmin");
		return "redirect:/";
	}
	
	// 마이페이지로 이동
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model m) {
		//세션에서 ID를 읽기 (주소창에 주소 치면 개인정보수정에 들어갈 수 있음)
		String loginId = (String) session.getAttribute("loginId");
		
		Userinfo user = dao.selectUserinfo(loginId);
		System.out.println(user);
		if (user == null) {
			Admin admin = dao.selectAdmin(loginId);
			System.out.println(admin);
			m.addAttribute("admin", admin);
		} else {
			m.addAttribute("user", user);
		}
		return "userjsp/mypage";
	}
		
	// 개인 정보 수정하기
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(HttpSession session, Userinfo user, Admin admin) {
		logger.info("전달된 값 : {}", user);
		logger.info("전달된 값 : {}", admin);
		String loginId = (String) session.getAttribute("loginId");
			int result = 0;
			Userinfo user2 = dao.selectUserinfo(loginId);
			Admin admin2 = dao.selectAdmin(loginId);
		if(user2 != null) {
			
			user.setUser_id(loginId);
			result = dao.updateUserinfo(user);
			session.setAttribute("loginName", user.getUser_name());
			session.setAttribute("user", user);
		} 
		
		if (admin2 != null){
			admin.setAdmin_id(loginId);
			result = dao.updateAdmin(admin);
			session.setAttribute("loginName", admin.getAdmin_name());
			session.setAttribute("admin", admin);	
		}
		
		return "redirect:mypage";	
	}
	
}
