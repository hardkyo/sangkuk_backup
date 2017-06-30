package com.kitri.gallery.dao;

import java.sql.*;
import java.util.*;

import com.kitri.gallery.model.GalleryDto;
import com.kitri.board.model.ReboardDto;
import com.kitri.gallery.dao.GalleryDao;
import com.kitri.gallery.dao.GalleryDaoImpl;
import com.kitri.gallery.model.GalleryDto;
import com.kitri.util.db.DBClose;
import com.kitri.util.db.DBConnection;

public class GalleryDaoImpl implements GalleryDao {

	private static GalleryDao galleryDao;

	static {
		galleryDao = new GalleryDaoImpl();
	}

	private GalleryDaoImpl() {
	}

	public static GalleryDao getGalleryDao() {
		return galleryDao;
	}
	
	@Override
	public int writeArticle(GalleryDto gallerydto) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			System.out.println(gallerydto.getBcode());
			System.out.println(gallerydto.getOrignPicture());
			System.out.println(gallerydto.getSavePicture());
			System.out.println(gallerydto.getSaveFolder());
			System.out.println(gallerydto.getSeq());
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert all \n");
			sql.append("	into board (seq, name, id, email, subject, content, hit, logtime) \n");
			sql.append("	values(?, ?, ?, ?, ?, ?, 0, sysdate) \n");
			sql.append("	into album (aseq, seq, orign_picture, save_picture, savefolder, type) \n");
			sql.append("	values (album_aseq.nextval, ?, ?, ?, ?, 0) \n");
			sql.append("select * from dual \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setInt(++idx, gallerydto.getSeq());
			pstmt.setString(++idx, gallerydto.getName());
			pstmt.setString(++idx, gallerydto.getId());
			pstmt.setString(++idx, gallerydto.getEmail());
			pstmt.setString(++idx, gallerydto.getSubject());
			pstmt.setString(++idx, gallerydto.getContent());
			//pstmt.setInt(++idx, gallerydto.getBcode());
			pstmt.setInt(++idx, gallerydto.getSeq());
			pstmt.setString(++idx, gallerydto.getOrignPicture());
			pstmt.setString(++idx, gallerydto.getSavePicture());
			pstmt.setString(++idx, gallerydto.getSaveFolder());
			cnt = pstmt.executeUpdate();
			System.out.println("cnt =" + cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}
	@Override
	public GalleryDto getArticle(int seq) {
		
		return null;
	}
	@Override
	public List<GalleryDto> listArticle(Map<String, String> map) {
		List<GalleryDto> list = new ArrayList<GalleryDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			

			
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GalleryDto galleryDto = new GalleryDto();
				galleryDto.setAseq(rs.getInt("aseq"));
				galleryDto.setSeq(rs.getInt("seq"));
				galleryDto.setSubject(rs.getString("subject"));
				galleryDto.setContent(rs.getString("content"));
				galleryDto.setOrignPicture(rs.getString("orignpicture"));
				galleryDto.setSavePicture(rs.getString("savepicture"));
				galleryDto.setSaveFolder(rs.getString("savefolder"));
				galleryDto.setBcode(rs.getInt("bcode"));
				

				list.add(galleryDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
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
