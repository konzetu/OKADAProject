package tera;

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

public class selectress extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String id = req.getParameter("e");
		ArrayList<ThreadBean> threads = new ArrayList<ThreadBean>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");
			System.out.println("接続完了");
			String sql = " SELECT user_name,res_text, to_char(res_date, 'yyyy/mm/dd hh24:mi') FROM board_res WHERE th_id = '" + id + "'ORDER BY res_id ASC";
			String sql2 = "SELECT th_detalis, th_title FROM board_thread WHERE th_id = '" + id + "'";

			//Statementインターフェイスを実装するクラスをインスタンス化する
			Statement st = cn.createStatement();
			Statement st2 = cn.createStatement();

			//Statementインターフェイスを実装するクラスをインスタンス化する

			//select文を実行し
			//ResultSetインターフェイスを実装したクラスの
			//インスタンスが返る
			ResultSet rs = st.executeQuery(sql);
			ResultSet rs2 = st2.executeQuery(sql2);

			ThreadBean board_ThreadTitle = new ThreadBean();

			//スレッド本文の処理
			rs2.next();
			String th_detalis = rs2.getString(1);//1列目のデータを取得
			String th_title = rs2.getString(2);//2列目のデータを取得
			System.out.println("th_detalis");
			System.out.println(th_detalis);
			System.out.println("th_title");
			System.out.println(th_title);
			board_ThreadTitle.setTh_detalis(th_detalis);
			board_ThreadTitle.setName(th_title);
			board_ThreadTitle.setTh_id(id);
			threads.add(board_ThreadTitle);

			//カーソルを一行だけスクロールし、データをフェッチする
			//あとでループに変更while文
			while (rs.next()) {
				ThreadBean board_Thread = new ThreadBean();
				String user_name = rs.getString(1);//1列目のデータを取得
				String res_text = rs.getString(2); //2列目のデータを取得
				String res_date = rs.getString(3); //3列目のデータを取得
				System.out.println("user_name" + "\t" + "res_text" + "\t" + "res_date");
				System.out.println(user_name + "\t" + res_text + "\t" + res_date);

				board_Thread.setUser_name(user_name);
				board_Thread.setRes_text(res_text);
				board_Thread.setRes_date(res_date);
				threads.add(board_Thread);
			}

			//Oracleから切断する
			cn.close();
			System.out.println("切断完了");
		} catch (

		ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.setAttribute("threads", threads);
		RequestDispatcher dispatcher = req.getRequestDispatcher("Ress1.jsp");

		//転送先に要求を転送する
		dispatcher.forward(req, res);
	}

}
