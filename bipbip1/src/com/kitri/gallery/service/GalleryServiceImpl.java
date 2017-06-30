package com.kitri.gallery.service;

import com.kitri.gallery.service.GalleryService;
import com.kitri.gallery.service.GalleryServiceImpl;
import java.util.*;
import com.kitri.gallery.dao.GalleryDaoImpl;
import com.kitri.gallery.model.GalleryDto;

public class GalleryServiceImpl implements GalleryService {
	
	private static GalleryService galleryService;

	static {
		galleryService = new GalleryServiceImpl();
	}

	private GalleryServiceImpl() {
	}

	public static GalleryService getGalleryService() {
		return galleryService;
	}

	@Override
	public int writeArticle(GalleryDto galleryDto) {
		return GalleryDaoImpl.getGalleryDao().writeArticle(galleryDto);
	}

	@Override
	public GalleryDto getArticle(int seq) {

		return null;
	}

	@Override
	public List<GalleryDto> listArticle(int bcode, int pg, String key, String word) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("bcode", bcode + "");
		map.put("key", key);
		map.put("word", word);
		
		return GalleryDaoImpl.getGalleryDao().listArticle(map);
	}


	@Override
	public int modifyArticle(GalleryDto galleryDto) {

		return 0;
	}

	@Override
	public int deleteArticle(int seq) {

		return 0;
	}

}
