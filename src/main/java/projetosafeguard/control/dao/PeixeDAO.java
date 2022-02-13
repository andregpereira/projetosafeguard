package projetosafeguard.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projetosafeguard.control.connectionfactory.ConnectionFactory;
import projetosafeguard.model.Peixe;

public class PeixeDAO {

	private Connection conexao;

	public PeixeDAO() {
		this.conexao = new ConnectionFactory().getConnection();
	}

	// inserir registros no DB
	public void insert(Peixe peixe) {
		String sql = "insert into peixe (nome_cientifico, nome_comum, familia, descricao, tipo_agua, classificacao_risco, periodo_desova) values (?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			stmt.setString(1, peixe.getNomeCientifico());
			stmt.setString(2, peixe.getNomeComum());
			stmt.setString(3, peixe.getFamilia());
			stmt.setString(4, peixe.getDescricao());
			stmt.setString(5, peixe.getTipoAgua());
			stmt.setString(6, peixe.getClassificacaoRisco());
			stmt.setString(7, peixe.getPeriodoDesova());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// buscar todos os registros do DB
	public List<Peixe> select() {
		try {
			List<Peixe> peixes = new ArrayList<Peixe>(); // criar a lista para guardar objetos Peixe

			PreparedStatement stmt = conexao.prepareStatement("select * from peixe");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) { // enquanto tiver registros no DB execute
				Peixe peixe = new Peixe();
				peixe.setId(rs.getInt("id_peixe"));
				peixe.setNomeCientifico(rs.getString("nome_cientifico"));
				peixe.setNomeComum(rs.getString("nome_comum"));
				peixe.setFamilia(rs.getString("familia"));
				peixe.setDescricao(rs.getString("descricao"));
				peixe.setTipoAgua(rs.getString("tipo_agua"));
				peixe.setClassificacaoRisco(rs.getString("classificacao_risco"));
				peixe.setPeriodoDesova(rs.getString("periodo_desova"));

				peixes.add(peixe);
			}
			rs.close();
			stmt.close();
			return peixes;

		} catch (SQLException e) {
			System.out.println(e);
			throw new RuntimeException();
		}
	}

	// excluir um registro
	public void delete(Peixe peixe) {
		String sql = "delete from peixe where id_peixe=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, peixe.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// alterar um registro
	public void update(Peixe peixe) {
		String sql = "update peixe set nome_cientifico=?, nome_comum=?, familia=?, descricao=?, tipo_agua=?, classificacao_risco=?, periodo_desova=? where id_peixe=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, peixe.getNomeCientifico());
			stmt.setString(2, peixe.getNomeComum());
			stmt.setString(3, peixe.getFamilia());
			stmt.setString(4, peixe.getDescricao());
			stmt.setString(5, peixe.getTipoAgua());
			stmt.setString(6, peixe.getClassificacaoRisco());
			stmt.setString(7, peixe.getPeriodoDesova());
			stmt.setInt(8, peixe.getId());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}