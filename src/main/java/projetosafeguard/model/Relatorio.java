package projetosafeguard.model;

public class Relatorio {

	private int id;
	private int idLocal;
	private double temperaturaMedia;
	private double ph;
	private String presencaTurbidez;
	private String presencaSolidosToxicos;
	private String presencaColiformesFecais;
	private double teorOxigenioDissolvido;
	private String excessoNitratos;
	private String excessoFosfatos;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdLocal() {
		return idLocal;
	}

	public void setIdLocal(int idLocal) {
		this.idLocal = idLocal;
	}

	public double getTemperaturaMedia() {
		return temperaturaMedia;
	}

	public void setTemperaturaMedia(double temperaturaMedia) {
		this.temperaturaMedia = temperaturaMedia;
	}

	public double getPh() {
		return ph;
	}

	public void setPh(double ph) {
		this.ph = ph;
	}

	public String getPresencaTurbidez() {
		return presencaTurbidez;
	}

	public void setPresencaTurbidez(String presencaTurbidez) {
		this.presencaTurbidez = presencaTurbidez;
	}

	public String getPresencaSolidosToxicos() {
		return presencaSolidosToxicos;
	}

	public void setPresencaSolidosToxicos(String presencaSolidosToxicos) {
		this.presencaSolidosToxicos = presencaSolidosToxicos;
	}

	public String getPresencaColiformesFecais() {
		return presencaColiformesFecais;
	}

	public void setPresencaColiformesFecais(String presencaColiformesFecais) {
		this.presencaColiformesFecais = presencaColiformesFecais;
	}

	public double getTeorOxigenioDissolvido() {
		return teorOxigenioDissolvido;
	}

	public void setTeorOxigenioDissolvido(double teorOxigenioDissolvido) {
		this.teorOxigenioDissolvido = teorOxigenioDissolvido;
	}

	public String getExcessoNitratos() {
		return excessoNitratos;
	}

	public void setExcessoNitratos(String excessoNitratos) {
		this.excessoNitratos = excessoNitratos;
	}

	public String getExcessoFosfatos() {
		return excessoFosfatos;
	}

	public void setExcessoFosfatos(String excessoFosfatos) {
		this.excessoFosfatos = excessoFosfatos;
	}

}
