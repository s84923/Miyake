package error;
public class Error {
    private String errorMessage;

    public Error() {
        this.errorMessage = "固定値"; // 初期値
    }

    // エラーメッセージを取得するメソッド
    public String getErrorMessage() {
        return errorMessage;
    }

    // エラーメッセージを設定するメソッド
    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
