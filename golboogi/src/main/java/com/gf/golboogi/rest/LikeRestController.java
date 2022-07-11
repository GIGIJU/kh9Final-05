package com.gf.golboogi.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.entity.LikeDto;
import com.gf.golboogi.entity.ReplyDto;
import com.gf.golboogi.repository.LikeDao;

@RestController
@RequestMapping("/rest/like")
public class LikeRestController {

	@Autowired
	private LikeDao likeDao;
	
	@PostMapping("/")
	public LikeDto insert(
			HttpSession session, @RequestBody LikeDto likeDto) {
		String memberId = (String)session.getAttribute("login");
		likeDto.setLikeWinfo(memberId);
		return likeDao.insert(likeDto);
	}
	
	@GetMapping("/{likeTinfo}")
	public List<LikeDto> list(@PathVariable int likeTinfo) {
		return likeDao.list(likeTinfo);
	}
}
