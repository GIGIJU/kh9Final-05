package com.gf.golboogi.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.entity.ReplyDto;
import com.gf.golboogi.repository.ReplyDao;


@RestController
@RequestMapping("/rest/reply")
public class ReplyRestController {
	
	@Autowired
	private ReplyDao replyDao;
	
	@PostMapping("/")
	public ReplyDto insert(
			HttpSession session, @RequestBody ReplyDto replyDto) {
		String memberId = (String)session.getAttribute("login");
		replyDto.setReplyWriter(memberId);
		return replyDao.insert(replyDto);
	}
	
	@GetMapping("/{replyTarget}")
	public List<ReplyDto> list(@PathVariable int replyTarget) {
		return replyDao.list(replyTarget);
	}
	
	@DeleteMapping("/{replyNo}")
	public void delete(@PathVariable int replyNo) {
		replyDao.delete(replyNo);
	}
	
	@PutMapping("/")
	public ReplyDto edit(@RequestBody ReplyDto replyDto) {
		return replyDao.edit(replyDto);
	}
	
}