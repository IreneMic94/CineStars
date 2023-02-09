package it.generationitaly.cinestars.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

//CREATE TABLE recensione(
//id INT PRIMARY KEY AUTO_INCREMENT,
//descrizione VARCHAR(3000) NOT NULL,
//voto INT NOT NULL,
//id_utente INT UNIQUE NOT NULL REFERENCES utente(id),
//id_pellicola INT UNIQUE NOT NULL REFERENCES pellicola(id)
//);

@Entity
@Table(name = "recensione")
public class Recensione {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "descrizione", length = 3000, nullable = false)
	private String descrizione;

	@Column(name = "voto", nullable = false)
	private int voto;

	@ManyToOne
	@JoinColumn(name = "id_utente", nullable = false)
	private Utente utente;

	@ManyToOne
	@JoinColumn(name = "id_pellicola", nullable = false)
	private Pellicola pellicola;

	@Column(name = "data_recensione", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date dataRecensione;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getVoto() {
		return voto;
	}

	public void setVoto(int voto) {
		this.voto = voto;
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

	public Date getDataRecensione() {
		return dataRecensione;
	}

	public void setDataRecensione(Date dataRecensione) {
		this.dataRecensione = dataRecensione;
	}

}
