package dao;

import java.sql.ResultSet;
import java.util.List;

import bean.School;
import bean.Subject;
import test.TestListSubject;

public interface TestListSubjectDAO {
    String baseSql = ""; // SQLクエリのベース文
    
    
    List<TestListSubject> postFilter(ResultSet rSet); // フィルタリングされた学生情報を加工して取得するメソッド

    List<TestListSubject> filter(int entYear, String dassNum, Subject subject,School school);// 条件に基づいて学生情報をフィルタリングして取得するメソッド

}

