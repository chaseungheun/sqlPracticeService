package com.spring.board;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.board.MemberDAO;
import com.spring.board.MemberDto;

public class JProblemDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	PreparedStatement ppst = null;
	// �̱���
	private static JProblemDAO instance = new JProblemDAO();

	private JProblemDAO() {
	}

	public static JProblemDAO getInstance() {
		return instance;
	}

	//문제 삽입
	public void insert_problem(JProblemDto data) {

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("insert into j_problem values(JSEQ_NUM.NEXTVAL, ?, ?, ?)");
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
	public JProblemDto select_num(String p_no) {
		JProblemDto dto = new JProblemDto();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from j_problem where prob_num = ?");
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
	//java 문제 풀이
	public boolean java_answer(JProblemDto data, String solu) {
		String ret = "";
		Cmd cmd = new Cmd();
		
		return cmd.jprob_check(data, solu);
	}
	//문제 전체 select
	public ArrayList<JProblemDto> select_all() {
		ArrayList<JProblemDto> list = new ArrayList<JProblemDto>();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
			ppst = conn.prepareStatement("select * from j_problem order by prob_num");
			ResultSet rs = ppst.executeQuery();
			while (rs.next()) {
				JProblemDto dto = new JProblemDto();
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

}

class Cmd{
	private StringBuffer buffer;
	private Process process;
	private BufferedReader bufferedReader;
	private StringBuffer readBuffer;
		

		public String execCommand(String cmd) {
			try {
				process = Runtime.getRuntime().exec(cmd);
				bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
				String line = null;
				readBuffer = new StringBuffer();
				while((line = bufferedReader.readLine()) != null) {
					readBuffer.append(line);
					readBuffer.append("\n");
				}
				return readBuffer.toString();
				
			}catch(Exception e) {
				e.printStackTrace();
				System.exit(1);
			}
			return null;
		}
		public String inputCommand(String cmd) {
			buffer =new StringBuffer();
			buffer.append("cmd /c");
			buffer.append(cmd);
			return buffer.toString();
		}
		//1.db에서 java파일 꺼내오기. 꺼내오면서 //solution 부분을 입력받은 코드를 대신넣어줌 
		// 파일의 메인에는 비교하여 True,False를 출력해야함
		// 파일을 저장함., 나중에는 문제 번호도 같이 받아야함.
		public Boolean jprob_check(JProblemDto data, String str_sol) {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String str_java= null;
			
			Connection conn;
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, "c##ora_user", "88888888");
				PreparedStatement ppst = conn.prepareStatement("Select * from j_problem where prob_num = ?");
				ppst.setString(1, data.getP_num()+"");

				ResultSet rs = ppst.executeQuery();
				rs.next();
				str_java = rs.getString("PROB_ANSWER");
				str_java = str_java.replace("//solution", str_sol);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 위에까지가 db에서 자바 파일 가져오고 문제 푸는 사람의 솔루션을 넣어주는 코드
			// 아래의 코드는 그 문자열을 파일로 바꿔주고 cmd로 실행시켜 답이 맞는지 아닌지 확인하는 코드
			// 문제 타이틀은 자바 파일의 명과 같아야한다.
			String title = data.getP_title();
		    File newFile = new File(title+".java");
		    FileWriter writer =null;
		    	try {
					if(newFile.createNewFile()) {
						
					}
					writer = new FileWriter(newFile, false);
					writer.write(str_java);
					writer.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			String command = inputCommand("cmd /c javac "+title+".java & cmd /c java "+title);
			String cmd_result = execCommand(command);
			System.out.println(cmd_result);
			if(cmd_result.contains("true")) {
				System.out.println("java pro OK");
				return true;
			}
			System.out.println("java pro No");
			return false;
		}
}