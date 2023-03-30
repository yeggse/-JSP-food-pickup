package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AreaService;
import com.example.demo.dao.JoinService;
import com.example.demo.dao.MainService;
import com.example.demo.model.Area;
import com.example.demo.model.Join;
import com.example.demo.model.Main;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {
	
	@Autowired
    private JoinService joinService; 
	
	@Autowired
    private MainService mainService1; 

	@Autowired
    private AreaService areaService1;
	
	@Autowired
    HttpSession session;

	// 로그인 페이지
	 @RequestMapping("/login.do") 
	    public String login(Model model) throws Exception{
	    	// 세션에 넣었던 값들 꺼내서 remove
	    	String id = (String)session.getAttribute("id");  
	    	session.removeAttribute("id");

	    	// 제거
	    	session.invalidate();	
	    	return "/web_account/login"; // WEB-INF에서 호출할 파일명
	    }
	    
	// 로그인 페이지 데이터 호출
	    @RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String login(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			Join user = joinService.selectLoginList(map);
			
			if( user != null) {
				session.setAttribute("userVO", new Gson().toJson(user)); // Join type의 VO안의 객체 전체를 userVO에 넣는 과정. Vue문법에 따라 Json에 넣어줘야함.(Dalseok)
				session.setMaxInactiveInterval(60*60); // 1시간 이후 자동 로그아웃 설정(Dalseok)
				
				session.setAttribute("userIdSession", user.getId());
				session.setAttribute("userNameSession", user.getName());
				session.setAttribute("KindSession", user.getKind());
				session.setAttribute("userAccSession", user.getAcc());
				session.setAttribute("userPhonenumSession", user.getPhonenum());
				session.setAttribute("userFrontregisnumSession", user.getFrontregisnum());
		    	session.setAttribute("userAfterregisnumSession", user.getAfterregisnum());
		    	session.setAttribute("userAddressSession", user.getAddress());
		    	session.setAttribute("userNicknameSession", user.getNickname());
		    	
		    	session.setAttribute("userResnameSession", user.getResname());
				session.setAttribute("userResnumSession", user.getResnum());
				session.setAttribute("userReskindSession", user.getReskind());
				session.setAttribute("userResregionSession", user.getRegion());
				session.setAttribute("userResphone", user.getResphone());
				session.setAttribute("userResad", user.getResad());
		    	
				resultMap.put("user", user);
				resultMap.put("result", "success");
			} else {
	 			resultMap.put("result", "fail");
	 		}
	 		return new Gson().toJson(resultMap);
		}	
		
	    // 아이디 id 찾기
	    @RequestMapping("/searchid.do") 
	    public String searchid(Model model) throws Exception{
	    	return "/web_account/search_id"; // WEB-INF에서 호출할 파일명
	    }
	    // 아이디 id 찾기 데이터 호출
		@RequestMapping(value = "/searchid.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchid(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Join> list = joinService.searchid(map); // DB 접근 및 쿼리를 통한 데이터 호출 
			if(list.size()>0) {
				resultMap.put("result", "success");
			}else {
				resultMap.put("result", "fail");
			}
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	
		// 비밀번호 pw 찾기 
	    @RequestMapping("/searchpw.do") 
	    public String searchpw(Model model) throws Exception{
	    	return "/web_account/search_pw"; // WEB-INF에서 호출할 파일명
	    }
		// 비밀번호 pw 찾기 데이터 호출
		@RequestMapping(value = "/searchpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchpw(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			Join user = joinService.searchpw(map);
			
			if(user != null) {
				session.setAttribute("userId1Session", user.getId());
				session.setAttribute("NameSession", user.getName());
				
				resultMap.put("user", user);
				resultMap.put("result", "success");
			} else {
	 			resultMap.put("result", "fail");
	 		}
	 		return new Gson().toJson(resultMap);
		}
		
		
	// 일반회원 정보변경   
	@RequestMapping("/datachange.do")
	public String main2(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");
    	String name = (String)session.getAttribute("userNameSession");
    	String address = (String)session.getAttribute("userAddressSession");
    	String nickname = (String)session.getAttribute("userNicknameSession");
    	String phonenum = (String)session.getAttribute("userPhonenumSession");
    	String account = (String)session.getAttribute("userAccSession");
    	int frontregisnum = (Integer)session.getAttribute("userFrontregisnumSession");
    	int afterregisnum = (Integer)session.getAttribute("userAfterregisnumSession");
    	String add = (String)session.getAttribute("userAddSession");

    	request.setAttribute("userId", id);
        request.setAttribute("usernickname", nickname);
    	request.setAttribute("userphonenum", phonenum);
    	request.setAttribute("useraccount",account);
    	request.setAttribute("userId", id);
    	request.setAttribute("userName", name);
    	request.setAttribute("useraddress",address);
    	request.setAttribute("userFrontregisnum", frontregisnum);
    	request.setAttribute("userafterregisnum", afterregisnum);
    	request.setAttribute("userAdd", add);
    	
		return "/web_account/MemDatachange"; // WEB-INF에서 호출할 파일명
	}
	
	// 회원 정보변경 데이터 호출
	@RequestMapping(value = "/datachange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String datachange(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.datachange(map);
		resultMap.put("message, ", "성공");
		return new Gson().toJson(resultMap);
	}
	// 사업자 회원 정보변경 	
	@RequestMapping("/datachange2.do")
	public String main3(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");
    	String name = (String)session.getAttribute("userNameSession");
    	int frontregisnum = (Integer)session.getAttribute("userFrontregisnumSession");
    	int afterregisnum = (Integer)session.getAttribute("userAfterregisnumSession");
    	String address = (String)session.getAttribute("userAddressSession");
    	String nickname = (String)session.getAttribute("userNicknameSession");
    	String phonenum = (String)session.getAttribute("userPhonenumSession");
    	String account = (String)session.getAttribute("userAccSession");    	
        String add = (String)session.getAttribute("userAddSession");
    	String resname = (String)session.getAttribute("userResnameSession");
    	int resnum = (Integer)session.getAttribute("userResnumSession");
    	String resphone = (String)session.getAttribute("userResphone");
    	
        HashMap<String, Object> map1 = new HashMap<String, Object>();
		 List<Area> siList = mainService1.selectSiList(map); map.put("si",
		 siList.get(0).getSi()); request.setAttribute("siList", new
		 Gson().toJson(siList));
		 
		 List<Area> guList = areaService1.selectGuList(map);
	    	map.put("gu", guList.get(0).getGu());
	    	request.setAttribute("guList",  new Gson().toJson(guList));
	    	
	    List<Area> dongList = areaService1.selectDongList(map);
	    	map.put("dong", dongList.get(0).getDong());
	    	request.setAttribute("dongList",  new Gson().toJson(dongList));
	    	
	    request.setAttribute("resname", resname);
	    request.setAttribute("resnum", resnum);
	    request.setAttribute("resphone",resphone);
	    request.setAttribute("usernickname", nickname);
	    request.setAttribute("userphonenum", phonenum);
	    request.setAttribute("useraccount",account);      
	    request.setAttribute("useraddress",address);
    	request.setAttribute("userId", id);
    	request.setAttribute("userName", name);
    	request.setAttribute("userFrontregisnum", frontregisnum);
    	request.setAttribute("userafterregisnum", afterregisnum);
    	request.setAttribute("userAdd", add);
		return "/web_account/BumDatachange"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/searchpwdchange.do") 
	    public String searchpwchange(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userId1Session");
    	
    	request.setAttribute("userId1", id);
	    	return "/search_pwdchange"; // WEB-INF에서 호출할 파일명
	}
	    
	
	@RequestMapping(value = "/join/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String searchBbsList1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 	    int num = joinService.getMemberList(map);
 	    int num2 = joinService.getRes(map);
 		if(num>0) {
 			resultMap.put("result", "success");
 		}else {
 			resultMap.put("result", "fail");
 		}
 		resultMap.put("list", num);
 		resultMap.put("list", num2);
 		return new Gson().toJson(resultMap);
 	}
	
	
    //아이디 중복확인
    @RequestMapping(value = "/join/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
    
    //닉네임 중복확인
    @RequestMapping(value = "/join/nickcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String nickcheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getnickCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
    
    //사업자 중복확인
    @RequestMapping(value = "/join/resnumcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String resnumcheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getresnumCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}

	
	//선생님 버전
	@RequestMapping(value = "/searchpwdchange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String pwdchange(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.pwdchange(map);
		resultMap.put("message, ", "성공");
		return new Gson().toJson(resultMap);
	}
	


}
