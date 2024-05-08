package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestDAO {

    public ResultSet getTestResults(String entYear, String classNum, String subjectName, String testNo) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        try {
            conn = DAO.getConnection();

            String sql = "SELECT STUDENT.ENT_YEAR, STUDENT.CLASS_NUM, STUDENT.NO, STUDENT.NAME, TEST.POINT " +
                         "FROM STUDENT, SUBJECT, TEST " +
                         "WHERE STUDENT.SCHOOL_CD = SUBJECT.SCHOOL_CD AND " +
                         "      STUDENT.SCHOOL_CD = TEST.SCHOOL_CD AND " +
                         "      STUDENT.NO = TEST.STUDENT_NO AND " +
                         "      SUBJECT.CD = TEST.SUBJECT_CD AND " +
                         "      STUDENT.CLASS_NUM = TEST.CLASS_NUM AND " +
                         "      STUDENT.ENT_YEAR = ? AND " +
                         "      STUDENT.CLASS_NUM = ? AND " +
                         "      SUBJECT.NAME = ? AND " +
                         "      TEST.NO = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, entYear);
            pstmt.setString(2, classNum);
            pstmt.setString(3, subjectName);
            pstmt.setString(4, testNo);

            result = pstmt.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
