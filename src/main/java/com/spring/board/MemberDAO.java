package com.spring.board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

}
