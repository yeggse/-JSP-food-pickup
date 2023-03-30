package com.example.demo.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.MenuService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class MenuController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MenuService menuService;

    @Autowired
    HttpSession session;
	
    
    // 웹 주소 :  메뉴 추가하기
    @RequestMapping("/menu.add.do") 
    public String menuAdd(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("noticenum"));
    	System.out.println(id+"dddd");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
		if(kind.equals("B")) { // 사업자 이면! 
		    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
		    	String reskind = (String)session.getAttribute("userReskindSession");
		    	request.setAttribute("reskind", reskind); 
		    	request.setAttribute("resnum",resnum); 
		    	System.out.println("세션 넘어옴..."); 
		    	System.out.println(resnum+" resnum");
		    	System.out.println(reskind+" reskind");
		 }
    	return "/web_business/menuAdd"; // WEB-INF에서 호출할 파일명
    }
    // 메뉴 추가 데이터 호출
	@RequestMapping(value = "/addMenu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addMenuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String img = (String) map.get("img");
		menuService.addMenu(map);
		resultMap.put("message", "성공");
		resultMap.put("idx", map.get("idx")); //!!
		
		return new Gson().toJson(resultMap);
	}
	
	// 메뉴 이미지 추가
	 @RequestMapping("/menuUpload")	// 게시글 업로드릉 위해 필용
	    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("idx") int idx, HttpServletRequest request,HttpServletResponse response, Model model)
	    {									// "file1"의 이름을 multi 로 하겠다는 의미
	        String url = null;
	        try {
	            String originFilename = multi.getOriginalFilename();	//파일 이름
	            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());	// 파일 확장자
	            long size = multi.getSize();
	            String saveFileName = genSaveFileName(extName);	// 현재시간으로 파일이름을 바꾸어서 img 폴더에 저장함으로써 이름이 중복되지 않도록
	            
	            System.out.println("originFilename : " + originFilename);
	            System.out.println("extensionName : " + extName);
	            System.out.println("size : " + size);
	            System.out.println("saveFileName : " + saveFileName);
	            
	            String path2 = System.getProperty("user.dir");	// 작업하고 있는 프로젝트 경로가 담기게 됨
	            System.out.println("Working Directory = " + path2 + "src\\webapp\\img\\menuImg");
	            if(!multi.isEmpty())	//이미지가 있을때 
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\img\\menuImg", saveFileName);	//현재 프로젝트 위치에서 + img폴더에 파일을 넣겠다라는 의미 
	                																						// >> 업로드하면 프로젝트에 현재시간으로 자동 저장
	                multi.transferTo(file);
	                                                 
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("img", "\\img\\menuImg\\" + saveFileName);	//경로+파일명 DB 저장	=> xml 파일에서도 #{img} 로 맞추어 줘야 한다~!!!!!!
	                map.put("idx", idx);	// 게시글 번호 DB저장
	                menuService.insertMenuImg(map);
	                
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";	// board-add 의   form.append( "file1", $("#file1")[0].files[0] ); 파트로 넘어가서 저장될 수 있도록 함 
	            }
	        }catch(Exception e)
	        {
	            System.out.println(e);
	        }
	        return "redirect:menu.add.do";
	    }

	    // 현재 시간을 기준으로 파일 이름 생성 for 이미지 추가
	    private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
	    }
	
		// 메뉴 상세보기 페이지
		@RequestMapping("/menu.detail.do") 
	    public String menuDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			String id = (String)session.getAttribute("userIdSession");
	    	String kind = (String)session.getAttribute("KindSession");
	    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    	String reskind = (String)session.getAttribute("userReskindSession");
			request.setAttribute("map", map);
			request.setAttribute("userId", id);
	    	request.setAttribute("kind", kind);
	    	request.setAttribute("reskind", reskind); 
	    	request.setAttribute("resnum",resnum); 
	    	System.out.println("메뉴상세보기 세션 넘어옴"); 
	    	System.out.println(resnum+" resnum");
	    	System.out.println(reskind+" reskind");
	    	
	        return "/web_business/menuDetail";
	    }
		// 메뉴 상세보기 호출
		@RequestMapping(value = "/menu.detail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String menuDetailList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = menuService.detailMenu(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
		
		// 메뉴 수정
	    @RequestMapping("/menu.edit.do") 
	    public String boardEdit(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	    	String id = (String)session.getAttribute("userIdSession");
	    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
	    	String kind = (String)session.getAttribute("KindSession");
	    	request.setAttribute("userId", id);
	    	request.setAttribute("kind", kind);
	    	return "/web_business/menuEdit"; // WEB-INF에서 호출할 파일명
	    }
		
	 // 메뉴 수정 호출
		@RequestMapping(value = "/editMenu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String editMenuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			menuService.editMenu(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}	    
}


