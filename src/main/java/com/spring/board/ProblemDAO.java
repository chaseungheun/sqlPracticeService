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

	// �̱���
	private static ProblemDAO instance = new ProblemDAO();

	private ProblemDAO() {
	}

	public static ProblemDAO getInstance() {
		return instance;
	}

	// �����ͺ��̽� insert ����
	public void insert(ProblemDto data) {
		Connection conn = null;
		PreparedStatement ppst = null;
		try {
			// JDBC Driver �ε�
			Class.forName(driver);
			// Connection ��ü ���� / DB ����(����)
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// ������ ���� ���� / no �÷��� �����ʹ� �������� �Է��ϰ�, reg_date�� ����Ŭ�� sysdate�� �Է�
			ppst = conn.prepareStatement("insert into problem values(SEQ_NUM.NEXTVAL, ?, ?, ?)");
			// �Ű������� ���޵� �����͸� �������� ����ǥ�� �� ����
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
