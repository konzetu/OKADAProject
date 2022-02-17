package ress;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RessServlet extends HttpServlet {
	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ArrayList<RessBean> threads = new ArrayList<RessBean>();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl", "info", "pro");
			System.out.println("接続完了");

			req.setCharacterEncoding("UTF-8");

			String sql = " SELECT res_text, user_name FROM board_res";
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {

				String text = rs.getString(1);//1列目のデータを取得
				String user_name = rs.getString(2); //2列目のデータを取得
				System.out.println("res_text" + "\t" + "user_name");
				System.out.println(text + "\t" + user_name);
				RessBean board_res = new RessBean();

				board_res.setText(text);
				board_res.setUser_name(user_name);

				threads.add(board_res);

			}

			cn.close();
			System.out.println("切断完了");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("threads", threads);

		RequestDispatcher dispatcher = req.getRequestDispatcher("jsp/ThreadTitle.jsp");
		dispatcher.forward(req, resp);
	}

}
