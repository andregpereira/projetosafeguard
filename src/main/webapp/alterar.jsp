<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alterar ${nome} - Projeto Safeguard</title>
<link rel="shortcut icon" href="fav.ico?" type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/form.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<header class="navbar navbar-expand-md">
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
					<li class="nav-item col-6 col-md-auto"><a class="nav-link p-2"
						href="listas">Listas</a></li>
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
		<div class="container-sm">
			<h4 class="text-center branco mb-4">Alterando ${nome}</h4>
			<c:choose>
				<c:when test="${mostrarAlterarPeixe == true}">
					<form class="conteudo rounded" action="alterarPeixe" method="post">

						<p>
							<span style="color: red">*</span> = obrigatório
						</p>

						<hr>

						<div class="mb-3">
							<input type="hidden" name="id" value="${peixe.id}"> <label
								for="nomeCientifico" class="form-label">Nome científico
								<span style="color: red">*</span>
							</label>

							<c:if test="${nomeCientificoInvalido == true}">
								<div class="fw-bold" style="color: red">Nome científico
									inválido</div>
							</c:if>

							<input type="text" class="form-control" name="nomeCientifico"
								id="nomeCientifico" maxlength="50"
								value="${peixe.nomeCientifico}" required>
						</div>

						<div class="mb-3">
							<label for="nomeComum" class="form-label">Nome comum</label> <input
								type="text" class="form-control" name="nomeComum" maxlength="50"
								id="nomeComum" value="${peixe.nomeComum}">
						</div>

						<div class="mb-3">
							<label for="familia" class="form-label">Família <span
								style="color: red">*</span></label>

							<c:if test="${familiaInvalida == true}">
								<div class="fw-bold" style="color: red">Família inválida</div>
							</c:if>

							<input type="text" class="form-control" name="familia"
								id="familia" maxlength="50" value="${peixe.familia}" required>
						</div>

						<div class="mb-3">
							<label for="descricao" class="form-label">Descrição</label>
							<textarea class="form-control" name="descricao" id="descricao"
								rows="3" maxlength="250">${peixe.descricao}</textarea>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Tipo de água <span style="color: red">*</span>
								</legend>

								<label for="aguaSalgada" class="form-check-label me-3">

									<c:if test="${tipoAguaInvalido == true}">
										<div class="fw-bold" style="color: red">Tipo de água
											inválido</div>
									</c:if> <input type="radio" class="form-check-input" name="tipoAgua"
									id="aguaSalgada" value="salgada"
									${peixe.tipoAgua == 'SALGADA' ? 'checked' : ''} required>
									Salgada
								</label> <label for="aguaDoce" class="form-check-label"> <input
									type="radio" class="form-check-input" name="tipoAgua"
									id="aguaDoce" value="doce"
									${peixe.tipoAgua == 'DOCE' ? 'checked' : ''}> Doce
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<label for="classificacaoRisco" class="form-label">Classificação
								de risco <span style="color: red">*</span>
							</label>

							<c:if test="${classificacaoRiscoInvalida == true}">
								<div class="fw-bold" style="color: red">Classificação de
									risco inválida</div>
							</c:if>

							<select name="classificacaoRisco" id="classificacaoRisco"
								class="select d-block rounded" required>
								<option value="">Escolha uma classificação</option>
								<option value="DD"
									${peixe.classificacaoRisco == 'DD' ? 'selected' : ''}>DD
									(dados insuficientes)</option>
								<option value="LC"
									${peixe.classificacaoRisco == 'LC' ? 'selected' : ''}>LC
									(menos preocupante)</option>
								<option value="NT"
									${peixe.classificacaoRisco == 'NT' ? 'selected' : ''}>NT
									(quase ameaçada)</option>
								<option value="VU"
									${peixe.classificacaoRisco == 'VU' ? 'selected' : ''}>VU
									(vulnerável)</option>
								<option value="EN"
									${peixe.classificacaoRisco == 'EN' ? 'selected' : ''}>EN
									(em perigo)</option>
								<option value="CR"
									${peixe.classificacaoRisco == 'CR' ? 'selected' : ''}>CR
									(criticamente em perigo)</option>
								<option value="EW"
									${peixe.classificacaoRisco == 'EW' ? 'selected' : ''}>EW
									(extinta na natureza)</option>
								<option value="EX"
									${peixe.classificacaoRisco == 'EX' ? 'selected' : ''}>EX
									(extinta)</option>
							</select>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Período de desova? <span style="color: red">*</span>
								</legend>

								<c:if test="${periodoDesovaInvalido == true}">
									<div class="fw-bold" style="color: red">Período de desova
										inválido</div>
								</c:if>

								<label for="simPeriodoDesova" class="form-check-label me-3">
									<input type="radio" class="form-check-input"
									name="periodoDesova" id="simPeriodoDesova" value="sim"
									${peixe.periodoDesova == 'SIM' ? 'checked' : ''} required>
									Sim
								</label> <label for="naoPeriodoDesova" class="form-check-label">
									<input type="radio" class="form-check-input"
									name="periodoDesova" id="naoPeriodoDesova" value="não"
									${peixe.periodoDesova ==  'NÃO' ? 'checked' : ''}> Não
								</label>
							</fieldset>
						</div>

						<div class="d-flex justify-content-between flex-wrap">
							<div class="pb-1">
								<button id="limpar" class="btn btn-primary" type="reset">Limpar
									formulário</button>
							</div>

							<div>
								<button class="btn btn-primary" type="submit">Alterar</button>
								<a href="listas" class="btn btn-primary">Voltar</a>
							</div>
						</div>
					</form>
				</c:when>

				<c:when test="${mostrarAlterarLocalPesca == true}">
					<form class="conteudo rounded" action="alterarLocalPesca"
						method="post">

						<p>
							<span style="color: red">*</span> = obrigatório
						</p>

						<hr>

						<div class="mb-3">
							<input type="hidden" name="id" value="${localPesca.id}">

							<label for="latitude" class="form-label">Latitude (entre
								-90 e 90, incluindo decimal) <span style="color: red">*</span>
							</label>

							<c:if test="${latitudeInvalida == true}">
								<div class="fw-bold" style="color: red">Latitude inválida</div>
							</c:if>

							<input type="number" class="form-control" name="latitude"
								id="latitude" value="${localPesca.latitude}" min="-90" max="90"
								step="0.000000000000001" required>
						</div>

						<div class="mb-3">
							<label for="longitude" class="form-label">Longitude
								(entre -180 e 180, incluindo decimal) <span style="color: red">*</span>
							</label>

							<c:if test="${longitudeInvalida == true}">
								<div class="fw-bold" style="color: red">Longitude inválida</div>
							</c:if>

							<input type="number" class="form-control" name="longitude"
								id="longitude" value="${localPesca.longitude}" min="-180"
								max="180" step="0.000000000000001" required>
						</div>

						<div class="mb-3">
							<label for="localizacao" class="form-label">Localização <span
								style="color: red">*</span></label>

							<c:if test="${localizacaoInvalida == true}">
								<div class="fw-bold" style="color: red">Localização
									inválida</div>
							</c:if>

							<select name="localizacao" id="localizacao"
								class="select d-block rounded" required>
								<option value="">Escolha uma localização</option>
								<option value="lago"
									${localPesca.localizacao == 'LAGO' ? 'selected' : ''}>Lago</option>
								<option value="rio"
									${localPesca.localizacao == 'RIO' ? 'selected' : ''}>Rio</option>
								<option value="costa"
									${localPesca.localizacao == 'COSTA' ? 'selected' : ''}>Costa</option>
								<option value="alto mar"
									${localPesca.localizacao == 'ALTO MAR' ? 'selected' : ''}>Alto
									mar</option>
							</select>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Tipo de propriedade <span style="color: red">*</span>
								</legend>

								<c:if test="${tipoPropriedadeInvalido == true}">
									<div class="fw-bold" style="color: red">Tipo de
										propriedade inválido</div>
								</c:if>

								<label for="propriedadePublica" class="form-check-label me-3">
									<input type="radio" class="form-check-input"
									name="tipoPropriedade" id="propriedadePublica" value="pública"
									${localPesca.tipoPropriedade == 'PÚBLICA' ? 'checked' : ''}
									required> Pública
								</label> <label for="propriedadeParticular" class="form-check-label">
									<input type="radio" class="form-check-input"
									name="tipoPropriedade" id="propriedadeParticular"
									value="particular"
									${localPesca.tipoPropriedade == 'PARTICULAR' ? 'checked' : ''}>
									Particular
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<label for="tipoPescaPermitida" class="form-label me-3">Tipo
								de pesca permitida</label> <input type="text" class="form-control"
								name="tipoPescaPermitida" id="tipoPescaPermitida"
								placeholder="Esportiva" maxlength="50"
								value="${localPesca.tipoPescaPermitida}">
						</div>

						<div class="mb-3">
							<label for="idOrgao" class="form-label">ID órgão <span
								style="color: red">*</span></label>

							<c:if test="${idOrgaoInvalida == true}">
								<div class="fw-bold" style="color: red">ID órgão inválida</div>
							</c:if>

							<input type="number" name="idOrgao" id="idOrgao"
								class="form-control" min="1" value="${localPesca.idOrgao}"
								required>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Pesca permitida? <span style="color: red">*</span>
								</legend>

								<c:if test="${pescaPermitidaInvalida == true}">
									<div class="fw-bold" style="color: red">Pesca permitida
										inválida</div>
								</c:if>

								<label for="simPescaPermitida" class="form-check-label me-3">
									<input type="radio" class="form-check-input"
									name="pescaPermitida" id="simPescaPermitida" value="sim"
									${localPesca.pescaPermitida == 'SIM' ? 'checked' : ''} required>
									Sim
								</label> <label for="naoPescaPermitida" class="form-check-label">
									<input type="radio" class="form-check-input"
									name="pescaPermitida" id="naoPescaPermitida" value="não"
									${localPesca.pescaPermitida == 'NÃO' ? 'checked' : ''}>
									Não
								</label>
							</fieldset>
						</div>

						<div class="d-flex justify-content-between flex-wrap">
							<div class="pb-1">
								<button id="limpar" class="btn btn-primary" type="reset">Limpar
									formulário</button>
							</div>

							<div>
								<button class="btn btn-primary" type="submit">Alterar</button>
								<a href="listas?lista=local_pesca" class="btn btn-primary">Voltar</a>
							</div>
						</div>
					</form>
				</c:when>

				<c:when test="${mostrarAlterarOrgao == true}">
					<form class="conteudo rounded" action="alterarOrgao" method="post">

						<p>
							<span style="color: red">*</span> = obrigatório
						</p>

						<hr>

						<div class="mb-3">
							<input type="hidden" name="id" value="${orgao.id}"> <label
								for="razaoSocial" class="form-label">Razão social <span
								style="color: red">*</span></label>

							<c:if test="${razaoSocialInvalida == true}">
								<div class="fw-bold" style="color: red">Razão social
									inválida</div>
							</c:if>

							<input type="text" class="form-control" name="razaoSocial"
								id="razaoSocial" maxlength="50" value="${orgao.razaoSocial}"
								required>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Tipo de órgão <span style="color: red">*</span>
								</legend>

								<c:if test="${tipoOrgInvalido == true}">
									<div class="fw-bold" style="color: red">Tipo de órgão
										inválido</div>
								</c:if>

								<label for="orgaoPublico" class="form-check-label me-3">
									<input type="radio" class="form-check-input" name="tipoOrg"
									id="orgaoPublico" value="público"
									${orgao.tipoOrg == 'PÚBLICO' ? 'checked' : ''} required>
									Público
								</label> <label for="privado" class="form-check-label"> <input
									type="radio" class="form-check-input" name="tipoOrg"
									id="privado" value="privado"
									${orgao.tipoOrg == 'PRIVADO' ? 'checked' : ''}> Privado
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<label for="endereco" class="form-label">Endereço <span
								style="color: red">*</span></label>

							<c:if test="${enderecoInvalido == true}">
								<div class="fw-bold" style="color: red">Endereço inválido</div>
							</c:if>

							<input type="text" name="endereco" id="endereco"
								class="form-control" maxlength="50" value="${orgao.endereco}"
								required>
						</div>

						<div class="mb-3">
							<label for="nroRua" class="form-label">Número da rua <span
								style="color: red">*</span></label>

							<c:if test="${nroRuaInvalido == true}">
								<div class="fw-bold" style="color: red">Número da rua
									inválido</div>
							</c:if>

							<input type="text" name="nroRua" id="nroRua"
								class="form-control int" maxlength="4" value="${orgao.nroRua}"
								required>
						</div>

						<div class="mb-3">
							<label for="bairro" class="form-label me-3">Bairro <span
								style="color: red">*</span></label>

							<c:if test="${bairroInvalido == true}">
								<div class="fw-bold" style="color: red">Bairro inválido</div>
							</c:if>

							<input type="text" class="form-control" name="bairro" id="bairro"
								maxlength="50" value="${orgao.bairro}" required>
						</div>

						<div class="mb-3">
							<label for="cidade" class="form-label">Cidade <span
								style="color: red">*</span></label>

							<c:if test="${cidadeInvalida == true}">
								<div class="fw-bold" style="color: red">Cidade inválida</div>
							</c:if>

							<input type="text" name="cidade" id="cidade" class="form-control"
								maxlength="50" value="${orgao.cidade}" required>
						</div>

						<div class="mb-3">
							<label for="cep" class="form-label">CEP <span
								style="color: red">*</span></label>

							<c:if test="${cepInvalido == true}">
								<div class="fw-bold" style="color: red">CEP inválido</div>
							</c:if>

							<input type="text" name="cep" id="cep" class="form-control int"
								maxlength="8" value="${orgao.cep}" required>
						</div>

						<div class="mb-3">
							<label for="telefone" class="form-label">Telefone</label> <input
								type="tel" name="telefone" id="telefone" class="form-control"
								maxlength="11" value="${orgao.telefone}">
						</div>

						<div class="d-flex justify-content-between flex-wrap">
							<div class="pb-1">
								<button id="limpar" class="btn btn-primary" type="reset">Limpar
									formulário</button>
							</div>

							<div>
								<button class="btn btn-primary" type="submit">Alterar</button>
								<a href="listas?lista=orgao" class="btn btn-primary">Voltar</a>
							</div>
						</div>
					</form>
				</c:when>

				<c:when test="${mostrarAlterarRelatorio == true}">
					<form class="conteudo rounded bg-warning" action="alterarRelatorio"
						method="post">

						<p>
							<span style="color: red">*</span> = obrigatório
						</p>

						<hr>

						<input type="hidden" name="id" value="${relatorio.id}">

						<div class="mb-3">
							<label for="idLocal" class="form-label">ID local <span
								style="color: red">*</span></label>

							<c:if test="${idLocalInvalida == true}">
								<div class="fw-bold" style="color: red">ID local inválida</div>
							</c:if>

							<input type="number" class="form-control" name="idLocal"
								id="idLocal" min="1" value="${relatorio.idLocal}" required>
						</div>

						<div class="mb-3">
							<label for="temperaturaMedia" class="form-label">Temperatura
								média (°C) <span style="color: red">*</span>
							</label>

							<c:if test="${temperaturaMediaInvalida == true}">
								<div class="fw-bold" style="color: red">Temperatura média
									inválida</div>
							</c:if>

							<input type="number" name="temperaturaMedia" id="tempMedia"
								class="form-control" value="${relatorio.temperaturaMedia}"
								min="0" max="50" step="0.01" placeholder="27,3" required>
						</div>

						<div class="mb-3">
							<label for="ph" class="form-label">pH <span
								style="color: red">*</span></label>

							<c:if test="${phInvalido == true}">
								<div class="fw-bold" style="color: red">pH inválido</div>
							</c:if>

							<input type="number" name="ph" id="ph" class="form-control"
								placeholder="7,9" value="${relatorio.ph}" min="0" max="14"
								step="0.1" required>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Presença de turbidez? <span style="color: red">*</span>
								</legend>

								<c:if test="${presencaTurbidezInvalida == true}">
									<div class="fw-bold" style="color: red">Presença de
										turbidez inválida</div>
								</c:if>

								<label for="simTurbidez" class="form-check-label me-3">
									<input type="radio" class="form-check-input"
									name="presencaTurbidez" id="simTurbidez" value="sim"
									${relatorio.presencaTurbidez == 'SIM' ? 'checked' : ''}
									required> Sim
								</label> <label for="naoTurbidez" class="form-check-label"> <input
									type="radio" class="form-check-input" name="presencaTurbidez"
									id="naoTurbidez" value="não"
									${relatorio.presencaTurbidez == 'NÃO' ? 'checked' : ''}>
									Não
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Presença de sólidos tóxicos? <span style="color: red">*</span>
								</legend>

								<c:if test="${presencaSolidosToxicosInvalida == true}">
									<div class="fw-bold" style="color: red">Presença de
										sólidos tóxicos inválida</div>
								</c:if>

								<label for="simPresencaSolidosToxicos"
									class="form-check-label me-3"> <input type="radio"
									class="form-check-input" name="presencaSolidosToxicos"
									id="simPresencaSolidosToxicos" value="sim"
									${relatorio.presencaSolidosToxicos == 'SIM' ? 'checked' : ''}
									required> Sim
								</label> <label for="naoPresencaSolidosToxicos" class="form-check-label">
									<input type="radio" class="form-check-input"
									name="presencaSolidosToxicos" id="naoPresencaSolidosToxicos"
									value="não"
									${relatorio.presencaSolidosToxicos == 'NÃO' ? 'checked' : ''}>
									Não
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Presença de coliformes fecais? <span style="color: red">*</span>
								</legend>

								<c:if test="${presencaColiformesFecaisInvalida == true}">
									<div class="fw-bold" style="color: red">Presença de
										coliformes fecais inválida</div>
								</c:if>

								<label for="simPresencaColiformesFecais"
									class="form-check-label me-3"> <input type="radio"
									class="form-check-input" name="presencaColiformesFecais"
									id="simPresencaColiformesFecais" value="sim"
									${relatorio.presencaColiformesFecais == 'SIM' ? 'checked' : ''}
									required> Sim
								</label> <label for="naoPresencaColiformesFecais"
									class="form-check-label"> <input type="radio"
									class="form-check-input" name="presencaColiformesFecais"
									id="naoPresencaColiformesFecais" value="não"
									${relatorio.presencaColiformesFecais == 'NÃO' ? 'checked' : ''}>
									Não
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<label for="teorOxigenioDissolvido" class="form-label">Teor
								de oxigênio dissolvido <span style="color: red">*</span>
							</label>

							<c:if test="${teorOxigenioInvalido == true}">
								<div class="fw-bold" style="color: red">Teor de oxigênio
									dissolvido inválido</div>
							</c:if>

							<input type="number" name="teorOxigenioDissolvido"
								id="teorOxigenioDissolvido" class="form-control"
								placeholder="57,28" value="${relatorio.teorOxigenioDissolvido}"
								min="0" max="100" step="0.01" required>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Excesso de nitratos? <span style="color: red">*</span>
								</legend>

								<c:if test="${excessoNitratosInvalido == true}">
									<div class="fw-bold" style="color: red">Excesso de
										nitratos inválido</div>
								</c:if>

								<label for="simExcessoNitratos" class="form-check-label me-3">
									<input type="radio" class="form-check-input"
									name="excessoNitratos" id="simExcessoNitratos" value="sim"
									${relatorio.excessoNitratos == 'SIM' ? 'checked' : ''} required>
									Sim
								</label> <label for="naoExcessoNitratos" class="form-check-label">
									<input type="radio" class="form-check-input"
									name="excessoNitratos" id="naoExcessoNitratos" value="não"
									${relatorio.excessoNitratos == 'NÃO' ? 'checked' : ''}>
									Não
								</label>
							</fieldset>
						</div>

						<div class="mb-3">
							<fieldset>
								<legend class="fs-6">
									Excesso de fosfatos? <span style="color: red">*</span>
								</legend>

								<c:if test="${excessoFosfatosInvalido == true}">
									<div class="fw-bold" style="color: red">Excesso de
										fosfatos inválido</div>
								</c:if>

								<label for="simExcessoFosfatos" class="form-check-label me-3">
									<input type="radio" class="form-check-input"
									name="excessoFosfatos" id="simExcessoFosfatos" value="sim"
									${relatorio.excessoFosfatos == 'SIM' ? 'checked' : ''} required>
									Sim
								</label> <label for="naoExcessoFosfatos" class="form-check-label">
									<input type="radio" class="form-check-input"
									name="excessoFosfatos" id="naoExcessoFosfatos" value="não"
									${relatorio.excessoFosfatos == 'NÃO' ? 'checked' : ''}>
									Não
								</label>
							</fieldset>
						</div>

						<div class="d-flex justify-content-between flex-wrap">
							<div class="pb-1">
								<button id="limpar" class="btn btn-primary" type="reset">Limpar
									formulário</button>
							</div>

							<div>
								<button class="btn btn-primary" type="submit">Alterar</button>
								<a href="listas?lista=relatorio" class="btn btn-primary">Voltar</a>
							</div>
						</div>
					</form>
				</c:when>
			</c:choose>
		</div>
	</div>

	<footer class="text-center branco"> Global Impact 2021. Equipe
		Ctrl+Alt+Del © 2021. </footer>

	<script src="./js/form.js"></script>
</body>

</html>