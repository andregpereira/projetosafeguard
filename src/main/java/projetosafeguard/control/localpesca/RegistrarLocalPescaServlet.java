package projetosafeguard.control.localpesca;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.LocalPescaDAO;
import projetosafeguard.control.dao.OrgaoDAO;
import projetosafeguard.model.LocalPesca;
import projetosafeguard.model.Orgao;

@WebServlet("/registrarLocalPesca")
public class RegistrarLocalPescaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LocalPescaDAO localPescaDAO = new LocalPescaDAO();
		String uriRegistrar = "registrar.jsp";
		double latitude;
		double longitude;
		String localizacao = req.getParameter("localizacao");
		String tipoPropriedade = req.getParameter("tipoPropriedade");
		String tipoPescaPermitida = req.getParameter("tipoPescaPermitida");
		int idOrgao;
		String pescaPermitida = req.getParameter("pescaPermitida");
		req.setAttribute("latitude", req.getParameter("latitude"));
		req.setAttribute("longitude", req.getParameter("longitude"));
		req.setAttribute("localizacao", localizacao);
		req.setAttribute("tipoPropriedade", tipoPropriedade);
		req.setAttribute("tipoPescaPermitida", tipoPescaPermitida);
		req.setAttribute("idOrgao", req.getParameter("idOrgao"));
		req.setAttribute("pescaPermitida", pescaPermitida);
		req.setAttribute("mostrarFormLocalPesca", true);

		try {
			latitude = Double.parseDouble(req.getParameter("latitude"));
			if (latitude < -90 || latitude > 90) {
				req.setAttribute("latitudeInvalida", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("latitudeInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			longitude = Double.parseDouble(req.getParameter("longitude"));
			if (longitude < -180 || longitude > 180) {
				req.setAttribute("longitudeInvalida", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("longitudeInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!tipoPropriedade.equalsIgnoreCase("pública") && !tipoPropriedade.equalsIgnoreCase("particular")) {
			req.setAttribute("tipoPropriedadeInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			idOrgao = Integer.parseInt(req.getParameter("idOrgao"));
			if (!encontrarOrgao(idOrgao)) {
				req.setAttribute("idOrgaoInvalida", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("idOrgaoInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!pescaPermitida.equalsIgnoreCase("não") && !pescaPermitida.equalsIgnoreCase("sim")) {
			req.setAttribute("pescaPermitidaInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		req.removeAttribute("latitude");
		req.removeAttribute("longitude");
		req.removeAttribute("localizacao");
		req.removeAttribute("tipoPropriedade");
		req.removeAttribute("tipoPescaPermitida");
		req.removeAttribute("idOrgao");
		req.removeAttribute("pescaPermitida");

		LocalPesca localPesca = new LocalPesca();

		localPesca.setLatitude(latitude);
		localPesca.setLongitude(longitude);
		localPesca.setLocalizacao(localizacao.toUpperCase());
		localPesca.setTipoPropriedade(tipoPropriedade.toUpperCase());
		localPesca.setTipoPescaPermitida(tipoPescaPermitida.toUpperCase());
		localPesca.setIdOrgao(idOrgao);
		localPesca.setPescaPermitida(pescaPermitida.toUpperCase());
		localPescaDAO.insert(localPesca);
		req.setAttribute("localPescaRegistrado", true);

		req.getRequestDispatcher(uriRegistrar).forward(req, resp);
	}

	private boolean encontrarOrgao(int idOrgao) {
		for (Iterator<Orgao> it = new OrgaoDAO().select().iterator(); it.hasNext();) {
			Orgao orgao = it.next();
			if (orgao.getId() == idOrgao)
				return true;
		}
		return false;
	}

}
