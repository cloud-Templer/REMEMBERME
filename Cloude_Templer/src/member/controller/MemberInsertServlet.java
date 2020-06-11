package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.exception.InsertFailException;
import member.model.service.MemberServiceImpl;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");			//id
		String userName = request.getParameter("userName");		//이름
		String userPwd = request.getParameter("userPwd");		//비밀번호
		String nickName = request.getParameter("nickName");		//닉네임
		String phone = request.getParameter("phone");			//핸드폰번호
	
		
		String var1=request.getParameter("sample6_postcode");	//주소
		String var2=request.getParameter("sample6_address");	//주소2
		String var3=request.getParameter("sample6_detailAddress");//주소3
		String var4=request.getParameter("sample6_extraAddress");//주소4
		
		String address = "";									//주소1~4합침	
		address +=var1;
		address +=var2;
		address +=var3;
		address +=var4;	
		
		String email = request.getParameter("email");			//이메일
		Member m = new Member(userId, userName,userPwd , nickName, phone, address, email);
		int result =0;
		
		try {
			result = new MemberServiceImpl().insertMember(m);
			
			if(result > 0) {
				response.sendRedirect("index.jsp");
			}else {
				String msg = "다시 시도해주세요";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} catch (InsertFailException e) {
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			//e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
