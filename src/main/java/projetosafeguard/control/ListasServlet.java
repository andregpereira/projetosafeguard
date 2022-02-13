package projetosafeguard.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.LocalPescaDAO;
import projetosafeguard.control.dao.OrgaoDAO;
import projetosafeguard.control.dao.PeixeDAO;
import projetosafeguard.control.dao.RelatorioDAO;

@WebServlet("/listas")
public class ListasServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("peixes", new PeixeDAO().select());
		req.setAttribute("locaisPesca", new LocalPescaDAO().select());
		req.setAttribute("orgaos", new OrgaoDAO().select());
		req.setAttribute("relatorios", new RelatorioDAO().select());

		String lista = req.getParameter("lista");

		if (lista != null)
			switch (lista) {
			case "local_pesca":
				req.setAttribute("mostrarListaLocalPesca", true);
				break;

			case "orgao":
				req.setAttribute("mostrarListaOrgao", true);
				break;

			case "relatorio":
				req.setAttribute("mostrarListaRelatorio", true);
				break;

			default:
				break;
			}

		req.getRequestDispatcher("listas.jsp").forward(req, resp);
	}

}
