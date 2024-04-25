package dao;

import java.sql.ResultSet;
import java.util.List;

import bean.School;
import bean.Student;
import test.Test;

public interface TestDAO {
    String baseSql = ""; // SQLクエリのベース文

    Test get(Student student); // 学生情報を取得するメソッド
    Test get(Subject subject);
    Test get(School school);
    Test get(int no);
    
    
    
    List<Test> postFilter(ResultSet rSet, School school); // フィルタリングされた学生情報を加工して取得するメソッド

    List<Student> filter(School school, int entYear, String dassNum, boolean isAttend); // 条件に基づいて学生情報をフィルタリングして取得するメソッド

    List<Student> filter(School school, int entYear, boolean isAttend); // 条件に基づいて学生情報をフィルタリングして取得するメソッド

    List<Student> filter(School school, boolean isAttend); // 条件に基づいて学生情報をフィルタリングして取得するメソッド

    boolean save(Student student); // 学生情報を保存するメソッド

    boolean update(Student student); // 学生情報を更新するメソッド
}
