package com.redsocial.controlador;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Golosina;
import com.redsocial.servicio.GolosinaServicio;

@Controller
public class GolosinaConsultaController {
	
	@Autowired
	private GolosinaServicio servicio;
	
	@RequestMapping("/verConsultaGolosina")
	public String ver() {
		return "consultaGolosina";
	}
	
	@RequestMapping("/consultaGolosina")
	public String lista(int idPais, String nombre, Model m) {
		List<Golosina> lista =  servicio.listaGolosina(idPais, nombre+"%");
		m.addAttribute("golosinas", lista);
		return "consultaGolosina";
	}

}
