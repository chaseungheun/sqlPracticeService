package com.spring.board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spring.board.MemberDto;

public class MemberDAO {
	// �̱���
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO(){}
	public static MemberDAO getInstance(){
		return instance;
	}
	// �����ͺ��̽� insert ����
	public void insert(MemberDto data){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		PreparedStatement ppst = null;
		try {
			// JDBC Driver �ε�
			Class.forName(driver);
			// Connection ��ü ���� / DB ����(����)
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// ������ ���� ���� / no �÷��� �����ʹ� �������� �Է��ϰ�, reg_date�� ����Ŭ�� sysdate�� �Է�
			ppst = conn.prepareStatement("insert into member values(?, ?, ?, ?, ?)");
			// �Ű������� ���޵� �����͸� �������� ����ǥ�� �� ����
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
	public static MemberDto memberSearch(MemberDto data) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		PreparedStatement ppst = null;
	   	System.out.println("log2");
		try {
			// JDBC Driver �ε�
			Class.forName(driver);
			// Connection ��ü ���� / DB ����(����)
		   	System.out.println("log30");
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			// ������ ���� ���� / no �÷��� �����ʹ� �������� �Է��ϰ�, reg_date�� ����Ŭ�� sysdate�� �Է�
			ppst = conn.prepareStatement("select * from member where M_ID=?");
			// �Ű������� ���޵� �����͸� �������� ����ǥ�� �� ����
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
