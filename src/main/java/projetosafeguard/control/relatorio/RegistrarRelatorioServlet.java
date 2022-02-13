package projetosafeguard.control.relatorio;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.LocalPescaDAO;
import projetosafeguard.control.dao.RelatorioDAO;
import projetosafeguard.model.LocalPesca;
import projetosafeguard.model.Relatorio;

@WebServlet("/registrarRelatorio")
public class RegistrarRelatorioServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RelatorioDAO relatorioDAO = new RelatorioDAO();
		String uriRegistrar = "registrar.jsp";
		int idLocal;
		double temperaturaMedia;
		double ph;
		String presencaTurbidez = req.getParameter("presencaTurbidez");
		String presencaSolidosToxicos = req.getParameter("presencaSolidosToxicos");
		String presencaColiformesFecais = req.getParameter("presencaColiformesFecais");
		double teorOxigenioDissolvido;
		String excessoNitratos = req.getParameter("excessoNitratos");
		String excessoFosfatos = req.getParameter("excessoFosfatos");
		req.setAttribute("idLocal", req.getParameter("idLocal"));
		req.setAttribute("temperaturaMedia", req.getParameter("temperaturaMedia"));
		req.setAttribute("ph", req.getParameter("ph"));
		req.setAttribute("presencaTurbidez", presencaTurbidez);
		req.setAttribute("presencaSolidosToxicos", presencaSolidosToxicos);
		req.setAttribute("presencaColiformesFecais", presencaColiformesFecais);
		req.setAttribute("teorOxigenioDissolvido", req.getParameter("teorOxigenioDissolvido"));
		req.setAttribute("excessoNitratos", excessoNitratos);
		req.setAttribute("excessoFosfatos", excessoFosfatos);
		req.setAttribute("mostrarFormRelatorio", true);

		try {
			idLocal = Integer.parseInt(req.getParameter("idLocal"));
			if (!encontrarLocalPesca(idLocal)) {
				req.setAttribute("idLocalInvalida", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("idLocalInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			temperaturaMedia = Double.parseDouble(req.getParameter("temperaturaMedia"));
			if (temperaturaMedia < 0 || temperaturaMedia >= 100) {
				req.setAttribute("temperaturaMediaInvalida", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("temperaturaMediaInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			ph = Double.parseDouble(req.getParameter("ph"));
			if (ph < 0 || ph > 14) {
				req.setAttribute("phInvalido", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("phInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!presencaTurbidez.equalsIgnoreCase("sim") && !presencaTurbidez.equalsIgnoreCase("não")) {
			req.setAttribute("presencaTurbidezInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!presencaSolidosToxicos.equalsIgnoreCase("sim") && !presencaSolidosToxicos.equalsIgnoreCase("não")) {
			req.setAttribute("presencaSolidosToxicosInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!presencaColiformesFecais.equalsIgnoreCase("sim") && !presencaColiformesFecais.equalsIgnoreCase("não")) {
			req.setAttribute("presencaColiformesFecaisInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			teorOxigenioDissolvido = Double.parseDouble(req.getParameter("teorOxigenioDissolvido"));
			if (teorOxigenioDissolvido < 0.0 || teorOxigenioDissolvido > 999.99) {
				req.setAttribute("teorOxigenioDissolvidoInvalido", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("teorOxigenioDissolvidoInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!excessoNitratos.equalsIgnoreCase("não") && !excessoNitratos.equalsIgnoreCase("sim")) {
			req.setAttribute("excessoNitratosInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!excessoFosfatos.equalsIgnoreCase("não") && !excessoFosfatos.equalsIgnoreCase("sim")) {
			req.setAttribute("excessoFosfatosInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		req.removeAttribute("idLocal");
		req.removeAttribute("temperaturaMedia");
		req.removeAttribute("ph");
		req.removeAttribute("presencaTurbidez");
		req.removeAttribute("presencaSolidosToxicos");
		req.removeAttribute("presencaColiformesFecais");
		req.removeAttribute("teorOxigenioDissolvido");
		req.removeAttribute("excessoNitratos");
		req.removeAttribute("excessoFosfatos");

		Relatorio relatorio = new Relatorio();

		relatorio.setIdLocal(idLocal);
		relatorio.setTemperaturaMedia(temperaturaMedia);
		relatorio.setPh(ph);
		relatorio.setPresencaTurbidez(presencaTurbidez.toUpperCase());
		relatorio.setPresencaSolidosToxicos(presencaSolidosToxicos.toUpperCase());
		relatorio.setPresencaColiformesFecais(presencaColiformesFecais.toUpperCase());
		relatorio.setTeorOxigenioDissolvido(teorOxigenioDissolvido);
		relatorio.setExcessoNitratos(excessoNitratos.toUpperCase());
		relatorio.setExcessoFosfatos(excessoFosfatos.toUpperCase());
		relatorioDAO.insert(relatorio);
		req.setAttribute("relatorioRegistrado", true);

		req.getRequestDispatcher(uriRegistrar).forward(req, resp);
	}

	private boolean encontrarLocalPesca(int idLocal) {
		for (Iterator<LocalPesca> it = new LocalPescaDAO().select().iterator(); it.hasNext();) {
			LocalPesca localPesca = it.next();
			if (localPesca.getId() == idLocal)
				return true;
		}
		return false;
	}

}
