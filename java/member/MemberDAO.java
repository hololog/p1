package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

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
	//DB 회원등록
	public void insertMember(MemberDTO mDTO) {
		String sql="INSERT INTO member VALUES(?,?,?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(4, mDTO.getNick());
			pstmt.setString(5, mDTO.getEmail());
			pstmt.setString(6, mDTO.getAddress());
			//DB에서 디폴트 뭐가 더 좋을까?
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}//insertMember()
	//로그인
	public MemberDTO userCheck(MemberDTO loginDTO) {
		String sql="SELECT * FROM member WHERE id=? and pass=?";
		MemberDTO mDTO=null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, loginDTO.getId());
			pstmt.setString(2, loginDTO.getPass());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mDTO=new MemberDTO();
				
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setNick(rs.getString("nick"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setJoinDate(rs.getTimestamp("join_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return mDTO;
	}//userCheck()
	//회원정보조회
	public MemberDTO getUserInfo(String id) {
		String sql="SELECT * FROM member WHERE id=?";
		MemberDTO mDTO=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mDTO=new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setPass(rs.getString("pass"));
				mDTO.setName(rs.getString("name"));
				mDTO.setNick(rs.getString("nick"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setJoinDate(rs.getTimestamp("join_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return mDTO;
	}
	//회원정보 변경
	public void updateInfo(MemberDTO mDTO) {
		String sql="UPDATE member SET nick=?,name=?,email=?,address=? "
				+ "WHERE id=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getNick());
			pstmt.setString(2, mDTO.getName());
			pstmt.setString(3, mDTO.getEmail());
			pstmt.setString(4, mDTO.getAddress());
			pstmt.setString(5, mDTO.getId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//비밀번호 변경
	public int updatePass(MemberDTO mDTO) {
		String sql="UPDATE member SET pass=? WHERE id=?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getPass2());
			pstmt.setString(2, mDTO.getId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1; //예외발생
		} finally {
			closeDB();
		}
		return 0;
	}
	//회원탈퇴
	public void deleteMember(MemberDTO mDTO) {
		String sql="DELETE FROM member WHERE id=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mDTO.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	//유저리스트
	public List<MemberDTO> getUserList(int startRow, int pageSize) {
		String sql="SELECT * FROM member limit ?,?";
		List<MemberDTO> list=new ArrayList<>();
		MemberDTO mDTO=null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				mDTO=new MemberDTO();
				mDTO.setId(rs.getString("id"));
				mDTO.setName(rs.getString("name"));
				mDTO.setNick(rs.getString("nick"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setJoinDate(rs.getTimestamp("join_date"));
				
				list.add(mDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return list;
	}
	public int getMemberCount() {
		String sql="SELECT count(*) FROM member";
		int count=0;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return count;
	}
}
