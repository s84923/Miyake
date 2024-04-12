
package tool;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter(urlPatterns={"/*"}) // 全てのurlにフィルタを適用
public class EncodingFilter implements Filter {

	public void doFilter(
		ServletRequest request, ServletResponse response,
		FilterChain chain
	) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8"); // リクエストの内容をutf-8でエンコーディング
		response.setContentType("text/html; charset=UTF-8"); // レスポンスをhtmlで解釈

		System.out.println("フィルタの前処理"); // 文字列の表示
		chain.doFilter(request, response); // 他にフィルタがあれば実行それ以外はServlet/JSP実行
		System.out.println("フィルタの後処理"); // 文字列の表示
	}

	public void init(FilterConfig filterConfig) {} // フィルタ開始時に呼び出される
	public void destroy() {} // フィルタ終了時に呼び出される
}


