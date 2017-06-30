package com.kitri.map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kitri.map.model.MapDto;
import com.kitri.util.db.DBClose;
import com.kitri.util.db.DBConnection;

public class MapDaoImpl implements MapDao {
	
	private static MapDao mapDao;
	
	public static MapDao getMapDao() {
		return mapDao;
	}

	static {
		mapDao = new MapDaoImpl();
	}
	
	public MapDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int writeMapArticle(MapDto mapDto) {
		// TODO 경로 DB 등록
		System.out.println("CONTACT!!!!!");
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			StringBuffer sql = new StringBuffer();
			sql.append("\n");
			sql.append("insert\n");
			sql.append("into map(loc1X,loc1Y,loc2X,loc2Y,\n");
			sql.append("sec1X,sec1Y,sec2X,sec2Y,sec3X,sec3Y,\n");
			sql.append("loc1,loc2,sec1,sec2,sec3,\n");
			sql.append("memo, maphit)\n");
			sql.append("values (?,?,?,?,\n");
			sql.append("?,?,?,?,?,?,\n");
			sql.append("?,?,?,?,?,\n");
			sql.append("?, 0)\n");

			pstmt = conn.prepareStatement(sql.toString());

			int idx = 0;

			pstmt.setDouble(++idx, mapDto.getLoc1X());
			pstmt.setDouble(++idx, mapDto.getLoc1Y());
			pstmt.setDouble(++idx, mapDto.getLoc2X());
			pstmt.setDouble(++idx, mapDto.getLoc2Y());
			pstmt.setDouble(++idx, mapDto.getSec1X());
			pstmt.setDouble(++idx, mapDto.getSec1Y());
			pstmt.setDouble(++idx, mapDto.getSec2X());
			pstmt.setDouble(++idx, mapDto.getSec2Y());
			pstmt.setDouble(++idx, mapDto.getSec3X());
			pstmt.setDouble(++idx, mapDto.getSec3Y());
			pstmt.setString(++idx, mapDto.getLoc1());
			pstmt.setString(++idx, mapDto.getLoc2());
			pstmt.setString(++idx, mapDto.getSec1());
			pstmt.setString(++idx, mapDto.getSec2());
			pstmt.setString(++idx, mapDto.getSec3());
			pstmt.setString(++idx, mapDto.getMemo());

			cnt = pstmt.executeUpdate();
			conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

		return cnt;
	}

	@Override
	public MapDto getMapArticle(int seq) {
		MapDto mapDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("\n");
			sql.append("select loc1X,loc1Y,loc2X,loc2Y,\n");
			sql.append("sec1X,sec1Y,sec2X,sec2Y,sec3X,sec3Y,\n");
			sql.append("loc1,loc2,sec1,sec2,sec3,\n");
			sql.append("memo)\n");
			sql.append("from map m\n"); // 조인할 테이블 가져올 것
			sql.append("where m.seq\n");
			sql.append("and m.seq = ?\n");
			// 수정해야합니다.
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();

			rs.next();
			mapDto = new MapDto();
			mapDto.setLoc1X(rs.getDouble("loc1X"));
			mapDto.setLoc1Y(rs.getDouble("loc1Y"));
			mapDto.setLoc2X(rs.getDouble("loc2X"));
			mapDto.setLoc2Y(rs.getDouble("loc2Y"));
			mapDto.setSec1X(rs.getDouble("sec1X"));
			mapDto.setSec1Y(rs.getDouble("sec1Y"));
			mapDto.setSec2X(rs.getDouble("sec2X"));
			mapDto.setSec2Y(rs.getDouble("sec2Y"));
			mapDto.setSec3X(rs.getDouble("sec3X"));
			mapDto.setSec3Y(rs.getDouble("sec3Y"));
			
			mapDto.setLoc1(rs.getString("loc1"));
			mapDto.setLoc2(rs.getString("loc2"));
			mapDto.setSec1(rs.getString("sec1"));
			mapDto.setSec2(rs.getString("sec2"));
			mapDto.setSec3(rs.getString("sec3"));
			
			mapDto.setMemo(rs.getString("memo"));
			mapDto.setMapHit(rs.getInt("maphit"));
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return mapDto;
	}

	@Override
	public List<MapDto> listMapArticle(Map<String, String> map) {
		// TODO 글 목록 검색
				List<MapDto> list = new ArrayList<MapDto>();
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					conn = DBConnection.getConnection();
					StringBuffer sql = new StringBuffer();
					sql.append("\n");
					sql.append("select loc1X,loc1Y,loc2X,loc2Y,\n");
					sql.append("sec1X,sec1Y,sec2X,sec2Y,sec3X,sec3Y,\n");
					sql.append("loc1,loc2,sec1,sec2,sec3,\n");
					sql.append("memo)\n");
					sql.append("from map m\n"); // 조인할 테이블 가져올 것
					sql.append("where m.seq\n");
					sql.append("and m.seq = ?\n");
					// 수정해야합니다.
					//////
					sql.append("			decode(to_char(logtime, 'yymmdd'),\n");
					sql.append("				to_char(sysdate, 'yymmdd'), to_char(logtime, 'hh24:mi:ss'),\n");
					sql.append("				to_char(logtime, 'yy.mm.dd')) logtime,\n");
					//////
					
//					String key = map.get("key");
//					String word = map.get("word");
//					if(!key.isEmpty() && !word.isEmpty()){
//						// 제목(like), 글쓴이(=), 번호(=)
//						if (key.equals("subject")){
//							sql.append("		and subject like '%'||?||'%'\n");
//						} else {
//							sql.append("		and b."+key+"=?\n");
//						}
//
//					}			
					sql.append("	order by seq desc\n");
//					sql.append(") a\n");
//					sql.append("where rownum <= ?\n");
//					sql.append(") b \n");
//					sql.append("where b.rn >?\n");

					pstmt = conn.prepareStatement(sql.toString());
					int idx = 0;
//					pstmt.setString(++idx, map.get("bcode"));
//					if(!key.isEmpty() && !word.isEmpty()) 
					pstmt.setString(++idx, word);
					pstmt.setString(++idx, map.get("end"));
					pstmt.setString(++idx, map.get("start"));
					rs = pstmt.executeQuery();
					while (rs.next()){
						MapDto mapDto = new MapDto();
						////// map 테이블에서는 제목만 가져온댜.
						mapDto.setLoc1X(rs.getDouble("loc1X"));
						mapDto.setLoc1Y(rs.getDouble("loc1Y"));
						mapDto.setLoc2X(rs.getDouble("loc2X"));
						mapDto.setLoc2Y(rs.getDouble("loc2Y"));
						mapDto.setSec1X(rs.getDouble("sec1X"));
						mapDto.setSec1Y(rs.getDouble("sec1Y"));
						mapDto.setSec2X(rs.getDouble("sec2X"));
						mapDto.setSec2Y(rs.getDouble("sec2Y"));
						mapDto.setSec3X(rs.getDouble("sec3X"));
						mapDto.setSec3Y(rs.getDouble("sec3Y"));
						
						mapDto.setLoc1(rs.getString("loc1"));
						mapDto.setLoc2(rs.getString("loc2"));
						mapDto.setSec1(rs.getString("sec1"));
						mapDto.setSec2(rs.getString("sec2"));
						mapDto.setSec3(rs.getString("sec3"));
						
						mapDto.setMemo(rs.getString("memo"));
						mapDto.setMapHit(rs.getInt("maphit"));
						
						list.add(mapDto);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBClose.close(conn, pstmt,rs);
				}

				return list;
	}

	@Override
	public int modifyArticle(MapDto mapDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
