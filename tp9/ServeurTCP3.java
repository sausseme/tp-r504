// ServeurTCP3.java
import java.io.*;
import java.net.*;

public class ServeurTCP3
{
	public static void main(String[] args) 
	{
		try 
		{
			ServerSocket socketserver = new ServerSocket( 2016 ) ;
			while(true)
			{
				System.out.println( "serveur en attente" );
				Socket socket = socketserver.accept();
				System.out.println( "Connection au client" );
				DataInputStream dIn = new DataInputStream ( socket.getInputStream() );
				System.out.println( "Message: " + dIn.readUTF() );
				String rev = new StringBuilder(msg).reverse().toString();
				socket.close();
			}
		}

		catch ( Exception ex ) 
		{
			System.out.println("erreur!");
			ex.printStackTrace();
		}
	}
}
