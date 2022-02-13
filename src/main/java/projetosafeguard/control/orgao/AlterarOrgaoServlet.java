package projetosafeguard.control.orgao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.OrgaoDAO;
import projetosafeguard.model.Orgao;

@WebServlet("/alterarOrgao")
public class AlterarOrgaoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrgaoDAO orgaoDAO = new OrgaoDAO();
		String uriAlterar = "/alterar?alterar=orgao";
		int id = Integer.parseInt(req.getParameter("id"));
		String razaoSocial = req.getParameter("razaoSocial");
		String tipoOrg = req.getParameter("tipoOrg");
		String endereco = req.getParameter("endereco");
		String nroRua = req.getParameter("nroRua");
		String bairro = req.getParameter("bairro");
		String cidade = req.getParameter("cidade");
		String cep = req.getParameter("cep");
		String telefone = req.getParameter("telefone");

		if (razaoSocial.equals("")) {
			req.setAttribute("razaoSocialInvalida", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (!tipoOrg.equalsIgnoreCase("público") && !tipoOrg.equalsIgnoreCase("privado")) {
			req.setAttribute("tipoOrgInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (endereco.equals("")) {
			req.setAttribute("enderecoInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		try {
			Integer.parseInt(nroRua);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("nroRuaInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (bairro.equals("")) {
			req.setAttribute("bairroInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (cidade.equals("")) {
			req.setAttribute("cidadeInvalida", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		try {
			Long.parseLong(cep);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("cepInvalido", true);
			req.getRequestDispatcher(uriAlterar).forward(req, resp);
			return;
		}

		if (!telefone.equals("")) {
			try {
				Long.parseLong(telefone);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				req.setAttribute("telefoneInvalido", true);
				req.getRequestDispatcher(uriAlterar).forward(req, resp);
				return;
			}
		}

		Orgao orgao = new Orgao();

		orgao.setId(id);
		orgao.setRazaoSocial(razaoSocial);
		orgao.setTipoOrg(tipoOrg.toUpperCase());
		orgao.setEndereco(endereco);
		orgao.setNroRua(nroRua);
		orgao.setBairro(bairro);
		orgao.setCidade(cidade);
		orgao.setCep(cep);
		orgao.setTelefone(telefone);
		orgaoDAO.update(orgao);
		req.setAttribute("orgaoAlterado", true);

		req.getRequestDispatcher("/listas?lista=orgao").forward(req, resp);
	}

}
