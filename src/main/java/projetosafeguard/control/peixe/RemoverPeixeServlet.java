package projetosafeguard.control.peixe;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.PeixeDAO;
import projetosafeguard.model.Peixe;

@WebServlet("/removerPeixe")
public class RemoverPeixeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PeixeDAO peixeDAO = new PeixeDAO();
		int id = Integer.parseInt(req.getParameter("id"));

		for (Iterator<Peixe> it = peixeDAO.select().iterator(); it.hasNext();) {
			Peixe peixe = it.next();
			if (peixe.getId() == id) {
				peixeDAO.delete(peixe);
				req.setAttribute("peixeRemovido", true);
				break;
			}
		}

		req.getRequestDispatcher("/listas").forward(req, resp);
	}

}
