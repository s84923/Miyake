package tool;

import java.io.PrintWriter;

public class Page {

//	ヘッダー（最初に行う処理）を追加
	public static void header(PrintWriter out) {
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Servlet/JSP Sample Programs</title>");
		out.println("</head>");
		out.println("<body>");
	}
//　フッター（最後に行う処理）を追加
	public static void footer(PrintWriter out) {
		out.println("</body>");
		out.println("</html>");
	}
}
