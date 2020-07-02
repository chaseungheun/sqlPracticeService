package com.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SubmitLogDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	PreparedStatement ppst = null;
	// 싱글톤
	private static SubmitLogDAO instance = new SubmitLogDAO();

	private SubmitLogDAO() {
	}

	public static SubmitLogDAO getInstance() {
		return instance;
	}

	// 데이터베이스 insert 로직
	public void insert(SubmitLogDto data) {

		try {
			// JDBC Driver 로딩
			Class.forName(driver);
			// Connection 객체 생성 / DB 연결(접속)
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// 수행할 쿼리 정의 / no 컬럼의 데이터는 시퀀스로 입력하고, reg_date는 오라클의 sysdate로 입력
			ppst = conn.prepareStatement("insert into submit_log values(SUBMIT_LOG_SEQ.NEXTVAL, ?, ?, ?, ?)");
			// 매개변수로 전달된 데이터를 쿼리문의 물음표에 값 매핑
			ppst.setString(1, data.getM_ID());
			ppst.setString(2, data.getProb_num());
			ppst.setString(3, data.getSub_answer());
			ppst.setString(4, data.getSub_code());
			
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
}
