package com.gf.golboogi.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.error.CannotFindException;
import com.gf.golboogi.repository.AdminDao;
import com.gf.golboogi.service.ChartService;
import com.gf.golboogi.vo.ChartMemberVO;
import com.gf.golboogi.vo.ChartVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@CrossOrigin(origins = "http://127.0.0.1:5500")
//@CrossOrigin(origins = "http://127.0.0.1:5501")
@RequestMapping("/rest/manager")
public class ManagerRestController {
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/charts")
	public List<ChartMemberVO> charts() {
		return chartService.getMemberJoinList();
	}
	
//	@GetMapping("/charts")
//	public ChartVO chartVO() {
//		return chartService.chartVO();
//	}
//	
	
	
	@GetMapping("/stat")
	public List<ChartMemberVO> chartss() {
		return chartService.getMemberJoinList();
	}
}
