import java.util.Scanner;
import java.util.regex.Pattern;

public class ConfigureGit {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String gitUsername;
        String gitEmail;

        // ユーザー名の入力を求めるループ
        while (true) {
            System.out.print("Enter your Git username: ");
            gitUsername = scanner.nextLine().trim();

            // ユーザー名が空でないことをチェック
            if (gitUsername.isEmpty()) {
                System.out.println("Username cannot be empty. Please try again.");
            } else {
                break;
            }
        }

        // メールアドレスの入力を求めるループ
        while (true) {
            System.out.print("Enter your Git email address: ");
            gitEmail = scanner.nextLine().trim();

            // メールアドレスの形式をチェック
            if (!isValidEmail(gitEmail)) {
                System.out.println("Invalid email address format. Please enter a valid email address.");
            } else {
                break;
            }
        }

        // Git の設定を変更する
        System.out.println("Setting Git configuration...");
        Runtime rt = Runtime.getRuntime();
        try {
            rt.exec("git config --global user.name \"" + gitUsername + "\"");
            rt.exec("git config --global user.email \"" + gitEmail + "\"");
            System.out.println("Configuration complete.");
        } catch (Exception e) {
            System.err.println("Error setting Git configuration: " + e.getMessage());
        }
    }

    // メールアドレスのバリデーション用メソッド
    private static boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }
}
