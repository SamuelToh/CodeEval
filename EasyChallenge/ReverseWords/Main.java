import java.io.*;

public class Main {
    
    private static String whiteSpace = " ";

    private static String[] getWords(String line) {
        return line.split(whiteSpace);
    }
    
    private static String reverse(String line) {
        String[] words = getWords(line);
        if (words.length == 0) { return ""; }

        // iterate each word and reverse append the characters to result
        StringBuilder reversedResult = new StringBuilder();
        for (int count = words.length - 1; count >= 0; count --) {
            reversedResult.append(words[count]).append(whiteSpace);
        }
        // trim the extra trailing whitespace created by the reverse algorithm
        return reversedResult.deleteCharAt(reversedResult.length() - 1).toString();
    }

    public static void main (String[] args) throws IOException {
        File file = new File(args[0]);
        BufferedReader buffer = new BufferedReader(new FileReader(file));
        String line;
        while ((line = buffer.readLine()) != null) {
            System.out.println(reverse(line));
        }
    }
}