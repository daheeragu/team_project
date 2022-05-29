package global.sesoc.busanonna_tour;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.busanonna_tour.dao.NoticeDAO;
import global.sesoc.busanonna_tour.vo.Notice;
import global.sesoc.busanonna_tour.vo.Notice_pic;

/**
 * 메인 콘트롤러
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	NoticeDAO dao;
	
	/**
	 * 메인 화면으로 이동
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		//실행중인 프로젝트의 서버상의 경로 
		String path = request.getSession().getServletContext().getRealPath(".");
		System.out.println("현재 실행 경로 : " + path);
		
		//공지사항 출력 
		ArrayList<Notice> noticeList = new ArrayList<>();
		noticeList = dao.listNoticeForHome();
 
		model.addAttribute("noticeList", noticeList);
		
		return "home";
	}
	
	// 공지사항 읽기 
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int notice_num, Model model) {
		
		//글 번호 전달하면 읽어오기
				Notice notice = dao.readNotice(notice_num);
				//결과 없으면 글 목록으로 이동
				if(notice == null) {
					 return "redirect:list";
				}
		     //파일로 업로드된 이미지 불러오기 
				ArrayList<Notice_pic> picList = dao.fileList(notice_num);
				
				//결과 있으면 모델에 저장
				model.addAttribute("notice", notice);
				model.addAttribute("picList", picList);
				
		return "noticejsp/readForm";
	}
	/**
	 * 채팅 화면으로 이동
	 */
	@RequestMapping(value="chatView", method=RequestMethod.GET)
	public String chatView() {
		return "chat";
	}
}
