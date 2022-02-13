package projetosafeguard.control.orgao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetosafeguard.control.dao.OrgaoDAO;
import projetosafeguard.model.Orgao;

@WebServlet("/registrarOrgao")
public class RegistrarOrgaoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrgaoDAO orgaoDAO = new OrgaoDAO();
		String uriRegistrar = "registrar.jsp";
		String razaoSocial = req.getParameter("razaoSocial");
		String tipoOrg = req.getParameter("tipoOrg");
		String endereco = req.getParameter("endereco");
		String nroRua = req.getParameter("nroRua");
		String bairro = req.getParameter("bairro");
		String cidade = req.getParameter("cidade");
		String cep = req.getParameter("cep");
		String telefone = req.getParameter("telefone");
		req.setAttribute("razaoSocial", req.getParameter("razaoSocial"));
		req.setAttribute("tipoOrg", req.getParameter("tipoOrg"));
		req.setAttribute("endereco", endereco);
		req.setAttribute("nroRua", nroRua);
		req.setAttribute("bairro", bairro);
		req.setAttribute("cidade", req.getParameter("cidade"));
		req.setAttribute("cep", cep);
		req.setAttribute("telefone", telefone);
		req.setAttribute("mostrarFormOrgao", true);

		if (razaoSocial.equals("")) {
			req.setAttribute("razaoSocialInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!tipoOrg.equalsIgnoreCase("público") && !tipoOrg.equalsIgnoreCase("privado")) {
			req.setAttribute("tipoOrgInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (endereco.equals("")) {
			req.setAttribute("enderecoInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			Integer.parseInt(nroRua);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("nroRuaInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (bairro.equals("")) {
			req.setAttribute("bairroInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (cidade.equals("")) {
			req.setAttribute("cidadeInvalida", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		try {
			Integer.parseInt(cep);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			req.setAttribute("cepInvalido", true);
			req.getRequestDispatcher(uriRegistrar).forward(req, resp);
			return;
		}

		if (!telefone.equals("")) {
			try {
				Long.parseLong(telefone);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				req.setAttribute("telefoneInvalido", true);
				req.getRequestDispatcher(uriRegistrar).forward(req, resp);
				return;
			}
		}

		req.removeAttribute("razaoSocial");
		req.removeAttribute("tipoOrg");
		req.removeAttribute("endereco");
		req.removeAttribute("nroRua");
		req.removeAttribute("bairro");
		req.removeAttribute("cidade");
		req.removeAttribute("cep");
		req.removeAttribute("telefone");

		Orgao orgao = new Orgao();

		orgao.setRazaoSocial(razaoSocial);
		orgao.setTipoOrg(tipoOrg.toUpperCase());
		orgao.setEndereco(endereco);
		orgao.setNroRua(nroRua);
		orgao.setBairro(bairro);
		orgao.setCidade(cidade);
		orgao.setCep(cep);
		orgao.setTelefone(telefone);
		orgaoDAO.insert(orgao);
		req.setAttribute("orgaoRegistrado", true);

		req.getRequestDispatcher(uriRegistrar).forward(req, resp);
	}

}
