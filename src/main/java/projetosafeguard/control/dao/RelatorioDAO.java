package projetosafeguard.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projetosafeguard.control.connectionfactory.ConnectionFactory;
import projetosafeguard.model.Relatorio;

public class RelatorioDAO {

	private Connection conexao;

	public RelatorioDAO() {
		this.conexao = new ConnectionFactory().getConnection();
	}

	// inserir registros no DB
	public void insert(Relatorio ralatorio) {
		String sql = "insert into relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			stmt.setInt(1, ralatorio.getIdLocal());
			stmt.setDouble(2, ralatorio.getTemperaturaMedia());
			stmt.setDouble(3, ralatorio.getPh());
			stmt.setString(4, ralatorio.getPresencaTurbidez());
			stmt.setString(5, ralatorio.getPresencaSolidosToxicos());
			stmt.setString(6, ralatorio.getPresencaColiformesFecais());
			stmt.setDouble(7, ralatorio.getTeorOxigenioDissolvido());
			stmt.setString(8, ralatorio.getExcessoNitratos());
			stmt.setString(9, ralatorio.getExcessoFosfatos());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// buscar todos os registros do DB
	public List<Relatorio> select() {
		try {
			List<Relatorio> ralatorios = new ArrayList<Relatorio>(); // criar a lista para guardar objetos Relatorio

			PreparedStatement stmt = conexao.prepareStatement("select * from relatorio");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) { // enquanto tiver registros no DB execute
				Relatorio ralatorio = new Relatorio();
				ralatorio.setId(rs.getInt("id_relatorio"));
				ralatorio.setIdLocal(rs.getInt("id_local"));
				ralatorio.setTemperaturaMedia(rs.getDouble("temperatura_media"));
				ralatorio.setPh(rs.getDouble("ph"));
				ralatorio.setPresencaTurbidez(rs.getString("presenca_turbidez"));
				ralatorio.setPresencaSolidosToxicos(rs.getString("presenca_solidos_toxicos"));
				ralatorio.setPresencaColiformesFecais(rs.getString("presenca_coliformes_fecais"));
				ralatorio.setTeorOxigenioDissolvido(rs.getDouble("teor_oxigenio_dissolvido"));
				ralatorio.setExcessoNitratos(rs.getString("excesso_nitratos"));
				ralatorio.setExcessoFosfatos(rs.getString("excesso_fosfatos"));

				ralatorios.add(ralatorio);
			}
			rs.close();
			stmt.close();
			return ralatorios;
		} catch (SQLException e) {
			System.out.println(e);
			throw new RuntimeException();
		}
	}

	// excluir um registro
	public void delete(Relatorio ralatorio) {
		String sql = "delete from relatorio where id_relatorio=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, ralatorio.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// alterar um registro
	public void update(Relatorio ralatorio) {
		String sql = "update relatorio set id_local=?, temperatura_media=?, ph=?, presenca_turbidez=?, presenca_solidos_toxicos=?, presenca_coliformes_fecais=?, teor_oxigenio_dissolvido=?, excesso_nitratos=?, excesso_fosfatos=? where id_relatorio=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, ralatorio.getIdLocal());
			stmt.setDouble(2, ralatorio.getTemperaturaMedia());
			stmt.setDouble(3, ralatorio.getPh());
			stmt.setString(4, ralatorio.getPresencaTurbidez());
			stmt.setString(5, ralatorio.getPresencaSolidosToxicos());
			stmt.setString(6, ralatorio.getPresencaColiformesFecais());
			stmt.setDouble(7, ralatorio.getTeorOxigenioDissolvido());
			stmt.setString(8, ralatorio.getExcessoNitratos());
			stmt.setString(9, ralatorio.getExcessoFosfatos());
			stmt.setInt(10, ralatorio.getId());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}