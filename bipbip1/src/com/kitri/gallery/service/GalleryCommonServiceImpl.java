package com.kitri.gallery.service;

import com.kitri.gallery.dao.GalleryCommonDaoImpl;

public class GalleryCommonServiceImpl implements GalleryCommonService {

	private static GalleryCommonService commonService;
	
	static{
		 commonService = new GalleryCommonServiceImpl();
	}
	
	private GalleryCommonServiceImpl(){}
	
	
	public static GalleryCommonService getCommonService() {
		return commonService;
	}


	@Override
	public int getNextSeq() {
		
		return GalleryCommonDaoImpl.getCommonDao().getNextSeq();
	}


	@Override
	public void updateHit(int seq) {
		// TODO Auto-generated method stub
		
	}

}
