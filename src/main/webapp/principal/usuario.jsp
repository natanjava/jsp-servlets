<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">User registration</h4>

														<form class="form-material" enctype="multipart/form-data"
															action="<%= request.getContextPath() %>/ServletUsuarioController"
															method="post" id="formUser">

															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default form-static-label">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modolLogin.id}"> <span
																	class="form-bar"></span> <label class="float-label">ID:</label>
															</div>

															<div class="form-group form-default input-group mb-4">
																<div class="input-group-prepend">
																	<c:if
																		test="${modolLogin.fotouser != '' && modolLogin.fotouser != null}">
																		<a
																			href="<%= request.getContextPath()%>/ServletUsuarioController?acao=downloadFoto&id=${modolLogin.id}">
																			<img alt="Imagem User" id="fotoembase64"
																			src="${modolLogin.fotouser}" width="70px">
																		</a>
																	</c:if>

																	<c:if
																		test="${modolLogin.fotouser == '' || modolLogin.fotouser == null}">
																		<img alt="Imagem User" id="fotoembase64"
																			src="assets/images/user.png" width="70px">
																	</c:if>

																</div>
																<input type="file" id="fileFoto" name="fileFoto"
																	accept="image/*"
																	onchange="visualizarImg('fotoembase64', 'fileFoto');"
																	class="form-control-file" title="Choose a File"
																	style="margin-top: 15px; margin-left: 5px;">
															</div>


															<div class="form-group form-default form-static-label">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modolLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Name:</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="dataNascimento"
																	id="dataNascimento" class="form-control"
																	required="required"
																	value="${modolLogin.dataNascimento}"> <span
																	class="form-bar"></span> <label class="float-label">Date
																	of birth: </label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="rendamensal" id="rendamensal"
																	class="form-control" required="required"
																	value="${modolLogin.rendamensal}"> <span
																	class="form-bar"></span> <label class="float-label">Wage:
																</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail:</label>
															</div>

															<div class="form-group form-default form-static-label">
																<select class="form-control"
																	aria-label="Default select example" name="perfil">
																	<option disabled="disabled">[Select the
																		Position]</option>

																	<option value="ADMIN"
																		<% ModelLogin modelLogin = (ModelLogin) request.getAttribute("modolLogin");
																		   if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {						
																		   out.print(" ");
																		   out.print("selected=\"selected\"");
																		   out.print(" ");
																		} %>>Admin</option>
																	<option value="MANAGER"
																		<% modelLogin = (ModelLogin) request.getAttribute("modolLogin");
																	 	if (modelLogin != null && modelLogin.getPerfil().equals("MANAGER")) {
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																	} %>>MANAGER</option>
																	<option value="ASSISTENT"
																		<% modelLogin = (ModelLogin) request.getAttribute("modolLogin");
																		if (modelLogin != null && modelLogin.getPerfil().equals("ASSISTENT")) {
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																	} %>>ASSISTENT</option>

																</select> <span class="form-bar"></span> <label
																	class="float-label">Position:</label>
															</div>


															<div class="form-group form-default form-static-label">
																<input onblur="pesquisaCep();" type="text" name="cep"
																	id="cep" class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.cep}"> <span
																	class="form-bar"></span> <label class="float-label">Zip
																	code</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="logradouro" id="logradouro"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.logradouro}">
																<span class="form-bar"></span> <label
																	class="float-label">Address</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="bairro" id="bairro"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.bairro}">
																<span class="form-bar"></span> <label
																	class="float-label">Neighborhood</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="localidade" id="localidade"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.localidade}">
																<span class="form-bar"></span> <label
																	class="float-label">City</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="uf" id="uf"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.uf}"> <span
																	class="form-bar"></span> <label class="float-label">State</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="text" name="numero" id="numero"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.numero}">
																<span class="form-bar"></span> <label
																	class="float-label">Number</label>
															</div>



															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	autocomplete="off" value="${modolLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Password</label>
															</div>

															<div class="form-group form-default form-static-label">
																<input type="radio" name="sexo" checked="checked"
																	value="MASCULIN"
																	<%
                                                            
                                                             modelLogin = (ModelLogin) request.getAttribute("modolLogin");
                                                                 
                                                             if (modelLogin != null && modelLogin.getSexo().equals("MASCULIN")) {
																	out.print(" ");
																	 out.print("checked=\"checked\"");
																	out.print(" ");
															}
                                                             
                                                             %>>Masculin</>

																<input type="radio" name="sexo" value="FEMININ"
																	<%
                                                            
                                                             modelLogin = (ModelLogin) request.getAttribute("modolLogin");
                                                                 
                                                             if (modelLogin != null && modelLogin.getSexo().equals("FEMININ")) {
																	out.print(" ");
																	 out.print("checked=\"checked\"");
																	out.print(" ");
															}
                                                             
                                                             %>>Feminin</>
															</div>

															<button type="button"
																class="btn btn-primary waves-effect waves-light"
																onclick="limparForm();">Clean Fields</button>
															<button class="btn btn-success waves-effect waves-light">Save
																user</button>
															<button type="button"
																class="btn btn-info waves-effect waves-light"
																onclick="criarDeleteComAjax();">Delete</button>

															<c:if test="${modolLogin.id > 0}">
																<a
																	href="<%= request.getContextPath() %>/SertvletTelefone?iduser=${modolLogin.id}"
																	class="btn btn-primary waves-effect waves-light">Phone</a>
															</c:if>
															<button type="button" class="btn btn-secondary"
																data-toggle="modal" data-target="#exampleModalUsuario">Search</button>
														</form>

													</div>
												</div>
											</div>
										</div>
										<span id="msg">${msg}</span>

										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaresultadosview">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Name</th>
														<th scope="col">Position</th>
														<th scope="col"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items='${modelLogins}' var='ml'>
														<tr>
															<td><c:out value="${ml.id}"></c:out></td>
															<td><c:out value="${ml.nome}"></c:out></td>
															<td><c:out value="${ml.perfil}"></c:out></td>
															<td><a class="btn btn-success"
																href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">See
																	more</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>


										<nav aria-label="Page navigation example">
											<ul class="pagination">

												<%
											     int totalPagina = (int) request.getAttribute("totalPagina");
											   
											    for (int p = 0; p < totalPagina; p++){
											    	String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);  
											    	out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+ url +"\">"+(p + 1)+"</a></li>");
											    }										   
											   %>
											</ul>
										</nav>

									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascripfile.jsp"></jsp:include>



	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Search for user</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="nome" id="nomeBusca" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="buscarUsuario();">Search</button>
						</div>
					</div>

					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaresultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">See more</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>


					<nav aria-label="Page navigation example">
						<ul class="pagination" id="ulPaginacaoUserAjax">

						</ul>
					</nav>

					<span id="totalResultados"></span>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$("#rendamensal").maskMoney({
			showSymbol : true,
			symbol : "$ ",
			decimal : ",",
			thousands : "."
		});

		const formatter = new Intl.NumberFormat('pt-BR', {
			currency : 'BRL',
			minimumFractionDigits : 2
		});

		$("#rendamensal").val(formatter.format($("#rendamensal").val()));

		$("#rendamensal").focus();

		var dataNascimento = $("#dataNascimento").val();

		if (dataNascimento != null && dataNascimento != '') {

			var dateFormat = new Date(dataNascimento);

			$("#dataNascimento").val(dateFormat.toLocaleDateString('pt-BR', {
				timeZone : 'UTC'
			}));

		}

		$("#nome").focus();

		$(function() {

			$("#dataNascimento")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Sunday', 'Monday', 'Tuesday',
										'Wednesday', 'Thursday', 'Friday', 'Saturday' ],
								dayNamesMin : [ 'S', 'M', 'T', 'W', 'T', 'F',
										'S', 'S' ],
								dayNamesShort : [ 'Sun', 'Mon', 'Tue', 'Wed',
										'Thu', 'Fri', 'Sat', 'Sun' ],
								monthNames : [ 'January', 'February', 'March', 'April',
												'May', 'June', 'July', 'August', 'September', 
												'October', 'November', 'December'],
								monthNamesShort : [ 'Jan', 'Feb', 'Mar', 'Apr',
										'Mai', 'Jun', 'Jul', 'Aug', 'Sep',
										'Oct', 'Nov', 'Dec' ],
								nextText : 'Next',
								prevText : 'Previous'
							});
		});

		$("#numero").keypress(function(event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});

		$("#cep").keypress(function(event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});

		function pesquisaCep() {
			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#cep").val(dados.cep);
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#localidade").val(dados.localidade);
							$("#uf").val(dados.uf);
						}

					});
		}

		function visualizarImg(fotoembase64, filefoto) {

			var preview = document.getElementById(fotoembase64); // Field IMG 
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result; /*load the photo on the screen*/
			};

			if (fileUser) {
				reader.readAsDataURL(fileUser); /*Previewof Image*/
			} else {
				preview.src = '';
			}

		}

		function verEditar(id) {

			var urlAction = document.getElementById('formUser').action;

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;

		}

		function buscaUserPagAjax(url) {

			var urlAction = document.getElementById('formUser').action;
			var nomeBusca = document.getElementById('nomeBusca').value;

			$.ajax(
				{
					method : "get",
					url : urlAction,
					data : url,
					success : function(response, textStatus, xhr) {
							var json = JSON.parse(response);
							$('#tabelaresultados > tbody > tr').remove();
							$("#ulPaginacaoUserAjax > li").remove();

							for (var p = 0; p < json.length; p++) {
								$('#tabelaresultados > tbody').append(
									'<tr> <td>'
									+ json[p].id
									+ '</td> <td> '
										+ json[p].nome
									+ '</td> <td><button onclick="verEditar('
									+ json[p].id
									+ ')" type="button" class="btn btn-info">Ver</button></td></tr>');
								}
							document.getElementById('totalResultados').textContent = 'Resultados: '
							+ json.length;

							var totalPagina = xhr.getResponseHeader("totalPagina");

									for (var p = 0; p < totalPagina; p++) {

										var url = 'nomeBusca='
												+ nomeBusca
												+ '&acao=buscarUserAjaxPage&pagina='
												+ (p * 5);

										$("#ulPaginacaoUserAjax")
											.append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''
											+ url
											+ '\')">'
											+ (p + 1)
											+ '</a></li>');
									}
								}
							}).fail(
							function(xhr, status, errorThrown) {
								alert('Erro ao buscar usuário por nome: '
										+ xhr.responseText);
							});
		}

		function buscarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/
				var urlAction = document.getElementById('formUser').action;
				$.ajax(
					{
						method : "get",
						url : urlAction,
						data : "nomeBusca=" + nomeBusca
						+ '&acao=buscarUserAjax',
						success : function(response, textStatus,xhr) {

							var json = JSON.parse(response);
							$('#tabelaresultados > tbody > tr').remove();
							$("#ulPaginacaoUserAjax > li").remove();

							for (var p = 0; p < json.length; p++) {
							$('#tabelaresultados > tbody')
								.append(
								'<tr> <td>'
								+ json[p].id
								+ '</td> <td> '
								+ json[p].nome
								+ '</td> <td><button onclick="verEditar('
								+ json[p].id
								+ ')" type="button" class="btn btn-info">Ver</button></td></tr>');
							}

							document.getElementById('totalResultados').textContent = 'Resultados: '	+ json.length;

							var totalPagina = xhr.getResponseHeader("totalPagina");

							for (var p = 0; p < totalPagina; p++) {
								var url = 'nomeBusca='
								+ nomeBusca
								+ '&acao=buscarUserAjaxPage&pagina='
								+ (p * 5);
								$("#ulPaginacaoUserAjax").append(
									'<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\''
								+ url + '\')">'
								+ (p + 1)
								+ '</a></li>');
							}
						}
					})
					.fail(function(xhr, status, errorThrown) {
						alert('Erro ao buscar usuário por nome: '
						+ xhr.responseText);
					});
			}
		}
		
		// delete with Ajax
		function criarDeleteComAjax() {

			var urlAction = document.getElementById('formUser').action;
			var idUser = document.getElementById('id').value;

			if (idUser != null && idUser != '') {

				if (confirm('Deseja realmente excluir os dados?')) {
					$.ajax(
						{
							method : "get",
							url : urlAction,
							data : "id=" + idUser
									+ '&acao=deletarajax',
							success : function(response) {

								limparForm();
									document.getElementById('msg').textContent = response;
									
							}

						}).fail(
							function(xhr, status, errorThrown) {
								alert('Error deleting user by id: '+ xhr.responseText);
							}
						);
						// -- 
						var urlAction = document.getElementById('formUser').action;
						window.location.href = urlAction + '?acao=listarUser';

				}
			} else {
				alert("\n\nUser must be selected. \nSearch the list below the registration form.");
			}
		}
		
		// function not more used; delete function is used only with Ajax (above)
		function criarDelete() {

			if (confirm('Deseja realmente excluir os dados?')) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();
			}
		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements; /*Retorna os elementos html dentro do form*/

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
			var fotoCarregada = document.getElementById("fotoembase64");
			if (fotoCarregada != null && fotoCarregada != '') {
				fotoCarregada.src = "assets/images/user.png";
			}
		}
	</script>



</body>
</html>
