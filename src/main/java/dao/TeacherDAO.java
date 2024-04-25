package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Teacher;

public class TeacherDAO extends DAO {

    public Teacher login(String id, String password) throws Exception {
        Teacher teacher = null;

        Connection con = getConnection();

        PreparedStatement st;
        st = con.prepareStatement(
                "SELECT * FROM TEACHER WHERE ID=? AND PASSWORD=?");
        st.setString(1, id);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            teacher = new Teacher();
            teacher.setId(rs.getString("ID"));
            teacher.setPassword(rs.getString("PASSWORD"));
            teacher.setName(rs.getString("NAME"));
        }

        rs.close();
        st.close();
        con.close();
        return teacher;
    }
}
