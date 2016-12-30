package join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private String name , id , pw ,type;
    private Connection connection;
    private Statement stmt;
    private ResultSet resultSet;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request ,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request ,response);
	}
	
	protected void actionDo (HttpServletRequest request , HttpServletResponse response)throws ServletException , IOException{
			request.setCharacterEncoding("EUC-KR");
			//if type == crew 
			//if type == center manager
			// if type == client
			id= request.getParameter("id");
			pw=request.getParameter("pw");
			
			System.out.println("id : "+id);
			System.out.println("pw : "+pw);
			
			String query = "select * from member where id='"+id+"'";
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" ,"cosmic" , "cosmic");
				stmt = connection.createStatement();
				resultSet = stmt.executeQuery(query);
				while(resultSet.next()){
					System.out.println("while come ");
					name=resultSet.getString("name");
					id= resultSet.getString("id");
					pw =resultSet.getString("pw");
					type = resultSet.getString("type");	
					
					
				}//while
				//set Variable to send each servlet page 
				HttpSession httpSession =  request.getSession();
				httpSession.setAttribute("name", name);
				httpSession.setAttribute("id", id);
				httpSession.setAttribute("pw", pw);
				httpSession.setAttribute("type",type);
				
				System.out.println("ÇöÀç type :"+type);
				if(type.contains("center_manager")){
					System.out.println("in center_manager");
					response.sendRedirect("center_loginResult.jsp");
				}else if (type.contains("crew")){
					System.out.println("in crew page");
					response.sendRedirect("crew_loginResult.jsp");
				}else{
					System.out.println("in client page");
					response.sendRedirect("client_loginResult.jsp");
				}//while -else 				
			}catch(Exception e){e.printStackTrace();
			}finally{
				try{
					if (resultSet != null) resultSet.close();
					if (stmt != null) stmt.close();
					if(connection != null) connection.close();
					
				}catch(Exception e2){
					e2.printStackTrace();
			}
		}
	}
}
