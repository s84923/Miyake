package dao;

import java.sql.ResultSet;
import java.util.List;

import bean.Student;
import test.TestListStudent;

public interface TestListStudentDAO {
    String baseSql = ""; // SQLクエリのベース文
    
    
    List<TestListStudent> postFilter(ResultSet rSet); // フィルタリングされた学生情報を加工して取得するメソッド

    List<TestListStudent> filter(Student student); // 条件に基づいて学生情報をフィルタリングして取得するメソッド

}

