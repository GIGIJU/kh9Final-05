package com.gf.golboogi.rest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.entity.JoinApplyDto;
import com.gf.golboogi.entity.JoinDto;
import com.gf.golboogi.repository.JoinDao;

@RestController
@RequestMapping("/rest/apply")
public class JoinApplyRestController {

	@Autowired
	private JoinDao joinDao;
	
	@PostMapping("/")
	public void joinApply(HttpSession session,@RequestBody JoinApplyDto joinApplyDto) {
		String memberId = (String) session.getAttribute("login");
		joinApplyDto.setMemberId(memberId);
		
		joinDao.joinApply(joinApplyDto);
	}
	
	@GetMapping("/{joinNo}")
	public JoinDto selectJoin(@PathVariable int joinNo) {
		return joinDao.selectOne(joinNo);
	}
}
