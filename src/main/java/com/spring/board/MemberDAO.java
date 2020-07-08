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
				System.out.println(" 전화 번호 중복 ");
				return false;
			}
			if ( !checkId(data.getId())) {
				System.out.println(" ID 중복 ");
				return false;
			}
			ppst = conn.prepareStatement("insert into member values(?, ?, ?, ?, ?, ?)");
			ppst.setString(1, data.getName());
			ppst.setString(2, data.getPw());
			ppst.setString(3, data.getName());
			ppst.setString(4, data.getEmail());
			ppst.setString(5, data.getPhone());
			ppst.setString(6, "기본 상태 메세지");
			
			ppst.executeUpdate();
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
			ppst = conn.prepareStatement("select * from member");
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("m_id"));
				dto.setMessage(rs.getString("M_MESSAGE"));
				list.add(dto);
				
				//맞은 개수 추출
				ppst = conn.prepareStatement("select count(distinct prob_num) from submit_log where sub_answer='T' and M_ID=?");
				ppst.setString(1, dto.getId());
				ResultSet rs1 = ppst.executeQuery();
				rs1.next();
				dto.setOk_cnt(rs1.getString(1));
				//제출 개수 추출
				ppst = conn.prepareStatement("select count(*) from submit_log where M_ID=?");
				ppst.setString(1, dto.getId());
				rs1 = ppst.executeQuery();
				rs1.next();
				dto.setSub_cnt(rs1.getString(1));				
				
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
			md.setMessage(rs.getString("M_MESSAGE"));

			//맞은 갯수 추출
			ppst = conn.prepareStatement("select count(distinct prob_num) from submit_log where sub_answer='T' and M_ID=?");
			ppst.setString(1, data.getId());
			rs = ppst.executeQuery();
			rs.next();
			md.setOk_cnt(rs.getString(1));
			//로그 작성
			ppst = conn.prepareStatement("select PROB_NUM, SUB_DATE, SUB_ANSWER, SUB_CODE from submit_log where M_ID=? order by SUB_DATE DESC");
			ppst.setString(1, data.getId());
			rs = ppst.executeQuery();
			String str_log = "";
			while(rs.next()) {
				str_log +=rs.getString(1);
				if(rs.getString(3).equals("T")) {
					str_log +="::정답입니다.";
				}
				else {
					str_log +="::오답입니다.";
				}
				str_log +="::"+rs.getString(2);
				str_log +="::"+rs.getString(4)+"@@";
				
			}
			md.setLog(str_log);
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
	public boolean update_message(MemberDto data,String message) {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("update member set m_message = ? where m_id =?");
			ppst.setString(1, message);
			ppst.setString(2, data.getId());
			
			ppst.executeUpdate();
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
