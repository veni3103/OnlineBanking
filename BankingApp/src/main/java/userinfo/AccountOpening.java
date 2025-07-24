package userinfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.DBConnection;

@WebServlet("/accountopening")
public class AccountOpening extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public AccountOpening() {
		super();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("hi");
		String clientname=request.getParameter("name");
		int Aadhar=Integer.parseInt(request.getParameter("Aadhar"));
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		System.out.println("heloooooooooooo");
		String DOB=request.getParameter("DOB");
		System.out.println("welccome");
		String phonenumber=request.getParameter("phonenumber");
		System.out.println("1");
		String door=request.getParameter("doornumber");
		System.out.println("2");
		String street=request.getParameter("street");
		System.out.println(3);
		String village=request.getParameter("vilage");
		System.out.println("4");
		String taluk=request.getParameter("taluk");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		System.out.println("5");
		String dist=request.getParameter("dist");
		String state=request.getParameter("state");
		String gender=request.getParameter("gender");
		System.out.println("6");
		PrintWriter res=response.getWriter();
		Connection con;
		try {
			System.out.println("helooo");
			con=DBConnection.getConnection();
			System.out.println("comnetiomn");
			Statement statement=con.createStatement();
			System.out.println("back");
			ResultSet result=statement.executeQuery("select * from users where aadharnumber="+Aadhar +";");
			
			if(!result.next()) {
				System.out.println("hello");
				ResultSet insert=statement.executeQuery("insert into users (name,password,availablecash,aadharnumber,email,phonenumber,dob,genter) values ('"+clientname +"','"+password +"',"+0+","+Aadhar+",'"+email+"','"+phonenumber+"','"+DOB+"','"+gender+"') returning accountnumber");
				if(insert.next()) {
					int id=insert.getInt(1);
					int insert2=statement.executeUpdate("insert into userAddress (accountnumber,doornumber,street,village,taluk,pincode,district,state) values("+id +",'"+door +"','"+street+"','"+village+"','"+taluk+"',"+pincode+",'"+dist+"','"+state+"') ;");
					res.println("Hi "+clientname+" your accountnumber "+id);
					response.sendRedirect("deposit.jsp");
				}
				else {
					res.println("Hi "+clientname+" your registration failed");

				}
			}
			else {
				res.println("you already have a account please login your account");
				response.sendRedirect("Login.jsp");
			}
		} catch (Throwable e) 
		{
			e.printStackTrace(System.err);
			System.out.println("error");

		}


	}

}
