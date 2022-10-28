package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmpDAO {
	//생성자를 private 를 사용하여 생성을 불가능하게 하고 
	//getInstance를 통해서만 생성이 가능하도록 설정(정적타입으로 선언)
	private EmpDAO() throws Exception{
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("EmpDAO 객체 생성 - 드라이버로딩");
	}
	//싱글톤에서는 하나의 하나'의 인스턴스만 생성하여 사용하기 때문에 없는 경우에만 
	//객체를 생성하는 것으로 설정해서 식을 작성
	static EmpDAO empDAO = null;
	public static EmpDAO getInstance() throws Exception{
		//empDAO ==null(정보가 없는 경우)인 경우에 EmpDAO 객체 생성
		if(empDAO ==null) empDAO = new EmpDAO();
		return empDAO;	//새로운 객체 반환
	}//해당 경우에는 1번만 가능하도록 설정

	//정보를 입력했을 경우
	public void insert(EmpVO vo) throws Exception{
		//변수선언 
		Connection con= null;
		PreparedStatement ps=null;
		try {
			// 2. 연결객체 얻어오기
			String url ="jdbc:oracle:thin:@192.168.0.26:1521:xe";
			String user ="scott";
			String pass ="tiger";
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("디비 연결 성공");
			// 3. sql 문장 만들기
			String sql = "INSERT INTO emp(empno, ename, deptno, job, sal) VALUES(?,?,?,?,?)";
			// 4. 전송 객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getEmpno());
			ps.setString(2, vo.getEname());
			ps.setInt(3, vo.getDeptno());
			ps.setString(4, vo.getJob());
			ps.setInt(5, vo.getSal());
			// 5. 전송
			ps.executeUpdate();
		}finally {
			// 6. 닫기
			con.close();
		}
	}
}
