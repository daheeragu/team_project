//회원정보 관련 처리 콘트롤러
package global.sesoc.web5.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web5.dao.MemberDAO;
import global.sesoc.web5.vo.Member;


@Controller
@RequestMapping("member") //현재 콘트롤러의 모든 경로 앞에 member/가 붙음
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberDAO dao;
	
	//가입폼으로 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		
		return "memberjsp/joinForm"; //views폴더 아래의 memberjsp폴더 아래의 joinForm.jsp
	}
	
	//가입 처리 (사용자가 입력한 걸 DB로) 
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Member member) {
		 logger.info("전달된 값:{}", member );
		 dao.insert(member);
		return "redirect:/";
   }
	//로그인 폼으로 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		
		return "memberjsp/loginForm";
	}	
    //로그인 처리 
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member member, HttpSession session) { //<- 사용자가 입력한 정보 
		
		//DB에서 ID로 회원정보를 조회해온다 (3번 예제에서 확인 가능)  
		Member member2 = dao.getMember(member.getId()); //<-DB에서 가져온 정보 
		
		//결과가 있는지, 비밀번호가 맞는지 확인 후 세션에 ID와 이름 저장
		if(member2 != null && member2.getPassword().equals(member.getPassword())) {
			session.setAttribute("loginId", member2.getId());
			session.setAttribute("loginName", member2.getName());
			return "redirect:/"; //현재 경로에서 제일 상위 경로
		}
		 
		return "redirect:login"; //다시 로그인 
		
	}
	
	//로그아웃 (session에 저장된 값을 지우면 됨) 
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	 
		session.removeAttribute("loginId");
	    session.removeAttribute("loginName"); 
		 
		return "redirect:/";
	}
	//중복아이디 확인 페이지로 이동
	@RequestMapping(value = "idcheck", method = RequestMethod.GET)
	public String idcheck() {
		
		return "memberjsp/idCheckForm";
	}
	//ID 중복확인
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)
	public String idcheck(String searchId, Model model) {
		logger.info("검색할 아이디 : {}", searchId);
		
		Member member = dao.getMember(searchId);
		
		model.addAttribute("member", member); //null or 객체가 들어있음
		model.addAttribute("searchId", searchId); //방금 검색한 아이디 
		
		return "memberjsp/idCheckForm";
	}
	//개인정보수정 페이지로 이동
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(Model model, HttpSession session) {
		//세션에서 ID를 읽기 (주소창에 주소 치면 개인정보수정에 들어갈 수 있음)
	   String loginId = (String) session.getAttribute("loginId");
		//ID가 null이면 로그인 화면으로 리다이렉트
	   if(loginId == null) 
		   return "redirect:login"; //로그인 했는지 안했는지 확인하기
	   
		//ID가 null이 아니면 DB에서 회원정보를 조회
		   Member member = dao.getMember(loginId);
		   model.addAttribute("member", member);
		
		   //회원정보를 Model에 저장하고 JSP로 포워딩 
			return "memberjsp/updateForm";
	   }
	//개인 정보 수정하기 
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Member member, HttpSession session) {	
		//세션에 있는 아이디를 받아오기
		String loginId = (String) session.getAttribute("loginId");
		// if(loginId == null) 
	    //return "redirect:login";
		 
		 member.setId(loginId);
		
		 //Member객체를 dao로 보내서 테이블의 정보 수정 
		 logger.info("전달된 값: {}", member); 
		 dao.updateMember(member);
		 
		 session.setAttribute("loginName", member.getName());
		 
		 
		 return "redirect:/";
		 
	}
	
	//회원탈퇴 창으로  이동
	   @RequestMapping(value = "withdrawal", method = RequestMethod.GET)
	   public String withdrawal() {
	      
	      return "memberjsp/withdrawalForm";
	   }
	   
	 //회원탈퇴 처리
	   @RequestMapping(value = "withdrawal", method = RequestMethod.POST)
	   public String withdrawal(String password, HttpSession session) {
	      
		 //세션에 있는 아이디를 받아오기
		   String loginId = (String) session.getAttribute("loginId");
		   Member member = new Member();
		   member.setId(loginId);
		   member.setPassword(password);
		   
		   logger.info("전달된 값 : {}", member);
		   dao.deleteMember(member);
		   
		   session.removeAttribute("loginId");
		   session.removeAttribute("loginName"); 
                    		       
		   return "redirect:/";
	   }
	
	
	
}