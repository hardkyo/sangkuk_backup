package com.kitri.gallery.dao;

public interface GalleryCommonDao {
	int getNextSeq();
	void updateHit(int seq);
}
