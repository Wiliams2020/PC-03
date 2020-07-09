package com.redsocial.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.redsocial.entidad.Golosina;
import com.redsocial.repositorio.GolosinaRepositorio;

@Service
public class GolosinaServicioImpl implements GolosinaServicio {
	
	@Autowired
	private GolosinaRepositorio repositorio;

	@Override
	public Golosina insertaActualizaGolosina(Golosina obj) {
		return repositorio.save(obj);
	}

	@Override
	public void eliminaGolosina(int idGolosina) {
		repositorio.deleteById(idGolosina);
		
	}

	@Override
	public List<Golosina> listaGolosina() {
		return repositorio.findAll();
	}

	@Override
	public List<Golosina> listaGolosinaPorNombre(String nom) {
		return repositorio.buscaPorNombre(nom);
	}

	@Override
	public List<Golosina> listaGolosina(int idPais, String nombre) {
		return repositorio.listaGolosina(idPais, nombre);
	}

}
