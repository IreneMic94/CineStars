package it.generationitaly.cinestars.entity;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "artista")
public class Artista {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@OneToMany(mappedBy = "artista")
	private List<Filmografia> filmografia = new ArrayList<Filmografia>();
	
	@Column(name = "nome", length = 45, nullable = false)
	private String nome;
	
	@Column(name = "cognome", length = 45, nullable = false)
	private String cognome;
	
	@Column(name = "biografia", length = 3000,  nullable = false)
	private String biografia;
	
	@Column(name = "mansione", length = 45,  nullable = false)
	private String mansione;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "data_nascita", nullable = false)
	private Date dataNascita;
	
	@Column(name = "nazione", length = 45, nullable = false)
	private String nazione;
	
	@Column(name = "foto_piccola", length = 3000)
	private String fotoPiccola;
	
	@Column(name = "foto_media", length = 3000)
	private String fotoMedia;
	
	@Column(name = "foto_grande", length = 3000)
	private String fotoGrande;

	public List<Filmografia> getFilmografia() {
		return filmografia;
	}

	public void setFilmografia(List<Filmografia> filmografia) {
		this.filmografia = filmografia;
	}

	public String getFotoPiccola() {
		return fotoPiccola;
	}

	public void setFotoPiccola(String fotoPiccola) {
		this.fotoPiccola = fotoPiccola;
	}

	public String getFotoMedia() {
		return fotoMedia;
	}

	public void setFotoMedia(String fotoMedia) {
		this.fotoMedia = fotoMedia;
	}

	public String getFotoGrande() {
		return fotoGrande;
	}

	public void setFotoGrande(String fotoGrande) {
		this.fotoGrande = fotoGrande;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}

	public String getMansione() {
		return mansione;
	}

	public void setMansione(String mansione) {
		this.mansione = mansione;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getNazione() {
		return nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}

	
	
	
	
	
	
	
}
