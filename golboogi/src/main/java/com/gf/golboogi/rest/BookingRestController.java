package com.gf.golboogi.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gf.golboogi.repository.GolfFieldDao;
import com.gf.golboogi.vo.BookingComplexSearchVO;
import com.gf.golboogi.vo.BookingSearchListVO;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

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