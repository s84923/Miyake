package test;

import java.util.HashMap;
import java.util.Map;

public class 2TestListSubject {
    private int entYear;
    private String studentNo;
    private String studentName;
    private String classNum;
    private Map<Integer, Integer> points;

    // コンストラクタ
    public 2TestListSubject() {
        points = new HashMap<>();
    }

    // entYear の getter と setter
    public int getEntYear() {
        return entYear;
    }

    public void setEntYear(int entYear) {
        this.entYear = entYear;
    }

    // studentNo の getter と setter
    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    // studentName の getter と setter
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    // classNum の getter と setter
    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }

    // points マップの getter と setter
    public Map<Integer, Integer> getPoints() {
        return points;
    }

    public void setPoints(Map<Integer, Integer> points) {
        this.points = points;
    }

    // 指定されたキーに対応するポイントを取得する
    public int getPoint(int key) {
        return points.getOrDefault(key, 0);
    }

    // 指定されたキーと値をポイントマップに追加する
    public void putPoint(int key, int value) {
        points.put(key, value);
    }

    public static void main(String[] args) {
        // テスト用のコード
        TestListSubject subject = new TestListSubject();
        subject.setEntYear(2024);
        subject.setStudentNo("S12345");
        subject.setStudentName("Alice");
        subject.setClassNum("Math101");

        // 成績ポイントの追加
        subject.putPoint(1, 90);
        subject.putPoint(2, 85);
        subject.putPoint(3, 78);

        // 成績情報の表示
        System.out.println("Student: " + subject.getStudentName());
        System.out.println("Year: " + subject.getEntYear());
        System.out.println("Class: " + subject.getClassNum());
        System.out.println("Points: " + subject.getPoints());
    }
}
