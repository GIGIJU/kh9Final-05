package com.gf.golboogi.repository;

import java.util.List;

import com.gf.golboogi.entity.ReviewDto;

public interface ReviewDao {

	List<ReviewDto> list(String keyword, int page, int size);

	int count(String keyword);

	void write(ReviewDto reviewDto);

	ReviewDto read(int reviewNo);

	ReviewDto info(int reviewNo);

	boolean edit(ReviewDto reviewDto);

	boolean delete(int reviewNo);

	List<ReviewDto> otherview(String fieldName);

}
