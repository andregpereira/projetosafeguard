package projetosafeguard.control.localpesca;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.LocalPescaDAO;
import projetosafeguard.model.LocalPesca;

@WebServlet("/removerLocalPesca")
public class RemoverLocalPescaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LocalPescaDAO localPescaDAO = new LocalPescaDAO();
		int id = Integer.parseInt(req.getParameter("id"));
		boolean confirmarRemocao = Boolean.parseBoolean(req.getParameter("confirmarRemocao"));

		for (Iterator<LocalPesca> it = localPescaDAO.select().iterator(); it.hasNext();) {
			LocalPesca localPesca = it.next();

			if (!confirmarRemocao) {
				req.setAttribute("idLocalPescaRemover", id);
				req.setAttribute("confirmarRemocaoLocalPesca", true);
				req.getRequestDispatcher("/listas?lista=local_pesca").forward(req, resp);
				return;
			}

			if (localPesca.getId() == id) {
				localPescaDAO.delete(localPesca);
				req.setAttribute("localPescaRemovido", true);
				break;
			}
		}

		req.getRequestDispatcher("/listas?lista=local_pesca").forward(req, resp);
	}

}
