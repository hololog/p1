package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//커넥션풀 접근제한자
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		conn=ds.getConnection();
		
		return conn;
	}
	//DBclose
	public void closeDB() {
		
		try {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	//리뷰작성
	public void insertReview(ReviewDTO rDTO) {
		String sql="INSERT INTO review VALUES (?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rDTO.getNum());
			pstmt.setString(2, rDTO.getNick());
			pstmt.setString(3, rDTO.getSubject());
			pstmt.setString(4, rDTO.getContent());
			pstmt.setString(5, rDTO.getFile());
			pstmt.setInt(6, rDTO.getReadcount());
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//게시물번호
	public int getNextNum() {
		String sql="SELECT MAX(num) FROM review";
		int max = 1;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				max += rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return max;
	}
	//리뷰목록
//	public List<ReviewDTO> getReviewList() {
//		String sql="SELECT * FROM review ORDER BY num desc";
//		List<ReviewDTO> reviewList=new ArrayList<>();
//		ReviewDTO rDTO=null;
//		
//		try {
//			conn=getConnection();
//			pstmt=conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			
//			while(rs.next()) {
//				rDTO=new ReviewDTO();
//				rDTO.setNum(rs.getInt("num"));
//				rDTO.setFile(rs.getString("review_file"));
//				rDTO.setSubject(rs.getString("subject"));
//				rDTO.setNick(rs.getString("nick"));
//				rDTO.setReadcount(rs.getInt("readcount"));
//				rDTO.setReviewDate(rs.getTimestamp("review_date"));
//				
//				reviewList.add(rDTO);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//		return reviewList;
//	}
	//리뷰목록(페이징-limit방식)
	public List<ReviewDTO> getReviewList(int pageSize, int startRow) {
		String sql="SELECT * FROM review ORDER BY num desc LIMIT ?,?";
		List<ReviewDTO> reviewList=new ArrayList<>();
		ReviewDTO rDTO=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				rDTO=new ReviewDTO();
				rDTO.setNum(rs.getInt("num"));
				rDTO.setFile(rs.getString("review_file"));
				rDTO.setSubject(rs.getString("subject"));
				rDTO.setNick(rs.getString("nick"));
				rDTO.setReadcount(rs.getInt("readcount"));
				rDTO.setReviewDate(rs.getTimestamp("review_date"));
				
				reviewList.add(rDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return reviewList;
	}	
	//전체 게시글수
	public int getReviewCount() {
		String sql="SELECT COUNT(*) FROM review";
		int count=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("COUNT(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	//조회수
	public void updateReadCount(int num) {
		String sql="UPDATE review SET readcount=readcount+1 WHERE num=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} 
	}
	//content가져오기
	public ReviewDTO getContent(int num) {
		String sql="SELECT * FROM review WHERE num=?";
		ReviewDTO rDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				rDTO=new ReviewDTO();
				rDTO.setNum(rs.getInt("num"));
				rDTO.setNick(rs.getString("nick"));
				rDTO.setSubject(rs.getString("subject"));
				rDTO.setContent(rs.getString("content"));
				rDTO.setFile(rs.getString("review_file"));
				rDTO.setReadcount(rs.getInt("readcount"));
				rDTO.setReviewDate(rs.getTimestamp("review_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} 
		return rDTO;
	}
}



















