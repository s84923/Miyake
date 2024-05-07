package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Student;

public class StudentDAO {
    public List<Student> getFilteredStudents(String enrollmentYear, String className, boolean isEnrolled) throws Exception {
        List<Student> students = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            DAO dao = new DAO();
            conn = dao.getConnection();

            // SQL文の作成
            String sql = "SELECT * FROM your_table WHERE entYear = ? AND dassNum = ? AND isAttend = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, enrollmentYear);
            stmt.setString(2, className);
            stmt.setBoolean(3, isEnrolled);

            // SQLの実行
            rs = stmt.executeQuery();

            // 結果の処理
            while (rs.next()) {
                Student student = new Student();
                // ここでResultSetからStudentオブジェクトを作成し、リストに追加する処理を実装する
                student.setNo(rs.getString("no"));
                student.setName(rs.getString("name"));
                student.setEntYear(rs.getInt("entYear"));
                student.setDassNum(rs.getString("dassNum"));
                student.setAttend(rs.getBoolean("isAttend"));
                // 他のカラムも同様に設定する
                students.add(student);
            }
        } finally {
            // リソースの解放
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return students;
    }
}
