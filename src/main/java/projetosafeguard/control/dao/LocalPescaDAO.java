package projetosafeguard.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projetosafeguard.control.connectionfactory.ConnectionFactory;
import projetosafeguard.model.LocalPesca;

public class LocalPescaDAO {

	private Connection conexao;

	public LocalPescaDAO() {
		this.conexao = new ConnectionFactory().getConnection();
	}

	// inserir registros no DB
	public void insert(LocalPesca localPesca) {
		String sql = "insert into local_pesca (latitude, longitude, localizacao, tipo_propriedade, tipo_pesca_permitida, id_orgao, pesca_permitida) values (?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			stmt.setDouble(1, localPesca.getLatitude());
			stmt.setDouble(2, localPesca.getLongitude());
			stmt.setString(3, localPesca.getLocalizacao());
			stmt.setString(4, localPesca.getTipoPropriedade());
			stmt.setString(5, localPesca.getTipoPescaPermitida());
			stmt.setInt(6, localPesca.getIdOrgao());
			stmt.setString(7, localPesca.getPescaPermitida());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// buscar todos os registros do DB
	public List<LocalPesca> select() {

		try {
			List<LocalPesca> locaisPesca = new ArrayList<LocalPesca>(); // criar a lista para guardar objetos Contato

			PreparedStatement stmt = conexao.prepareStatement("select * from local_pesca");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) { // enquanto tiver registros no DB execute
				LocalPesca localPesca = new LocalPesca();
				localPesca.setId(rs.getInt("id_local"));
				localPesca.setLatitude(rs.getDouble("latitude"));
				localPesca.setLongitude(rs.getDouble("longitude"));
				localPesca.setLocalizacao(rs.getString("localizacao"));
				localPesca.setTipoPropriedade(rs.getString("tipo_propriedade"));
				localPesca.setTipoPescaPermitida(rs.getString("tipo_pesca_permitida"));
				localPesca.setIdOrgao(rs.getInt("id_orgao"));
				localPesca.setPescaPermitida(rs.getString("pesca_permitida"));

				locaisPesca.add(localPesca);
			}
			rs.close();
			stmt.close();
			return locaisPesca;

		} catch (SQLException e) {
			System.out.println(e);
			throw new RuntimeException();
		}
	}

	// excluir um registro
	public void delete(LocalPesca localPesca) {
		String sql = "delete from local_pesca where id_local=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, localPesca.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// alterar um registro
	public void update(LocalPesca localPesca) {
		String sql = "update local_pesca set latitude=?, longitude=?, localizacao=?, tipo_propriedade=?, tipo_pesca_permitida=?, id_orgao=?, pesca_permitida=? where id_local=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setDouble(1, localPesca.getLatitude());
			stmt.setDouble(2, localPesca.getLongitude());
			stmt.setString(3, localPesca.getLocalizacao());
			stmt.setString(4, localPesca.getTipoPropriedade());
			stmt.setString(5, localPesca.getTipoPescaPermitida());
			stmt.setInt(6, localPesca.getIdOrgao());
			stmt.setString(7, localPesca.getPescaPermitida());
			stmt.setInt(8, localPesca.getId());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}