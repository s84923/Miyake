import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Teacher;

public class TeacherDAO extends DAO {

    public Teacher get(String login, String password) throws Exception {
        Teacher teacher = null;

        Connection con = getConnection();

        PreparedStatement st;
        st = con.prepareStatement(
                "SELECT * FROM teacher WHERE login=? AND password=?");
        st.setString(1, login);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            teacher = new Teacher();
            teacher.setId(rs.getString("id"));
            teacher.setLogin(rs.getString("login"));
            teacher.setPassword(rs.getString("password"));

        }

        rs.close(); 
        st.close();
        con.close();
        return teacher;
    }
    public Teacher login(String id, String password) throws Exception {
        Teacher teacher = null;

        Connection con = getConnection();

        PreparedStatement st;
        st = con.prepareStatement(
                "SELECT * FROM teacher WHERE id=? AND password=?");
        st.setString(1, id);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            teacher = new Teacher();
            teacher.setId(rs.getString("id"));
            teacher.setLogin(rs.getString("login"));
            teacher.setPassword(rs.getString("password"));
            // ここで他の教師の情報をセットする場合、セットしてください
        }

        rs.close(); // ResultSetを閉じる
        st.close();
        con.close();
        return teacher;
    }
}
