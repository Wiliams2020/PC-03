package com.redsocial.servicio;

import java.util.List;

import com.redsocial.entidad.Golosina;

public interface GolosinaServicio {
	
	public Golosina insertaActualizaGolosina(Golosina obj);
	public void eliminaGolosina(int idGolosina);
	public List<Golosina> listaGolosina();
	public List<Golosina> listaGolosinaPorNombre(String nom);
	public List<Golosina> listaGolosina(int idPais, String nombre);

}
