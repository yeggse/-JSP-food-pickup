package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.BoardService;
import com.example.demo.model.Board;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class BoardController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private BoardService boardService;

    @Autowired
    HttpSession session;
	
    // 웹 주소 :  게시글 기본출력
    @RequestMapping("/main.board.do") 
    public String boardlist(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardList"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 기본출력 데이터 호출
	@RequestMapping(value = "/firstBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardService.firstBoard(map);
		int cnt = boardService.countBoardCnt(map); // 게시글 숫자 세기
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);	// 게시글 숫자 세기
		return new Gson().toJson(resultMap);
	}
	
    // 웹 주소 :  게시글 상세보기
    @RequestMapping("/main.board.detail.do") 
    public String boardDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("noticenum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardDetail"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 상세 출력 데이터 호출
	@RequestMapping(value = "/detailBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String detailBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.detailBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
    // 웹 주소 :  게시글 수정하기
    @RequestMapping("/main.board.edit.do") 
    public String boardEdit(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println("게시글 수정하기 - 게시글 번호 : "+map.get("noticenum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardEdit"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 수정 데이터 호출
	@RequestMapping(value = "/editBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}

    // 웹 주소 :  게시글 작성하기
    @RequestMapping("/main.board.add.do") 
    public String boardAdd(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("noticenum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardAdd"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 작성 데이터 호출
	@RequestMapping(value = "/addBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String img = (String) map.get("img"); //!!!!!!!!!!!!!!!!
		boardService.insertBoard(map);
		resultMap.put("message", "성공");
		resultMap.put("noticenum", map.get("id")); //!!
		return new Gson().toJson(resultMap);
	}
	
    // 게시글 삭제 데이터 호출
	@RequestMapping(value = "/deleteBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
	    List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
		map.put("list", list);
	    boardService.deleteBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 게시글 이미지 추가
	 @RequestMapping("/upload")	// 게시글 업로드릉 위해 필용
	    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("noticenum") int noticenum, HttpServletRequest request,HttpServletResponse response, Model model)
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
	            System.out.println("Working Directory = " + path2 + "src\\webapp\\img\\boardUpload");
	            if(!multi.isEmpty())	//이미지가 있을때 
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\img\\boardUpload", saveFileName);	//현재 프로젝트 위치에서 + img폴더에 파일을 넣겠다라는 의미 
	                																						// >> 업로드하면 프로젝트에 현재시간으로 자동 저장
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("img", "\\img\\boardUpload\\" + saveFileName);	//경로+파일명 DB 저장	=> xml 파일에서도 #{img} 로 맞추어 줘야 한다~!!!!!!
	                map.put("noticenum", noticenum);	// 게시글 번호 DB저장
	        		boardService.insertBoardImg(map);
	                
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";	// board-add 의   form.append( "file1", $("#file1")[0].files[0] ); 파트로 넘어가서 저장될 수 있도록 함 
	            }
	        }catch(Exception e)
	        {
	            System.out.println(e);
	        }
	        return "redirect:main.board.do";
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
}


