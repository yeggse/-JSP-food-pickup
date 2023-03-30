package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AdminService;
import com.example.demo.model.Admin;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class AdminController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private AdminService adminService;

    @Autowired
    HttpSession session;
	
	// 일반회원 출력
    @RequestMapping("/normalMem.do") 
    public String normalMem(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/memManage"; // WEB-INF에서 호출할 파일명
    }
    // 일반회원 출력 데이터 호출
	@RequestMapping(value = "/normalMem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String normalMemList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Admin> list = adminService.normalMemList(map);
		int cnt = adminService.countMemCnt(map);	//수 세기
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);	//수 세기
		return new Gson().toJson(resultMap);
	}
	
	// 사업자 회원 출력
    @RequestMapping("/BuMemList.do") 
    public String BuMem(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/bumManage"; // WEB-INF에서 호출할 파일명
    }
    // 사업자 출력 데이터 호출
	@RequestMapping(value = "/BuMemList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String BuMemList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Admin> list = adminService.BuMemList(map);
		int cnt = adminService.countBumCnt(map);	// 갯수 세기
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);	// 갯수 세기
		return new Gson().toJson(resultMap);
	}
	
	// 일반회원 상세 정보 출력
    @RequestMapping("/member.detail.do") 
    public String memDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/memDetail"; // WEB-INF에서 호출할 파일명
    }
    
    // 일반회원 상세정보 출력 데이터 호출
	@RequestMapping(value = "/detailMem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bumList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.detailmem(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	// 관리자 상세 정보 출력
    @RequestMapping("/bum.detail.do") 
    public String bumDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/bumDetail"; // WEB-INF에서 호출할 파일명
    }
    // 관리자 상세정보 출력 데이터 호출
	@RequestMapping(value = "/detailBum.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String memBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = adminService.detailbum(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
	//일반화원 정보수정
    @RequestMapping("/memedit.do") 
    public String boardEdit(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/memEdit"; // WEB-INF에서 호출할 파일명
    }
    // 일반화원 정보수정 데이터 호출
	@RequestMapping(value = "/memEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.editmem(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	//사업자화원 정보수정
    @RequestMapping("/bumedit.do") 
    public String bumEdit(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/bumEdit"; // WEB-INF에서 호출할 파일명
    }
    // 사업자회원 정보수정 데이터 호출
	@RequestMapping(value = "/bumEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editbum(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.editbum(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 일반회원 삭제
	@RequestMapping(value = "/deleteMem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deletememList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    adminService.deletemem(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
}
