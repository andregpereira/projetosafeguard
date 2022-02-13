<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Listas - Projeto Safeguard</title>
<link rel="shortcut icon" href="fav.ico?" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/listas.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<header class="navbar navbar-expand-md bd-navbar">
		<nav class="container-xxl flex-wrap" aria-label="Main navigation">
			<h1 class="m-0">
				<a
					class="d-flex align-items-center nav-link navbar-brand p-0 me-2 fs-4"
					href="." aria-label="Projeto Safeguard" title="Projeto Safeguard">
					<img class="me-2" src="img/tropical-fish.svg" alt="Peixe &#x1F420;"
					width="50" height="50"> Projeto Safeguard
				</a>
			</h1>

			<button class="navbar-toggler collapsed branco" type="button"
				data-bs-toggle="collapse" data-bs-target="#botaoNav"
				aria-controls="botaoNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"
					class="bi" fill="currentColor" viewBox="0 0 16 16">
          <path fill-rule="evenodd"
						d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z">
          </path>
        </svg>

			</button>

			<div id="botaoNav" class="navbar-collapse collapse">
				<ul class="navbar-nav flex-row flex-wrap bd-navbar-nav pt-2 py-md-0">
					<li class="nav-item col-6 col-md-auto"><a class="nav-link p-2"
						aria-current="true" href="./registrar.jsp">Registrar</a></li>
					<li class="nav-item col-6 col-md-auto"><a
						class="nav-link p-2 selecionado" href="listas">Listas</a></li>
				</ul>

				<hr>

				<ul class="navbar-nav flex-row flex-wrap ms-md-auto">
					<li class="nav-item col-6 col-md-auto"><a
						class="nav-link facebook p-2" href="https://facebook.com"
						target="_blank" rel="noopener" title="Facebook"> <span
							class="redes-sociais fab fa-facebook"></span> <small
							class="d-md-none ms-2">Facebook</small>
					</a></li>
					<li class="nav-item col-6 col-md-auto"><a
						class="nav-link instagram p-2" href="https://instagram.com"
						target="_blank" rel="noopener" title="Instagram"> <span
							class="redes-sociais fab fa-instagram"></span> <small
							class="d-md-none ms-2">Instagram</small>
					</a></li>
					<li class="nav-item col-6 col-md-auto"><a
						class="nav-link twitter p-2" href="https://twitter.com"
						target="_blank" rel="noopener" title="Twitter"> <span
							class="redes-sociais fab fa-twitter"></span> <small
							class="d-md-none ms-2">Twitter</small>
					</a></li>
					<li class="nav-item col-6 col-md-auto"><a
						class="nav-link youtube p-2" href="https://youtube.com"
						target="_blank" rel="noopener" title="YouTube"> <span
							class="redes-sociais fab fa-youtube"></span> <small
							class="d-md-none ms-2">YouTube</small>
					</a></li>
					<li class="nav-item col-6 col-md-auto"><a
						class="nav-link reddit p-2" href="https://reddit.com"
						target="_blank" rel="noopener" title="Reddit"> <span
							class="redes-sociais fab fa-reddit"></span> <small
							class="d-md-none ms-2">Reddit</small>
					</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<div class="meio py-4">
		<div class="container-xl px-3 rounded">
			<h4 class="text-center branco mb-4">Listas</h4>

			<c:choose>
				<c:when test="${confirmarRemocaoOrgao == true}">
					<div class="bg-danger justify-content-center p-3 mb-2 rounded">
						<p class="fs-5 text-center branco">Remover órgão
							${razaoSocialRemover}?</p>
						<p class="branco">Os locais de pesca e seus respectivos
							relatórios também serão removidos!</p>

						<div class="d-flex flex-wrap">
							<a href="removerOrgao?id=${idOrgaoRemover}&confirmarRemocao=true"
								class="btn btn-primary m-1">Sim, remover</a> <a
								href="listas?lista=orgao" class="btn btn-primary m-1">Não
								remover</a>
						</div>

					</div>
				</c:when>

				<c:when test="${confirmarRemocaoLocalPesca == true}">
					<div class="bg-danger justify-content-center p-3 mb-2 rounded">
						<p class="fs-5 text-center branco">Remover local de pesca ID
							${idLocalPescaRemover}?</p>
						<p class="branco">Os relatórios associados a ele também serão
							removidos!</p>

						<div class="d-flex flex-wrap">
							<a
								href="removerLocalPesca?id=${idLocalPescaRemover}&confirmarRemocao=true"
								class="btn btn-primary m-1">Sim, remover</a> <a
								href="listas?lista=local_pesca" class="btn btn-primary m-1">Não
								remover</a>
						</div>

					</div>
				</c:when>

				<c:when test="${peixeRemovido == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-danger p-2 m-0 rounded branco">Peixe
							removido</p>
					</div>
				</c:when>

				<c:when test="${localPescaRemovido == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-danger p-2 m-0 rounded branco">Local
							de pesca removido</p>
					</div>
				</c:when>

				<c:when test="${orgaoRemovido == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-danger p-2 m-0 rounded branco">Órgão
							removido</p>
					</div>
				</c:when>

				<c:when test="${relatorioRemovido == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-danger p-2 m-0 rounded branco">Relatório
							removido</p>
					</div>
				</c:when>

				<c:when test="${peixeAlterado == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-success p-2 m-0 rounded branco">Peixe
							alterado</p>
					</div>
				</c:when>

				<c:when test="${localPescaAlterado == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-success p-2 m-0 rounded branco">Local
							de pesca alterado</p>
					</div>
				</c:when>

				<c:when test="${orgaoAlterado == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-success p-2 m-0 rounded branco">Órgão
							alterado</p>
					</div>
				</c:when>

				<c:when test="${relatorioAlterado == true}">
					<div class="d-flex justify-content-center mb-2">
						<p class="fs-5 text-center bg-success p-2 m-0 rounded branco">Relatório
							alterado</p>
					</div>
				</c:when>
			</c:choose>

			<p class="bg-warning rounded p-2">
				<b>AVISO</b>: remover um órgão também removerá os locais de pesca
				associados a ele, que também removerá os relatórios deste local
			</p>

			<nav class="menu rounded-top">
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-peixe-tab"
						data-bs-toggle="tab" data-bs-target="#nav-peixe" type="button"
						role="tab" aria-controls="nav-peixe" aria-selected="true">Peixes</button>
					<button class="nav-link" id="nav-local-pesca-tab"
						data-bs-toggle="tab" data-bs-target="#nav-local-pesca"
						type="button" role="tab" aria-controls="nav-local-pesca"
						aria-selected="false">Locais de pesca</button>
					<button class="nav-link" id="nav-orgao-tab" data-bs-toggle="tab"
						data-bs-target="#nav-orgao" type="button" role="tab"
						aria-controls="nav-orgao" aria-selected="false">Órgãos</button>
					<button class="nav-link bg-warning" id="nav-relatorio-tab"
						data-bs-toggle="tab" data-bs-target="#nav-relatorio" type="button"
						role="tab" aria-controls="nav-relatorio" aria-selected="false">Relatórios</button>
				</div>
			</nav>

			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active table-responsive"
					id="nav-peixe" role="tabpanel" aria-labelledby="nav-peixe-tab">

					<c:choose>
						<c:when test="${not empty peixes}">
							<table
								class="table table-light table-striped table-hover table-bordered border-dark align-middle">
								<thead class="align-middle">
									<tr class="text-center">
										<th>ID</th>
										<th>Nome científico</th>
										<th>Nome comum</th>
										<th>Família</th>
										<th>Descrição</th>
										<th>Tipo de água</th>
										<th>Classificação de risco</th>
										<th>Período de desova?</th>
										<th>Ações</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${peixes}" var="peixe">
										<tr>
											<td>${peixe.id}</td>
											<td>${peixe.nomeCientifico}</td>
											<td>${peixe.nomeComum}</td>
											<td>${peixe.familia}</td>
											<td>${peixe.descricao}</td>
											<td>${peixe.tipoAgua}</td>
											<td>${peixe.classificacaoRisco}</td>
											<td>${peixe.periodoDesova}</td>
											<td>
												<div class="d-flex justify-content-around">
													<a href="alterar?alterar=peixe&id=${peixe.id}"
														title="Editar"> <span class="fas fa-edit acoes"></span>
													</a> <a href="removerPeixe?id=${peixe.id}" title="Remover">
														<span class="fas fa-trash acoes"></span>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p class="fs-2 my-3 text-center branco">Não há registros de
								peixes</p>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="tab-pane fade table-responsive" id="nav-local-pesca"
					role="tabpanel" aria-labelledby="nav-local-pesca-tab">

					<c:choose>
						<c:when test="${not empty locaisPesca}">
							<table
								class="table table-light table-striped table-hover table-bordered border-dark align-middle">
								<thead class="align-middle">
									<tr class="text-center">
										<th>ID</th>
										<th>Latitude</th>
										<th>Longitude</th>
										<th>Localização</th>
										<th>Tipo de propriedade</th>
										<th>Tipo de pesca permitida</th>
										<th>ID órgão</th>
										<th>Pesca permitida?</th>
										<th>Ações</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${locaisPesca}" var="localPesca">
										<tr>
											<td>${localPesca.id}</td>
											<td>${localPesca.latitude}</td>
											<td>${localPesca.longitude}</td>
											<td>${localPesca.localizacao}</td>
											<td>${localPesca.tipoPropriedade}</td>
											<td>${localPesca.tipoPescaPermitida}</td>
											<td>${localPesca.idOrgao}</td>
											<td>${localPesca.pescaPermitida}</td>
											<td>
												<div class="d-flex justify-content-around">
													<a href="alterar?alterar=local_pesca&id=${localPesca.id}"
														title="Editar"> <span class="fas fa-edit acoes"></span>
													</a> <a href="removerLocalPesca?id=${localPesca.id}"
														title="Remover"> <span class="fas fa-trash acoes"></span>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p class="fs-2 my-3 text-center branco">Não há registros de
								locais de pesca</p>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="tab-pane fade table-responsive" id="nav-orgao"
					role="tabpanel" aria-labelledby="nav-orgao-tab">

					<c:choose>
						<c:when test="${not empty orgaos}">
							<table
								class="table table-light table-striped table-hover table-bordered border-dark align-middle">
								<thead class="align-middle">
									<tr class="text-center">
										<th>ID</th>
										<th>Razão social</th>
										<th>Tipo de órgão</th>
										<th>Endereço</th>
										<th>Número da rua</th>
										<th>Bairro</th>
										<th>Cidade</th>
										<th>CEP</th>
										<th>Telefone</th>
										<th>Ações</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${orgaos}" var="orgao">
										<tr>
											<td>${orgao.id}</td>
											<td>${orgao.razaoSocial}</td>
											<td>${orgao.tipoOrg}</td>
											<td>${orgao.endereco}</td>
											<td>${orgao.nroRua}</td>
											<td>${orgao.bairro}</td>
											<td>${orgao.cidade}</td>
											<td>${orgao.cep}</td>
											<td>${orgao.telefone}</td>
											<td>
												<div class="d-flex justify-content-around">
													<a href="alterar?alterar=orgao&id=${orgao.id}"
														title="Editar"> <span class="fas fa-edit acoes"></span>
													</a> <a href="removerOrgao?id=${orgao.id}" title="Remover">
														<span class="fas fa-trash acoes"></span>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p class="fs-2 my-3 text-center branco">Não há registros de
								órgãos</p>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="tab-pane fade table-responsive" id="nav-relatorio"
					role="tabpanel" aria-labelledby="nav-relatorio-tab">

					<c:choose>
						<c:when test="${not empty relatorios}">
							<table
								class="table table-warning table-striped table-hover table-bordered border-dark align-middle">
								<thead class="align-middle">
									<tr class="text-center">
										<th>ID</th>
										<th>ID local</th>
										<th>Temperatura média (°C)</th>
										<th>pH</th>
										<th>Presença de turbidez?</th>
										<th>Presença de sólidos tóxicos?</th>
										<th>Presença de coliformes fecais?</th>
										<th>Teor de oxigênio dissolvido</th>
										<th>Excesso de nitratos?</th>
										<th>Excesso de fosfatos?</th>
										<th>Ações</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${relatorios}" var="relatorio">
										<tr>
											<td>${relatorio.id}</td>
											<td>${relatorio.idLocal}</td>
											<td>${relatorio.temperaturaMedia}</td>
											<td>${relatorio.ph}</td>
											<td>${relatorio.presencaTurbidez}</td>
											<td>${relatorio.presencaSolidosToxicos}</td>
											<td>${relatorio.presencaColiformesFecais}</td>
											<td>${relatorio.teorOxigenioDissolvido}</td>
											<td>${relatorio.excessoNitratos}</td>
											<td>${relatorio.excessoFosfatos}</td>
											<td>
												<div class="d-flex justify-content-around">
													<a href="alterar?alterar=relatorio&id=${relatorio.id}"
														title="Editar"> <span class="fas fa-edit acoes"></span>
													</a> <a href="removerRelatorio?id=${relatorio.id}"
														title="Remover"> <span class="fas fa-trash acoes"></span>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<p class="fs-2 my-3 text-center branco">Não há registros de
								relatórios</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<footer class="text-center branco"> Global Impact 2021. Equipe
		Ctrl+Alt+Del © 2021. </footer>

	<c:choose>
		<c:when test="${mostrarListaLocalPesca == true}">
			<script src="./js/mostrarListaLocalPesca.js"></script>
		</c:when>

		<c:when test="${mostrarListaOrgao == true}">
			<script src="./js/mostrarListaOrgao.js"></script>
		</c:when>

		<c:when test="${mostrarListaRelatorio == true}">
			<script src="./js/mostrarListaRelatorio.js"></script>
		</c:when>
	</c:choose>
</body>

</html>