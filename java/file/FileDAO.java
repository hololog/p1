package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
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
	//게시물번호
	public int getNextNum() {
		String sql="SELECT MAX(num) FROM file";
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
	public void insertFile(FileDTO fDTO) {
		String sql="INSERT INTO file VALUES (?,?,?,?,?,?,?)";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, fDTO.getNum());
			pstmt.setString(2, fDTO.getNick());
			pstmt.setString(3, fDTO.getSubject());
			pstmt.setString(4, fDTO.getContent());
			pstmt.setString(5, fDTO.getFile());
			pstmt.setInt(6, fDTO.getReadcount());
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	public List<FileDTO> getFileList(int pageSize, int startRow) {
		String sql="SELECT * FROM file ORDER BY num desc LIMIT ?,?";
		List<FileDTO> fileList=new ArrayList<FileDTO>();
		FileDTO fDTO=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				fDTO=new FileDTO();
				fDTO.setNum(rs.getInt("num"));
				fDTO.setFile(rs.getString("file"));
				fDTO.setSubject(rs.getString("subject"));
				fDTO.setNick(rs.getString("nick"));
				fDTO.setReadcount(rs.getInt("readcount"));
				fDTO.setDate(rs.getTimestamp("date"));
				
				fileList.add(fDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return fileList;
	}	
	public int getFileCount() {
		String sql="SELECT COUNT(*) FROM file";
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
		} finally {
			closeDB();
		}
		return count;
	}
	public void updateReadCount(int num) {
		String sql="UPDATE file SET readcount=readcount+1 WHERE num=?";
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
	public FileDTO getContent(int num) {
		String sql="SELECT * FROM file WHERE num=?";
		FileDTO fDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				fDTO=new FileDTO();
				fDTO.setNum(rs.getInt("num"));
				fDTO.setNick(rs.getString("nick"));
				fDTO.setSubject(rs.getString("subject"));
				fDTO.setContent(rs.getString("content"));
				fDTO.setFile(rs.getString("file"));
				fDTO.setReadcount(rs.getInt("readcount"));
				fDTO.setDate(rs.getTimestamp("date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		} 
		return fDTO;
	}
	public void deleteFile(int num) {
		String sql="DELETE FROM file WHERE num=?";
		
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
	public void updateFile(FileDTO fDTO) {
		String sql="UPDATE file SET subject=?,content=?,file=?,date=?"
				 + "WHERE num=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, fDTO.getSubject());
			pstmt.setString(2, fDTO.getContent());
			pstmt.setString(3, fDTO.getFile());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(5, fDTO.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
}
