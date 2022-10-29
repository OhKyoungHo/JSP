<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%

 //1. 이전 폼의 사용자 입력값을 얻어오기
 int empno 	  	  = Integer.parseInt(request.getParameter("empno"));
 String ename 	  = request.getParameter("ename");
 int deptno 	  = Integer.parseInt(request.getParameter("deptno"));
 String job	  	  = request.getParameter("job");
 int sal	  	  = Integer.parseInt(request.getParameter("sal"));
 
 
 //2. EmpVo 멤버변수에 지정 (해당 클래스에 getter/setter 해놓음)
 	//저장할 새로운 변수 생성
	EmpVO vo= new EmpVO();
 	vo.setEmpno(empno);	 
 	vo.setEname(ename);	
 	vo.setDeptno(deptno);	
 	vo.setJob(job);	
 	vo.setSal(sal);	
//3. DB에 입력
	EmpDAO dao = EmpDAO.getInstance();		//private로 설정해서 오류발생
	dao.insert(vo);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.
	 <hr/>
	 <!--1-2)얻어온 입력값을 출력  -->
	 	입력한 사번 	: <%= empno %><br/>	
		입력한 사원명	: <%= ename %>
		입력한 부서번호	: <%= deptno  %>
		입력한 업무 	: <%= job  %>
		입력한 월급 	: <%= sal  %>
	
</body>
</html>