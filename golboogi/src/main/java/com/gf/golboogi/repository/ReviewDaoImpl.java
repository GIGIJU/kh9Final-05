package com.gf.golboogi.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gf.golboogi.entity.ReviewDto;
import com.gf.golboogi.vo.ReviewProfileVO;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewProfileVO> list(String keyword, int page, int size) {
		Map<String, Object> param = new HashMap<>();
		param.put("keyword", keyword);
		
		int end = page * size;
		int begin = end - (size - 1);
		param.put("begin", begin);
		param.put("end", end);
		
		return sqlSession.selectList("review.list", param);
	}

	@Override
	public int count(String keyword) {
		return sqlSession.selectOne("review.count", keyword);
	}

	@Override
	public void write(ReviewDto reviewDto) {
		int reviewNo = sqlSession.selectOne("review.sequence");
		reviewDto.setReviewNo(reviewNo);
		sqlSession.insert("review.write",reviewDto);
	}

	@Override
	public ReviewDto read(int reviewNo) {
		sqlSession.update("review.plusReadcount", reviewNo);
		return sqlSession.selectOne("review.one", reviewNo);
	}

	@Override
	public ReviewDto info(int reviewNo) {
		return sqlSession.selectOne("review.one", reviewNo);
	}

	@Override
	public boolean edit(ReviewDto reviewDto) {
		return sqlSession.update("review.edit", reviewDto) > 0;
	}

	@Override
	public boolean delete(int reviewNo) {
		int count = sqlSession.delete("review.delete", reviewNo);
		return count > 0;
	}

	@Override
	public List<ReviewDto> otherview(String fieldName) {
		return sqlSession.selectList("review.otherview", fieldName);
	}

	@Override
	public Double ratingView(String fieldName) {
		return sqlSession.selectOne("review.ratingView", fieldName);
	}

	@Override
	public List<ReviewProfileVO> selectOneFiled(String fieldName) {
		return sqlSession.selectList("review.oneFiledList", fieldName);
	}
	
	
}
