// ClientTCP3.java
import java.io.*;
import java.net.*;

public class ClientTCP3
{
	public static void main(String[] args) 
	{
		try 
		{
			
			Socket socket = new Socket( "localhost", 2016 );
			DataOutputStream dOut = new DataOutputStream( socket.getOutputStream() );
			dOut.writeUTF( args[0] );
			DataInputStream dIn = new DataInputStream ( socket.getInputStream() );
			String msg = dIn.readUTF();
			System.out.println( "Message inversé: " + msg );
			socket.close();
		}

		catch ( Exception ex ) 
		{
			System.out.println("erreur!");
			ex.printStackTrace();
		}
	}
}
