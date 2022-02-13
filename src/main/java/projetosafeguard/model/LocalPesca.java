package projetosafeguard.model;

public class LocalPesca {

	private int id;
	private double latitude;
	private double longitude;
	private String localizacao;
	private String tipoPropriedade;
	private String tipoPescaPermitida;
	private int idOrgao;
	private String pescaPermitida;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public String getTipoPropriedade() {
		return tipoPropriedade;
	}

	public void setTipoPropriedade(String tipoPropriedade) {
		this.tipoPropriedade = tipoPropriedade;
	}

	public String getTipoPescaPermitida() {
		return tipoPescaPermitida;
	}

	public void setTipoPescaPermitida(String tipoPescaPermitida) {
		this.tipoPescaPermitida = tipoPescaPermitida;
	}

	public int getIdOrgao() {
		return idOrgao;
	}

	public void setIdOrgao(int idOrgao) {
		this.idOrgao = idOrgao;
	}

	public String getPescaPermitida() {
		return pescaPermitida;
	}

	public void setPescaPermitida(String pescaPermitida) {
		this.pescaPermitida = pescaPermitida;
	}

}
