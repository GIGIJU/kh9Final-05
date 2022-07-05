package com.gf.golboogi.vo;

import java.util.List;

import com.gf.golboogi.entity.GolfFieldDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GolfFieldBookingVO {
	private GolfFieldDto golfFieldDto;
	private List<BookingSearchListVO> timeList;
}
