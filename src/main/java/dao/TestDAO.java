package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import test.Test;

public interface TestDAO {
    String baseSql = ""; // SQLクエリのベース文

    Test get(Student student); // 学生情報を取得するメソッド
    Test get(Subject subject);
    Test get(School school);
    Test get(int no);
    
    
    
    List<Test> postFilter(ResultSet rSet, School school); // フィルタリングされた学生情報を加工して取得するメソッド

    List<Test> filter(int entYear, String dassNum, Subject subject,int num, School school); // 条件に基づいて学生情報をフィルタリングして取得するメソッド

    boolean save(List<Test> list);
    boolean save(Test test,Connection connection);
    boolean delete(List<Test> list); 
    boolean delete(Test test,Connection connection); 
    
}

