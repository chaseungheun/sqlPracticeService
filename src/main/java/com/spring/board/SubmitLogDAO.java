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
	// �̱���
	private static SubmitLogDAO instance = new SubmitLogDAO();

	private SubmitLogDAO() {
	}

	public static SubmitLogDAO getInstance() {
		return instance;
	}

	// 문제 제출시 로그 입력
	public void insert(SubmitLogDto data) {

		try {
			// JDBC Driver �ε�
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("insert into submit_log values(SUBMIT_LOG_SEQ.NEXTVAL, ?, ?, ?, ?, TO_CHAR(SYSDATE,'YY/MM/DD HH24:MI:SS'))");
			
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
