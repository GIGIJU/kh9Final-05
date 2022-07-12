package com.gf.golboogi.repository;

public interface ReviewProfileDao {

	void insert(int reviewNo, int attachmentNo);

	int read(int reviewNo);

}
