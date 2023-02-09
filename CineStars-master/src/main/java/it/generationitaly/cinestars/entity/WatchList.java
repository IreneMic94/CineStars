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
@Table(name = "watchlist")
public class WatchList {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;

	@ManyToOne
	@JoinColumn(name = "id_utente", nullable = false)
	private Utente utente;

	@ManyToOne
	@JoinColumn(name = "id_pellicola", nullable = false)
	private Pellicola pellicola;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public Pellicola getPellicola() {
		return pellicola;
	}

	public void setPellicola(Pellicola pellicola) {
		this.pellicola = pellicola;
	}

}
