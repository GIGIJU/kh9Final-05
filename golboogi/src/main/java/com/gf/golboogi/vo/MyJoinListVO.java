package com.gf.golboogi.vo;

import java.util.List;

import com.gf.golboogi.entity.JoinApplyDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MyJoinListVO {
	private JoinListVO joinListVO;
	private List<JoinApplyListVO> joinApplyList;
}
