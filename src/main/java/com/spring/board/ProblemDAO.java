package com.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.board.MemberDAO;
import com.spring.board.MemberDto;

public class ProblemDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";

	// 싱글톤
	private static ProblemDAO instance = new ProblemDAO();

	private ProblemDAO() {
	}

	public static ProblemDAO getInstance() {
		return instance;
	}

	// 데이터베이스 insert 로직
	public void insert(ProblemDto data) {
		Connection conn = null;
		PreparedStatement ppst = null;
		try {
			// JDBC Driver 로딩
			Class.forName(driver);
			// Connection 객체 생성 / DB 연결(접속)
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// 수행할 쿼리 정의 / no 컬럼의 데이터는 시퀀스로 입력하고, reg_date는 오라클의 sysdate로 입력
			ppst = conn.prepareStatement("insert into problem values(SEQ_NUM.NEXTVAL, ?, ?, ?)");
			// 매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
			ppst.setString(1, data.getP_title());
			ppst.setString(2, data.getP_body());
			ppst.setString(3, data.getP_answer());
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
	}

	public ArrayList<ProblemDto> select_all() {
		ArrayList<ProblemDto> list = new ArrayList<ProblemDto>();
		Connection conn = null;
		PreparedStatement ppst = null;
		System.out.println("log2");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from problem");
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				ProblemDto dto = new ProblemDto();
				
				dto.setP_num(Integer.parseInt(rs.getString("prob_num")));
				dto.setP_title(rs.getString("prob_title"));
				dto.setP_body(rs.getString("prob_body"));
				dto.setP_answer(rs.getString("prob_answer"));
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
}
