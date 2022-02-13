package projetosafeguard.control.peixe;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.PeixeDAO;
import projetosafeguard.model.Peixe;

@WebServlet("/alterarPeixe")
public class AlterarPeixeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PeixeDAO peixeDAO = new PeixeDAO();
		String uriAlterar = "/alterar?alterar=peixe";
		int id = Integer.parseInt(req.getParameter("id"));
		String nomeCientifico = req.getParameter("nomeCientifico");
		String nomeComum = req.getParameter("nomeComum");
		String familia = req.getParameter("familia");
		String descricao = req.getParameter("descricao");
		String tipoAgua = req.getParameter("tipoAgua");
		String classificacaoRisco = req.getParameter("classificacaoRisco");
		String periodoDesova = req.getParameter("periodoDesova");

		if (nomeCientifico.equals("")) {
			req.setAttribute("nomeCientificoInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (familia.equals("")) {
			req.setAttribute("familiaInvalida", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (!tipoAgua.equalsIgnoreCase("salgada") && !tipoAgua.equalsIgnoreCase("doce")) {
			req.setAttribute("tipoAguaInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (!classificacaoRisco.equalsIgnoreCase("DD") && !classificacaoRisco.equalsIgnoreCase("LC")
				&& !classificacaoRisco.equalsIgnoreCase("NT") && !classificacaoRisco.equalsIgnoreCase("VU")
				&& !classificacaoRisco.equalsIgnoreCase("EN") && !classificacaoRisco.equalsIgnoreCase("CR")
				&& !classificacaoRisco.equalsIgnoreCase("EW") && !classificacaoRisco.equalsIgnoreCase("EX")) {
			req.setAttribute("classificacaoRiscoInvalida", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (!periodoDesova.equalsIgnoreCase("não") && !periodoDesova.equalsIgnoreCase("sim")) {
			req.setAttribute("periodoDesovaInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		Peixe peixe = new Peixe();

		peixe.setId(id);
		peixe.setNomeCientifico(nomeCientifico);
		peixe.setNomeComum(nomeComum);
		peixe.setFamilia(familia);
		peixe.setDescricao(descricao);
		peixe.setTipoAgua(tipoAgua.toUpperCase());
		peixe.setClassificacaoRisco(classificacaoRisco.toUpperCase());
		peixe.setPeriodoDesova(periodoDesova.toUpperCase());
		peixeDAO.update(peixe);
		req.setAttribute("peixeAlterado", true);

		req.getRequestDispatcher("/listas").forward(req, resp);
	}

}
