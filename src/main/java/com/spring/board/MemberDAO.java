package com.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.board.MemberDto;

public class MemberDAO {
	// �̱���
	private static MemberDAO instance = new MemberDAO();

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		return instance;
	}

	static String driver = "oracle.jdbc.driver.OracleDriver";
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	PreparedStatement ppst = null;

	// 사용자 추가
	public boolean insert_user(MemberDto data) {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			if ( !checkPhone(data.getPhone())) {
				System.out.println("�̹� �ִ� ��");
				return false;
			}
			if ( !checkId(data.getId())) {
				System.out.println("�̹� �ִ� ID");
				return false;
			}
			ppst = conn.prepareStatement("insert into member values(?, ?, ?, ?, ?, 0)");
			ppst.setString(1, data.getName());
			ppst.setString(2, data.getPw());
			ppst.setString(3, data.getName());
			ppst.setString(4, data.getEmail());
			ppst.setString(5, data.getPhone());
			ppst.executeUpdate();
			System.out.println("ȸ������ �Ϸ�");
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
		return true;
	}
	//맞은 개수에 따라 랭킹 순서대로 사용자 조회
	public ArrayList<MemberDto> ranking() {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
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
	//ID로 사용자 정보 조회
	public MemberDto memberSearch(MemberDto data) {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from member where M_ID=?");
			ppst.setString(1, data.getId());
			ResultSet rs = ppst.executeQuery();
			MemberDto md = new MemberDto();
			rs.next();
			md.setId(rs.getString("M_ID"));
			md.setPw(rs.getString("M_PW"));
			md.setName(rs.getString("M_NAME"));
			md.setEmail(rs.getString("M_EMAIL"));
			md.setPhone(rs.getString("M_PHONE"));
			//맞은 갯수 추출
			ppst = conn.prepareStatement("select count(distinct prob_num) from submit_log where sub_answer='T' and M_ID="+md.getId());
			rs = ppst.executeQuery();
			rs.next();
			md.setP_cnt(rs.getString(1));
			
			//로그와 맞은 문제 적어주기. 
			return md;

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
		System.out.println("log4");
		return null;
	}

	//phone 이 중복되었는가?
	public boolean checkPhone(String phone) throws SQLException, ClassNotFoundException {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
		ppst = conn.prepareStatement("select * from member where M_PHONE=?");
		ppst.setString(1, phone);
		ResultSet rs = ppst.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString("M_PHONE"));
			return false;
		}
		return true;
	}
	//ID가 중복되었는가?
	public boolean checkId(String id) throws SQLException, ClassNotFoundException {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
		ppst = conn.prepareStatement("select * from member where M_ID=?");
		ppst.setString(1, id);
		ResultSet rs = ppst.executeQuery();
		if(rs.next()) {
			System.out.println(rs.getString("M_ID"));
			return false;
		}
		return true;
	}

}
