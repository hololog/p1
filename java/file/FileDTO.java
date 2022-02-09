package file;

import java.sql.Timestamp;

public class FileDTO {
	private int num;//게시글번호
	private String nick;//글쓴이
	private String subject; 
	private String content;
	private int readcount;
	private String file;
	private Timestamp date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp reviewDate) {
		this.date = reviewDate;
	}
	
}
