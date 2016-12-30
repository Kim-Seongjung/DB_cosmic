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
 * Servlet implementation class Client_searchOk
 */
@WebServlet("/Client_searchOk")
public class Client_searchOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection connection;
    private Statement stmt;
    private ResultSet resultSet ,resultSet2;
    
    private String id ,name , pw , phone1, phone2 ,phone3 ,email_1 , email_2,type;
    private String level_ ,cargo_id;
    int credit;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Client_searchOk() {
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
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request , HttpServletResponse response){
		id= request.getParameter("id"); //서버에게 id 란 변수명을 물어본다
		String query = "select * from member where id ='"+ id+"'" ;
		String query2 = "select * from client where id = '"+id+"'"; 
		
		System.out.println(query);
		System.out.println(query2);
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "cosmic", "cosmic");
			stmt = connection.createStatement();
			
			resultSet = stmt.executeQuery(query);
			while(resultSet.next()){
				name = resultSet.getString("name");
				id = resultSet.getString("id");
				pw = resultSet.getString("pw");
				phone1 = resultSet.getString("phone1");
				phone2 = resultSet.getString("phone2");
				phone3 = resultSet.getString("phone3");
				email_1 = resultSet.getString("email_1");
				email_2 = resultSet.getString("email_2");
				type= resultSet.getString("type");
				
			}
			resultSet2 = stmt.executeQuery(query2);
			
			while(resultSet2.next()){
				cargo_id=resultSet2.getString("cargo_id");
				level_=resultSet2.getString("level_");
				credit=resultSet2.getInt("credit");
			
			}
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("name",name);
			httpSession.setAttribute("id",id );
			httpSession.setAttribute("pw",pw);
			httpSession.setAttribute("phone1",phone1);
			httpSession.setAttribute("phone1",phone2);
			httpSession.setAttribute("phone1",phone3);
			httpSession.setAttribute("type",type);
			httpSession.setAttribute("cargo_id",cargo_id);
			httpSession.setAttribute("level_",level_);
			httpSession.setAttribute("credit",credit);
			
			System.out.println(credit);				
			System.out.println(name);				
			System.out.println(id);				
			System.out.println(pw);				
			System.out.println(phone1);				
			System.out.println(phone2);				
			System.out.println(phone3);				
			System.out.println(email_1);				
			System.out.println(email_2);				
			//System.out.println(cargo_id);				
			//System.out.println(level_);				
			//System.out.println(credit);				
				
			//httpSession.setAttribute("cargo_id",cargo_id);
			//httpSession.setAttribute("credit", credit);
			//httpSession.setAttribute("level_",level_);
			
			
			response.sendRedirect("client//client_search_result.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet != null){resultSet.close();}
				if(connection != null){connection.close();}
				if(stmt != null){stmt.close();}
				}catch(Exception e3){e3.printStackTrace();}
			
		}//catch 
	}
}
