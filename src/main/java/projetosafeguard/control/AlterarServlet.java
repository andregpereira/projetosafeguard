package projetosafeguard.control;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.LocalPescaDAO;
import projetosafeguard.control.dao.OrgaoDAO;
import projetosafeguard.control.dao.PeixeDAO;
import projetosafeguard.control.dao.RelatorioDAO;
import projetosafeguard.model.LocalPesca;
import projetosafeguard.model.Orgao;
import projetosafeguard.model.Peixe;
import projetosafeguard.model.Relatorio;

@WebServlet("/alterar")
public class AlterarServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String alterar = req.getParameter("alterar");
		String uriAlterar = "alterar.jsp";
		int id = Integer.parseInt(req.getParameter("id"));

		switch (alterar) {
		case "peixe":
			Peixe peixe = pegarDados(new PeixeDAO(), id);
			req.setAttribute("nome", "peixe");
			req.setAttribute("peixe", peixe);
			req.setAttribute("mostrarAlterarPeixe", true);
			break;

		case "local_pesca":
			LocalPesca localPesca = pegarDados(new LocalPescaDAO(), id);
			req.setAttribute("nome", "local de pesca");
			req.setAttribute("localPesca", localPesca);
			req.setAttribute("mostrarAlterarLocalPesca", true);
			break;

		case "orgao":
			Orgao orgao = pegarDados(new OrgaoDAO(), id);
			req.setAttribute("nome", "órgão");
			req.setAttribute("orgao", orgao);
			req.setAttribute("mostrarAlterarOrgao", true);
			break;

		case "relatorio":
			Relatorio relatorio = pegarDados(new RelatorioDAO(), id);
			req.setAttribute("nome", "relatório");
			req.setAttribute("relatorio", relatorio);
			req.setAttribute("mostrarAlterarRelatorio", true);
			break;
		}

		req.getRequestDispatcher(uriAlterar).forward(req, resp);
	}

	private Peixe pegarDados(PeixeDAO peixeDAO, int id) {
		for (Iterator<Peixe> it = peixeDAO.select().iterator(); it.hasNext();) {
			Peixe peixe = it.next();
			if (peixe.getId() == id)
				return peixe;
		}
		return null;
	}

	private LocalPesca pegarDados(LocalPescaDAO localPescaDAO, int id) {
		for (Iterator<LocalPesca> it = localPescaDAO.select().iterator(); it.hasNext();) {
			LocalPesca localPesca = it.next();
			if (localPesca.getId() == id)
				return localPesca;
		}
		return null;
	}

	private Orgao pegarDados(OrgaoDAO orgaoDAO, int id) {
		for (Iterator<Orgao> it = new OrgaoDAO().select().iterator(); it.hasNext();) {
			Orgao orgao = it.next();
			if (orgao.getId() == id)
				return orgao;
		}
		return null;
	}

	private Relatorio pegarDados(RelatorioDAO relatorioDAO, int id) {
		for (Iterator<Relatorio> it = relatorioDAO.select().iterator(); it.hasNext();) {
			Relatorio relatorio = it.next();
			if (relatorio.getId() == id)
				return relatorio;
		}
		return null;
	}

}
