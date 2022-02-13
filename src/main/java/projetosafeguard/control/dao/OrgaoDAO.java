package projetosafeguard.control.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projetosafeguard.control.connectionfactory.ConnectionFactory;
import projetosafeguard.model.Orgao;

public class OrgaoDAO {

	private Connection conexao;

	public OrgaoDAO() {
		this.conexao = new ConnectionFactory().getConnection();
	}

	// inserir registros no DB
	public void insert(Orgao orgao) {
		String sql = "insert into orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values (?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			stmt.setString(1, orgao.getRazaoSocial());
			stmt.setString(2, orgao.getTipoOrg());
			stmt.setString(3, orgao.getEndereco());
			stmt.setString(4, orgao.getNroRua());
			stmt.setString(5, orgao.getBairro());
			stmt.setString(6, orgao.getCidade());
			stmt.setString(7, orgao.getCep());
			stmt.setString(8, orgao.getTelefone());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// buscar todos os registros do DB
	public List<Orgao> select() {

		try {
			List<Orgao> orgaos = new ArrayList<Orgao>(); // criar a lista para guardar objetos Contato

			PreparedStatement stmt = conexao.prepareStatement("select * from orgao");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) { // enquanto tiver registros no DB execute
				Orgao orgao = new Orgao();
				orgao.setId(rs.getInt("id_orgao"));
				orgao.setRazaoSocial(rs.getString("razao_social"));
				orgao.setTipoOrg(rs.getString("tipo_org"));
				orgao.setEndereco(rs.getString("endereco"));
				orgao.setNroRua(rs.getString("nro_rua"));
				orgao.setBairro(rs.getString("bairro"));
				orgao.setCidade(rs.getString("cidade"));
				orgao.setCep(rs.getString("cep"));
				orgao.setTelefone(rs.getString("telefone"));

				orgaos.add(orgao);
			}
			rs.close();
			stmt.close();
			return orgaos;

		} catch (SQLException e) {
			System.out.println(e);
			throw new RuntimeException();
		}
	}

	// excluir um registro
	public void delete(Orgao orgao) {
		String sql = "delete from orgao where id_orgao=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, orgao.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// alterar um registro
	public void update(Orgao orgao) {
		String sql = "update orgao set razao_social=?, tipo_org=?, endereco=?, nro_rua=?, bairro=?, cidade=?, cep=?, telefone=? where id_orgao=?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, orgao.getRazaoSocial());
			stmt.setString(2, orgao.getTipoOrg());
			stmt.setString(3, orgao.getEndereco());
			stmt.setString(4, orgao.getNroRua());
			stmt.setString(5, orgao.getBairro());
			stmt.setString(6, orgao.getCidade());
			stmt.setString(7, orgao.getCep());
			stmt.setString(8, orgao.getTelefone());
			stmt.setInt(9, orgao.getId());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}