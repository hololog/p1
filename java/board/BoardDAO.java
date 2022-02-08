package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		conn=ds.getConnection();
		return conn;
	}
	public void closeDB() {
		try {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	//게시글 번호 부여(최근글=>오름차순)
	public int getNextNum() {
		String sql="SELECT MAX(num) FROM board";
		int result=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) 
				result=rs.getInt(1)+1; //게시물 번호부여
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result; 
	}
	//게시글 생성
	public void insertBoard(BoardDTO bDTO){
		String sql="INSERT INTO board VALUES(?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,bDTO.getNum());
			pstmt.setString(2,bDTO.getNick());
			pstmt.setString(3,bDTO.getSubject());
			pstmt.setString(4,bDTO.getContent());
			pstmt.setInt(5,bDTO.getReadcount());
			pstmt.setString(6,bDTO.getOpen());
			pstmt.setTimestamp(7,new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	public void updateReadcount(int num) {
		String sql="UPDATE board SET readcount=readcount+1 WHERE num=?";
		
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
	
	public List<BoardDTO> getBoardList(int startRow, int pageSize) {
		String sql="SELECT * FROM board ORDER BY num desc limit ?,?";
		List<BoardDTO> list=new ArrayList<BoardDTO>();
		BoardDTO bDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				bDTO=new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setNick(rs.getString("nick"));
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setReadcount(rs.getInt("readcount"));
				bDTO.setOpen(rs.getString("open"));
				bDTO.setDate(rs.getTimestamp("insert_date"));
				
				list.add(bDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return list;
	}
	
	public int getBoardCount() {
		String sql="SELECT count(*) FROM board";
		int result=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}
	
	public BoardDTO getContent(int num) {
		String sql="SELECT * FROM board WHERE num=?";
		BoardDTO bDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				bDTO=new BoardDTO();
				bDTO.setNum(rs.getInt("num"));
				bDTO.setNick(rs.getString("nick"));
				bDTO.setSubject(rs.getString("subject"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setReadcount(rs.getInt("readcount"));
				bDTO.setOpen(rs.getString("open"));
				bDTO.setDate(rs.getTimestamp("insert_date"));
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return bDTO;
	}

	public void updateBoard(BoardDTO bDTO) {
		String sql="UPDATE board SET subject=?,content=? WHERE num=?";

		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,bDTO.getSubject());
			pstmt.setString(2,bDTO.getContent());
			pstmt.setInt(3,bDTO.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	
	public void deleteBoard(int num) {
		String sql="DELETE FROM board WHERE num=?";
		
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
	
}

































