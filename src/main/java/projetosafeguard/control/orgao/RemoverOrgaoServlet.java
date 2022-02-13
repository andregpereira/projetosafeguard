package projetosafeguard.control.orgao;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.OrgaoDAO;
import projetosafeguard.model.Orgao;

@WebServlet("/removerOrgao")
public class RemoverOrgaoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrgaoDAO orgaoDAO = new OrgaoDAO();
		int id = Integer.parseInt(req.getParameter("id"));
		boolean confirmarRemocao = Boolean.parseBoolean(req.getParameter("confirmarRemocao"));

		for (Iterator<Orgao> it = orgaoDAO.select().iterator(); it.hasNext();) {
			Orgao orgao = it.next();

			if (!confirmarRemocao && orgao.getId() == id) {
				req.setAttribute("idOrgaoRemover", id);
				req.setAttribute("razaoSocialRemover", orgao.getRazaoSocial());
				req.setAttribute("confirmarRemocaoOrgao", true);
				req.getRequestDispatcher("/listas?lista=orgao").forward(req, resp);
				return;
			}

			if (orgao.getId() == id) {
				orgaoDAO.delete(orgao);
				req.setAttribute("orgaoRemovido", true);
				break;
			}
		}

		req.getRequestDispatcher("/listas?lista=orgao").forward(req, resp);
	}

}
