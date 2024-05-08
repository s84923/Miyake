package test;

import java.util.HashMap;
import java.util.Map;

public class TestListSubject {
    private int entYear;
    private String studentNo;
    private String studentName;
    private String classNum;
    private Map<Integer, Integer> points;

    public TestListSubject() {
        points = new HashMap<>();
    }

    public int getEntYear() {
        return entYear;
    }

    public void setEntYear(int year) {
        this.entYear = year;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }

    public Map<Integer, Integer> getPoints() {
        return points;
    }

    public void setPoints(Map<Integer, Integer> points) {
        this.points = points;
    }

    public String getPoint(int key) {
        return points.getOrDefault(key, 0).toString();
    }

    public void putPoint(int key, int value) {
        points.put(key, value);
    }
}
