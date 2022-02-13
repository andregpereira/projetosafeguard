package projetosafeguard.control.connectionfactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	private String url = "jdbc:mysql://localhost:3306/projeto_safeguard?serverTimezone=America/Sao_Paulo";
	private String user = "root";
	private String password = "root";

	public Connection getConnection() {
		try {
			new com.mysql.cj.jdbc.Driver();
			return DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("Erro ao conectar");
			throw new RuntimeException(e);
		}
	}

}
