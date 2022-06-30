package com.gf.golboogi.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.vo.BookingSearchListVO;

@RestController
@RequestMapping("/rest/booking")
public class BookingRestController {

	@Autowired
	private GolfFieldDao golfFieldDao;
	
	
	@GetMapping("/{teeTimeD}")
	public List<BookingSearchListVO> list(@PathVariable String teeTimeD){
		return golfFieldDao.teeTimeDayList(teeTimeD);
	}
}
