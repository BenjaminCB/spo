package studio2;

import java.io.CharArrayReader;

// $Id: Main.java 26 2010-01-07 17:14:40Z cytron $

public class Main {

	/**
	 * Exercise the parser and scanner on some examples.
	 * @param args
	 */
	public static void main(String[] args) throws Throwable {
		//
		// Add more examples to this array
		//   Each will be tried through the parser
		//
		String[] examples = new String[] {
			"f b   i a   a = 5   b = a + 3.2   p b",
			"f a",
			"float a",
			"foat a",
			"int a",
			"float b   int a   a = 5   b = a + 3.2   p b",
			"a a",
			"f f",
			"a = 5  f b",
			"% %",
			"f b   b = 5.01e-10"
		};

		for (String example : examples) {
			try {
				System.out.println("Parsing: " + example);
				CharArrayReader reader = new CharArrayReader(example.toCharArray());
				CharStream s = new CharStream(reader);

				Parser p = new Parser(s);
				p.Prog();
				System.out.println("   Parse successful");
			}
			catch (Throwable t) {
				System.out.println("   Parse ended with error: " + t);
				System.out.println("Stack trace: ");
				t.printStackTrace(System.out);
			}
		}

	}

}
