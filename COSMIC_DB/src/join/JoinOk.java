package join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	
	private String name , id , pw ,  phone1 , phone2 , phone3 , email_1 , email_2 , type;
	private Connection connection;
	private Statement stmt;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request , response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request , response);
	}

	protected void actionDo(HttpServletRequest request , HttpServletResponse response ) throws ServletException , IOException {
		request.setCharacterEncoding("EUC-KR");
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		email_1 = request.getParameter("email_1");
		email_2 = request.getParameter("email_2");
		type = request.getParameter("type");
	
	
		String query = "insert into member values('" + name +"' , '"+ id + "' , '" 
		+ pw +"' , '" + phone1 +"','"+phone2 +"','"+phone3+"','"+email_1 +"','"+email_2 +"','"+type+"')";
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" ,"cosmic", "cosmic");
			stmt = connection.createStatement();
			int i = stmt.executeUpdate(query);
			if(i==1){
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");		
			}else{
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}//try -if else  
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			}catch(Exception e2){
				e2.printStackTrace();			
			}//finally - try - catch
		}//finally
	} //actionDo
}



