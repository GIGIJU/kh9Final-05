package com.gf.golboogi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gf.golboogi.entity.GolfFieldDto;
import com.gf.golboogi.repository.FieldProfileDao;
import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.service.GolfFieldService;
import com.gf.golboogi.vo.FieldProfileVO;


@Controller
@RequestMapping("/field")
public class GolfFieldController {
	
	@Autowired
	private GolfFieldDao golfFieldDao;
	
	@Autowired
	private FieldProfileDao fieldProfileDao;
	
	@Autowired
	private GolfFieldService golfFieldService;
	
	@GetMapping("/golf_field")
	public String golfField(
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int p,
			@RequestParam(required = false, defaultValue = "15") int s,
			Model model) {
			String area=null;
			
			List<GolfFieldDto> list = golfFieldDao.list(type, keyword, p, s);
			
			model.addAttribute("list", list);
			
			boolean search = type != null && keyword != null;
			model.addAttribute("search", search);
			 
			int count = golfFieldDao.countAll();
			int lastPage = (count + s - 1) / s;
			
			int blockSize = 10;//블록 크기
			int endBlock = (p + blockSize - 1) / blockSize * blockSize;
			int startBlock = endBlock - (blockSize - 1);
			if(endBlock > lastPage){
				endBlock = lastPage;
			}
			
			model.addAttribute("p", p);
			model.addAttribute("s", s);
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("lastPage", lastPage);	
//			model.addAttribute("fieldArea",fieldArea);
			return "field/golf_field";
	}

	@GetMapping("/detail/{fieldNo}")
	public String detail(@PathVariable int fieldNo, Model model) {
		GolfFieldDto info = golfFieldDao.selectOne(fieldNo);
		model.addAttribute("info", info);
		
//		//골프장 이미지의 다운로드 주소를 추가 @이기주
		List<FieldProfileVO> list = fieldProfileDao.multiInfo(info.getFieldNo());
		model.addAttribute("list", list);
		if(list == null) {
			model.addAttribute("profileUrl", "/images/golf-dummy.jpg");
		}
		else {
			model.addAttribute("profileUrl", "/attachment/download?attachmentNo=");
		}
		
		return "field/field_detail";
	}
	
	
	
	
}