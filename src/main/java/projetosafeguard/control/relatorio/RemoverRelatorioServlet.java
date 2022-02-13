package projetosafeguard.control.relatorio;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.RelatorioDAO;
import projetosafeguard.model.Relatorio;

@WebServlet("/removerRelatorio")
public class RemoverRelatorioServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RelatorioDAO relatorioDAO = new RelatorioDAO();
		int id = Integer.parseInt(req.getParameter("id"));

		for (Iterator<Relatorio> it = relatorioDAO.select().iterator(); it.hasNext();) {
			Relatorio relatorio = it.next();
			if (relatorio.getId() == id) {
				relatorioDAO.delete(relatorio);
				req.setAttribute("relatorioRemovido", true);
				break;
			}
		}

		req.getRequestDispatcher("/listas?lista=relatorio").forward(req, resp);
	}

}
