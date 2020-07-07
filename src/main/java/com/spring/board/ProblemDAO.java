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
	Connection conn = null;
	PreparedStatement ppst = null;
	// �̱���
	private static ProblemDAO instance = new ProblemDAO();

	private ProblemDAO() {
	}

	public static ProblemDAO getInstance() {
		return instance;
	}

	//문제 삽입
	public void insert_problem(ProblemDto data) {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("insert into problem values(SEQ_NUM.NEXTVAL, ?, ?, ?)");
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
	//문제 번호로 문제 가져오기
	public ProblemDto select_num(String p_no) {
		ProblemDto dto = new ProblemDto();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from problem where prob_num = ?");
			ppst.setString(1, p_no);
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				dto.setP_num(Integer.parseInt(rs.getString("prob_num")));
				dto.setP_title(rs.getString("prob_title"));
				dto.setP_body(rs.getString("prob_body"));
				dto.setP_answer(rs.getString("prob_answer"));
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
		return dto;
	}
	//select 문제 풀이
	public String select_answer(String sql) {
		String ret = "";
		int colnum = 0;
		ProblemDto dto = new ProblemDto();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement(sql);

			ResultSet rs = ppst.executeQuery();

			colnum = (rs.getMetaData()).getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= colnum; i++) {
					ret += rs.getString(i);
				}
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
		return ret;
	}
	//create 문제 풀이
	public String create_answer(String sql) {
		String ret = "";
		return ret;
	}
	// modify 문제 풀이
	public String modify_answer(String sql) {
		String ret = "";
		return ret;
	}
	//문제 전체 select
	public ArrayList<ProblemDto> select_all() {
		ArrayList<ProblemDto> list = new ArrayList<ProblemDto>();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from problem order by prob_num");
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				ProblemDto dto = new ProblemDto();
				dto.setP_num(Integer.parseInt(rs.getString("prob_num")));
				dto.setP_title(rs.getString("prob_title"));
				dto.setP_body(rs.getString("prob_body"));
				dto.setP_answer(rs.getString("prob_answer"));
				//전체 제출 횟수
				ppst = conn.prepareStatement("select count(*) from submit_log where prob_num ="+dto.getP_num());
				ResultSet rs1 = ppst.executeQuery();
				rs1.next();
				dto.setSub_cnt(rs1.getString(1));
				//정답 제출 횟수
				ppst = conn.prepareStatement("select count(*) from submit_log where sub_answer = 'T' and prob_num ="+dto.getP_num());
				rs1 = ppst.executeQuery();
				rs1.next();
				dto.setOk_cnt(rs1.getString(1));
				
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
	//테이블 생성
	public void insert_table(String sql) {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			if (sql.split(" ")[0].toUpperCase().equals("CREATE")) {
				String[] sql_split = sql.split(";");
				for(int i=0;i<sql_split.length;i++) {
					ppst = conn.prepareStatement(sql_split[i]);
					ppst.executeUpdate();
				}
			} else {
				System.out.println("create 문이 아닙니다.");
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
	}
}
