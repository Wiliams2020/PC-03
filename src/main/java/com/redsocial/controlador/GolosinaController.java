package com.redsocial.controlador;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.redsocial.entidad.Golosina;
import com.redsocial.entidad.Pais;
import com.redsocial.servicio.GolosinaServicio;
import com.redsocial.servicio.PaisServicio;

@Controller
public class GolosinaController {
	
	@Autowired
	private GolosinaServicio golosinaServicio;
	
	@Autowired
	private PaisServicio paisServicio;
	
	@RequestMapping("/verGolosina")
	public String ver() {
		return "registraGolosina";
	}
	
	@RequestMapping("/cargaPais")
	@ResponseBody
	public List<Pais> listaPais() {
		return paisServicio.listaPais();
	}
	
	@RequestMapping("/registraGolosina")
	public String metRegistra(Golosina obj,HttpSession session) {
		Golosina aux = golosinaServicio.insertaActualizaGolosina(obj);
		if(aux == null) {
			session.setAttribute("MENSAJE", "Registro erróneo");
		}else {
			session.setAttribute("MENSAJE", "Registro exitos");
		}
		return "redirect:verGolosina";
	}
	

}
