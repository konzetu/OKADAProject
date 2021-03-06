package ress;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RessServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String res_text = req.getParameter("res_text");
		String user_name = req.getParameter("user_name");

		String id = req.getParameter("th_id");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");
			System.out.println("接続完了");

			String sql = " INSERT INTO board_res(th_id,res_date,res_text,user_name)VALUES('" + id + "',sysdate,'" + res_text + "','" + user_name + "')";


			//Statementインターフェイスを実装するクラスをインスタンス化する
			Statement st = cn.createStatement();

			st.executeQuery(sql);

			//Oracleから切断する
			cn.close();
			System.out.println("切断完了");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.setAttribute("id", id);


		String disp = "selectress2";
		RequestDispatcher dispatch = req.getRequestDispatcher(disp);


		dispatch.forward(req, res);
	}

}
