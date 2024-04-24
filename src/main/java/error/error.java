package error;
public class error {
    private String errorMessage;

    public error() {
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
