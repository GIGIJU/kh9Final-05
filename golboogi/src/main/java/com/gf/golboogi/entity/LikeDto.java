package com.gf.golboogi.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class LikeDto {

	private int likeNo;
	private int likeTinfo;
	private String likeWinfo;
	private String likeState;
}
