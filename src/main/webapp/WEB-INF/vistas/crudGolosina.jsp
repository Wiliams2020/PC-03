<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de UCH - Wiliams Espinoza Castillo </title>
</head>
<body background="fondo.jpg" bgcolor="CAE1FF"> 

 <div class="container">
 <h1>Crud de Golosina</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudGolosina">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudGolosina" class="simple_form" id="defaultForm2"  method="post" bgcolor="CAE1FF">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Precio</th>
												<th>Stock</th>
												<th>Categoria</th>
												<th>Fecha Vencimiento</th>
												<th>Fecha Registro</th>
												<th>Pais</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${golosinas}" var="x">
													<tr>
														<td>${x.idGolosina}</td>
														<td>${x.nombre}</td>
														<td>${x.precio}</td>
														<td>${x.stock}</td>
														<td>${x.categoria}</td>
														<td>${x.fechaVencimiento}</td>
														<td>${x.fechaRegistro}</td>
														<td>${x.pais.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idGolosina}','${x.nombre}','${x.precio}','${x.stock}','${x.categoria}','${x.fechaVencimiento}','${x.fechaRegistro}','${x.pais.idPais}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idGolosina}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Golosina</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudGolosina" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Golosina</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_hombres">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_hombres" name="precio" placeholder="Ingrese el precio" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_mujeres">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_mujeres" name="stock" placeholder="Ingrese el stock" type="text" />
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_maxima">Categoria</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_maxima" name="categoria" placeholder="Ingrese la categoria" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_minima">Fecha Vencimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_minima" name="fechaVencimiento" placeholder="Ingrese la Fecha de Vencimiento" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_minima">Fecha Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_minima" name="fechaRegistro" placeholder="Ingrese la Fecha de Registro" type="text" />
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_deporte">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_deporte" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Golosina</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudGolosina" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Golosina</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idGolosina" type="text"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_hombres">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_precio" name="precio" placeholder="Ingrese el Precio" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_mujeres">Stock</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_stock" name="stock" placeholder="Ingrese el Stock" type="text"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_maxima">Categoria</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_categoria" name="categoria" placeholder="Ingrese la Categoria" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_minima">Fecha Vencimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaVencimiento" name="fechaVencimiento" placeholder="Ingrese la Fecha de Vencimiento" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_minima">Fecha Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaRegistro" name="fechaRegistro" placeholder="Ingrese la Fecha de Registro" type="text"/>
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_deporte">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_act_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_deporte").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,precio,stock,categoria, fechaVencimiento,fechaRegistro, idPais){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_precio]').val(precio);
	$('input[id=id_act_stock]').val(stock);
	$('input[id=id_act_categoria]').val(categoria);
	$('input[id=id_act_fechaVencimiento]').val(fechaVencimiento);
	$('input[id=id_act_fechaRegistro]').val(fechaRegistro);
	$('select[id=id_act_pais]').val(idPais);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    }
                }
            },
            "precio": {
        		selector : '#id_reg_num_hombres',
                validators: {
                    notEmpty: {
                        message: 'El n�mero de hombres es un campo obligatorio'
                    }
                }
            },
            "stock": {
        		selector : '#id_reg_num_mujeres',
                validators: {
                	notEmpty: {
                        message: 'El stock es un campo obligatorio'
                    }
                }
            },
            "categoria": {
        		selector : '#id_reg_maxima',
                validators: {
                	notEmpty: {
                        message: 'La categoria es un campo obligatorio'
                    }
                }
            },
            "fechaVencimiento": {
        		selector : '#id_reg_minima',
                validators: {
                	notEmpty: {
                        message: 'La fechaVencimiento es un campo obligatorio'
                    }
                }
            },

            "fechaRegistro": {
        		selector : '#id_reg_minima',
                validators: {
                	notEmpty: {
                        message: 'La fechaRegistro es un campo obligatorio'
                    }
                }
            },
            "pais.idPais": {
        		selector : '#id_reg_deporte',
                validators: {
                	notEmpty: {
                        message: 'El Pais un campo obligatorio'
                    }
                }
            }
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    }
                    
                }
            },
            "precio": {
        		selector : '#id_act_precio',
                validators: {
                    notEmpty: {
                        message: 'El n�mero de hombres es un campo obligatorio'
                    }
                }
            },
            "stock": {
        		selector : '#id_act_stock',
                validators: {
                	notEmpty: {
                        message: 'El n�mero de mujeres es un campo obligatorio'
                    }
                }
            },
            "categoria": {
        		selector : '#id_act_categoria',
                validators: {
                	notEmpty: {
                        message: 'La edad m�xima es un campo obligatorio'
                    }
                }
            },
            "fechaVencimiento": {
        		selector : '#id_act_fechaVencimiento',
                validators: {
                	notEmpty: {
                        message: 'La edad m�nima es un campo obligatorio'
                    }
                }
            },
            "fechaRegistro": {
        		selector : '#id_act_fechaRegistro',
                validators: {
                	notEmpty: {
                        message: 'El deporte un campo obligatorio'
                    }
                }
            },

            "pais.idPais": {
        		selector : '#id_act_pais',
                validators: {
                	notEmpty: {
                        message: 'La edad m�nima es un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 