import java.util.Scanner;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class JavaPort {
    public static void main(String args[]) throws IOException {
	BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

	try {
	    String line = null;
	    while ((line = reader.readLine()) != null) {
		System.out.println("Received message: '" + line + "'");
	    }
	} catch(IOException e) {
	    e.printStackTrace();
	} finally {
	    reader.close();
	}
    }
}
