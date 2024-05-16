package test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TestTableUpdater {
    public void updateTestTable(String entYear, String classNum, String subjectName, String testNo, String point, String studentno) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // データベースへの接続
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");

            // SQLクエリを組み立てて実行
            String sql = "INSERT INTO TEST (STUDENT_NO, SUBJECT_CD, CLASS_NUM, SCHOOL_CD, NO, POINT) " +
                         "VALUES (?, (SELECT CD FROM SUBJECT WHERE NAME = ?), ?, (SELECT SCHOOL_CD FROM STUDENT WHERE NO = ?), ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, studentno);
            pstmt.setString(2, subjectName);
            pstmt.setString(3, classNum);
            pstmt.setString(4, studentno);
            pstmt.setString(5, testNo);
            pstmt.setString(6, point);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("データが正常に登録されました。");
            } else {
                System.out.println("データの登録に失敗しました。");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        TestTableUpdater updater = new TestTableUpdater();
        // JSPからPOSTされたデータの代わりに、適切な値を渡す
        String entYear = "2024";
        String classNum = "101";
        String subjectName = "Math"; // 科目名は適切な値に置き換えてください
        String testNo = "1";
        String point = "80";
        String studentno = "12345"; // 学籍番号は適切な値に置き換えてください

        updater.updateTestTable(entYear, classNum, subjectName, testNo, point, studentno);
    }
}
