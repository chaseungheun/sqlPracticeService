package com.spring.board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.board.MemberDto;

public class MemberDAO {
	// 싱글톤
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO(){}
	public static MemberDAO getInstance(){
		return instance;
	}
	static String driver = "oracle.jdbc.driver.OracleDriver";
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	// 데이터베이스 insert 로직
	public void insert(MemberDto data){
		Connection conn = null;
		PreparedStatement ppst = null;
		try {
			// JDBC Driver 로딩
			Class.forName(driver);
			// Connection 객체 생성 / DB 연결(접속)
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// 수행할 쿼리 정의 / no 컬럼의 데이터는 시퀀스로 입력하고, reg_date는 오라클의 sysdate로 입력
			ppst = conn.prepareStatement("insert into member values(?, ?, ?, ?, ?, 0)");
			// 매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
			ppst.setString(1, data.getName());
			ppst.setString(2, data.getPw());
			ppst.setString(3, data.getName());
			ppst.setString(4, data.getEmail());
			ppst.setString(5, data.getPhone());
			ppst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ppst != null) ppst.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.getStackTrace();
			}
		}
	}
	public ArrayList<MemberDto> ranking() {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement ppst = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from member order by m_cnt desc");
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("m_id"));
				dto.setP_cnt(rs.getString("m_cnt"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ppst != null)
					ppst.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.getStackTrace();
			}
		}
		return list;
	}
	
	public static MemberDto memberSearch(MemberDto data) {
		Connection conn = null;
		PreparedStatement ppst = null;
	   	System.out.println("log2");
		try {
			// JDBC Driver 로딩
			Class.forName(driver);
			// Connection 객체 생성 / DB 연결(접속)
		   	System.out.println("log30");
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// 수행할 쿼리 정의 / no 컬럼의 데이터는 시퀀스로 입력하고, reg_date는 오라클의 sysdate로 입력
			ppst = conn.prepareStatement("select * from member where M_ID=?");
			// 매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
		   	System.out.println("log31");
			ppst.setString(1, data.getId());
		   	System.out.println("log32");
			ResultSet rs = ppst.executeQuery();
		   	System.out.println("log33");
			MemberDto md= new MemberDto();
			rs.next();
			md.setId(rs.getString("M_ID"));
			md.setPw(rs.getString("M_PW"));
			md.setName(rs.getString("M_NAME"));
			md.setEmail(rs.getString("M_EMAIL"));
			md.setPhone(rs.getString("M_PHONE"));
		   	System.out.println("log3");
			return md;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ppst != null) ppst.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.getStackTrace();
			}
		}
	   	System.out.println("log4");
		return null;
	}

	
}
