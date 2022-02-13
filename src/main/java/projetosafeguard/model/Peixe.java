package projetosafeguard.model;

public class Peixe {

	private int id;
	private String nomeCientifico;
	private String nomeComum;
	private String familia;
	private String descricao;
	private String tipoAgua;
	private String classificacaoRisco;
	private String periodoDesova;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomeCientifico() {
		return nomeCientifico;
	}

	public void setNomeCientifico(String nomeCientifico) {
		this.nomeCientifico = nomeCientifico;
	}

	public String getNomeComum() {
		return nomeComum;
	}

	public void setNomeComum(String nomeComum) {
		this.nomeComum = nomeComum;
	}

	public String getFamilia() {
		return familia;
	}

	public void setFamilia(String familia) {
		this.familia = familia;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getTipoAgua() {
		return tipoAgua;
	}

	public void setTipoAgua(String tipoAgua) {
		this.tipoAgua = tipoAgua;
	}

	public String getClassificacaoRisco() {
		return classificacaoRisco;
	}

	public void setClassificacaoRisco(String classificacaoRisco) {
		this.classificacaoRisco = classificacaoRisco;
	}

	public String getPeriodoDesova() {
		return periodoDesova;
	}

	public void setPeriodoDesova(String periodoDesova) {
		this.periodoDesova = periodoDesova;
	}

}
