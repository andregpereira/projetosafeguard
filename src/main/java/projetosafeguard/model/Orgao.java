package projetosafeguard.model;

public class Orgao {

	private int id;
	private String razaoSocial;
	private String tipoOrg;
	private String endereco;
	private String nroRua;
	private String bairro;
	private String cidade;
	private String cep;
	private String telefone;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getTipoOrg() {
		return tipoOrg;
	}

	public void setTipoOrg(String tipoOrg) {
		this.tipoOrg = tipoOrg;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getNroRua() {
		return nroRua;
	}

	public void setNroRua(String nroRua) {
		this.nroRua = nroRua;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

}
