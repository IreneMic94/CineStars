package it.generationitaly.cinestars.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "filmografia")
public class Filmografia {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@ManyToOne
	@JoinColumn(name = "id_artista", nullable = false)
	private Artista artista;

	@ManyToOne
	@JoinColumn(name = "id_pellicola", nullable = false)
	private Pellicola pellicola;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Artista getArtista() {
		return artista;
	}

	public void setArtista(Artista artista) {
		this.artista = artista;
	}

	public Pellicola getPellicola() {
		return pellicola;
	}

	public void setPellicola(Pellicola pellicola) {
		this.pellicola = pellicola;
	}

}
