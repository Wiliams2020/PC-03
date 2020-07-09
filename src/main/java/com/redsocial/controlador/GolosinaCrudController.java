package com.redsocial.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.redsocial.entidad.Golosina;
import com.redsocial.servicio.GolosinaServicio;

@Controller
public class GolosinaCrudController {
	
	@Autowired
	private GolosinaServicio servicio;
	
	@RequestMapping("/verCrudGolosina")
	public String ver() {
		return "crudGolosina";
	}
	
	@RequestMapping("/consultaCrudGolosina")
	public String lista(String filtro, Model m) {
		List<Golosina> lista =  servicio.listaGolosinaPorNombre(filtro+"%");
		m.addAttribute("golosinas", lista);
		return "crudGolosina";
	}
	
	@RequestMapping("/registraActualizaCrudGolosina")
	public String registraActualiza(Golosina obj, Model m) {
		servicio.insertaActualizaGolosina(obj);
		List<Golosina> lista =  servicio.listaGolosina();
		m.addAttribute("golosinas", lista);
		return "crudGolosina";
	}
	
	@RequestMapping("/eliminaCrudGolosina")
	public String elimina(int id, Model m) {
		servicio.eliminaGolosina(id);
		List<Golosina> lista =  servicio.listaGolosina();
		m.addAttribute("golosinas", lista);
		return "crudGolosina";
	}

}
