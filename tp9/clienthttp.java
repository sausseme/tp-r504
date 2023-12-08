// clienthttp.java
import java.io.*;
import java.net.*;

public class clienthttp
{
	public static void main(String[] args) 
	{
		try 
		{
			
			OutputStreamWriter osw = new OutputStreamWriter( socket.getOutputStream() );
			InputStreamReader isw = new InputStreamReader( socket.getInputStream() );

			BufferedWritter bufOut  = new BufferedWriter(osw);
			BufferedReader bufIn  = new BufferedReader(isw);

			String request = "GET / HTTP/1.0\r\n\r\n"; // requete HTTP 
			bufOut.write( request, 0, request.length() );
			bufOut.flush();

			Sting line = bufIn.readLine();
			while (line != null){
				System.out.println( line );
				line = bufIn.readLine();
			}
			bufIn.close();
			bufOut.close();
			socket.close();
		}

		catch ( Exception ex ) 
		{
			System.out.println("erreur!");
			ex.printStackTrace();
		}
	}
}
