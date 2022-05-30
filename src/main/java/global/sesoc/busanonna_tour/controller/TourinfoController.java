package global.sesoc.busanonna_tour.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.busanonna_tour.dao.TourinfoDAO;
import global.sesoc.busanonna_tour.dao.UserDAO;
import global.sesoc.busanonna_tour.util.FileService;
import global.sesoc.busanonna_tour.util.PageNavigator;
import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Reply;
import global.sesoc.busanonna_tour.vo.tourinfo.Tourinfo;

@Controller
@RequestMapping("tourinfo") 
public class TourinfoController {

	private static final Logger logger = LoggerFactory.getLogger(TourinfoController.class);
	
	//게시판 관련 상수값들
	 final int countPerPage = 10; //페이지당 글 수 
	 final int pagePerGroup = 5;  //페이지 이동 링크를 표시할 페이지 수 
	 final String uploadPath = "/tourinfofile"; // 파일 업로드 경로 
	 
	@Autowired
	TourinfoDAO dao;
	@Autowired
	UserDAO udao;
	
	//명소 글목록 이동
	@RequestMapping(value = "spot", method = RequestMethod.GET)
	public String spotList(Model model, HttpSession session
			, @RequestParam(value="page", defaultValue="1") int page){
		
		//전체 글 개수 
		int total = dao.getTotalSpot("spot");
		//페이지 계산을 위한 객체 생성 
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Tourinfo> infolist = dao.spotlist(navi.getStartRecord(), navi.getCountPerPage());	
		
		//세션에서 관리자 아이디 받아오기 
		session.getAttribute("loginAdmin");
		
		//페이지 정보 객체와 글목록, 검색어를 모델에 저장
		model.addAttribute("infolist", infolist);
		model.addAttribute("navi", navi);
		model.addAttribute("theme", "spot");
		
		return "tourinfojsp/allList";
	}
	
	//먹거리 글목록 이동
	@RequestMapping(value = "food", method = RequestMethod.GET)
	public String foodList(Model model
			, @RequestParam(value="page", defaultValue="1") int page){
		
		//전체 글 개수 
		int total = dao.getTotalFood("food");
		//페이지 계산을 위한 객체 생성 
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Tourinfo> infolist = dao.foodlist(navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글목록, 검색어를 모델에 저장
		model.addAttribute("infolist", infolist);
		model.addAttribute("navi", navi);
		model.addAttribute("theme", "food");
		
		return "tourinfojsp/allList";
	}
	
	//레저 글목록 이동
	@RequestMapping(value = "leisure", method = RequestMethod.GET)
	public String leisureList(Model model
			, @RequestParam(value="page", defaultValue="1") int page){
		
		//전체 글 개수 
		int total = dao.getTotalLeisure("leisure");
		//페이지 계산을 위한 객체 생성 
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Tourinfo> infolist = dao.leisurelist(navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글목록, 검색어를 모델에 저장
		model.addAttribute("infolist", infolist);
		model.addAttribute("navi", navi);
		model.addAttribute("theme", "leisure");
		
		return "tourinfojsp/allList";
	}
		
	//체험 글목록 이동
	@RequestMapping(value = "experience", method = RequestMethod.GET)
	public String expList(Model model
			, @RequestParam(value="page", defaultValue="1") int page){
		
		//전체 글 개수 
		int total = dao.getTotalLeisure("experience");
		//페이지 계산을 위한 객체 생성 
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Tourinfo> infolist = dao.explist(navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글목록, 검색어를 모델에 저장
		model.addAttribute("infolist", infolist);
		model.addAttribute("navi", navi);
		model.addAttribute("theme", "exp");
		
		return "tourinfojsp/allList";
	}

	
	//글쓰기 폼으로 이동
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		
		return "tourinfojsp/writeForm";
	}
	//글쓰기 기능 처리 
	@RequestMapping(value = "write", method = RequestMethod.POST)
	 public String write(Tourinfo info, HttpSession session, MultipartFile upload) {
	    
		//세션에서 아이디 받아오기 
		String loginId = (String) session.getAttribute("loginId");
		info.setAdmin_id(loginId);
	
       
	    //Board객체를 DAO로 보내서 글쓰기
		logger.info("저장할 글정보 : {}", info);
		dao.write(info);
		
		return "redirect:list";
		
	}
	
	//글 읽기로 이동
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int info_num, Model model) {
		
		 //글 번호 전달하면 dao에서 조회수 수정하고 해당글 읽어옴
	      Tourinfo info = dao.readInfo(info_num);
	     //결과가 없으면 글 목록으로 이동 
	      if(info == null) {
	    	  return "redirect:list";
	      }
	      //결과가 있으면 모델에 글 정보 저장하고 JSP로 포워딩
	    model.addAttribute("info", info);
	      
		return "tourinfojsp/readForm";
	}
	
	//본인 글 수정 폼으로 이동
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(int info_num, Model model) {
	 //전달받은 글 번호로 글 정보 검색해서 모델에 저장
		Tourinfo info =dao.readInfo(info_num);
		if(info == null) {
			return "redirect:list";
		}
		model.addAttribute("info", info);
     //글 수정 폼으로 포워딩
		return "tourinfojsp/editForm";
	}
	
	//글 수정 처리
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	 public String edit(Tourinfo info, HttpSession session) {

		//DB에 업데이트(update구문의 where 조건은 글번호와 작성자 아이디)
		logger.info("전달된 값: {}", info);
		int result = dao.updateInfo(info);
		if(result == 0) {
			logger.info("글 수정 실패");
		}

		return "redirect:read?info_num="+info.getInfo_num();
	
	}
	
	//글 삭제 처리
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int info_num, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인 아이디
		Tourinfo info = new Tourinfo();
		info.setInfo_num(info_num);
		info.setAdmin_id(loginId);
		
		logger.info("전달된 값: {}", info);
	    int result = dao.deleteInfo(info);
	    
		
		return "redirect:list";
	}
	
	//땡기네 처리
	@RequestMapping(value = "like", method = RequestMethod.GET)
	public String like(int info_num, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		//로그인 한 상태에만 땡기네 처리
		if(loginId != null) {
			dao.addLike(info_num);
		}
		
		return "tourinfojsp/readForm";
	}
	
	
}