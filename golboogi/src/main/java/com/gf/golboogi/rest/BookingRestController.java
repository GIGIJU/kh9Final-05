package com.gf.golboogi.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;
import com.gf.golboogi.vo.TeeTimeListVO;


@RestController
@RequestMapping("/rest/booking")
public class BookingRestController {

	@Autowired
	private GolfFieldDao golfFieldDao;
	
	
	@PostMapping("")
	public List<TeeTimeListVO> list(@ModelAttribute BookingComplexSearchVO searchVO){
		return golfFieldDao.selectTeetimeList(searchVO);
	}
	
	
}