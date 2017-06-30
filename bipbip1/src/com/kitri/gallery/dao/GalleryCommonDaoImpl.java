package com.kitri.gallery.dao;

import java.sql.*;

import com.kitri.util.db.DBClose;
import com.kitri.util.db.DBConnection;

public class GalleryCommonDaoImpl implements GalleryCommonDao {

	private static GalleryCommonDao commonDao;
	
	static{
		commonDao = new GalleryCommonDaoImpl();
	}
	private  GalleryCommonDaoImpl() {}
	
	
	public static GalleryCommonDao getCommonDao() {
		return commonDao;
	}



	@Override
	public int getNextSeq() {
		int seq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select board_seq.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			seq = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return seq;
	}

	@Override
	public void updateHit(int seq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "update board set hit = hit + 1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

}
