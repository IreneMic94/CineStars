package it.generationitaly.cinestars.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "pellicola")
public class Pellicola {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "nome", length = 45, nullable = false)
	private String nome;

	@Column(name = "descrizione", length = 3000, nullable = false)
	private String descrizione;

	@Column(name = "tipologia", length = 45, nullable = false)
	private String tipologia;

	@Column(name = "anno", nullable = false)
	private int anno;

	@Column(name = "paese", length = 45, nullable = false)
	private String paese;

	@Column(name = "durata", nullable = false)
	private int durata;

	@Column(name = "distribuzione", length = 45, nullable = false)
	private String distribuzione;

	@Column(name = "foto_locandina", length = 3000, nullable = false)
	private String fotoLocandina;

	@Column(name = "foto_carosello", length = 3000)
	private String fotoCarosello;
	
	@Column(name = "trailer", length = 3000)
	private String trailer;



	@Column(name = "voto", nullable = false)
	private int voto;

	@Column(name = "voto_utenti")
	private int votoUtenti;

	@ManyToOne
	@JoinColumn(name = "id_genere", nullable = false)
	private Genere genere;

	@OneToMany(mappedBy = "pellicola")
	private List<Filmografia> filmografia = new ArrayList<Filmografia>();

	@OneToMany(mappedBy = "pellicola", fetch = FetchType.EAGER)
	private List<Recensione> recensioni = new ArrayList<Recensione>();

	public List<Recensione> getRecensioni() {
		return recensioni;
	}

	public void setRecensioni(List<Recensione> recensioni) {
		this.recensioni = recensioni;
	}

	public String getDistribuzione() {
		return distribuzione;
	}

	public void setDistribuzione(String distribuzione) {
		this.distribuzione = distribuzione;
	}

	public List<Filmografia> getFilmografia() {
		return filmografia;
	}

	public void setFilmografia(List<Filmografia> filmografia) {
		this.filmografia = filmografia;
	}

	public String getFotoCarosello() {
		return fotoCarosello;
	}

	public void setFotoCarosello(String fotoCarosello) {
		this.fotoCarosello = fotoCarosello;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	public int getAnno() {
		return anno;
	}

	public void setAnno(int anno) {
		this.anno = anno;
	}

	public String getPaese() {
		return paese;
	}

	public void setPaese(String paese) {
		this.paese = paese;
	}

	public int getDurata() {
		return durata;
	}

	public void setDurata(int durata) {
		this.durata = durata;
	}

	public String getFotoLocandina() {
		return fotoLocandina;
	}

	public void setFotoLocandina(String fotoLocandina) {
		this.fotoLocandina = fotoLocandina;
	}

	public int getVoto() {
		return voto;
	}

	public void setVoto(int voto) {
		this.voto = voto;
	}

	public Genere getGenere() {
		return genere;
	}

	public void setGenere(Genere genere) {
		this.genere = genere;
	}

	public int getVotoUtenti() {
		return votoUtenti;
	}

	public void setVotoUtenti(int votoUtenti) {
		this.votoUtenti = votoUtenti;
	}

	@Override
	public String toString() {
		return "Pellicola [id=" + id + ", nome=" + nome + ", descrizione=" + descrizione + ", tipologia=" + tipologia
				+ ", anno=" + anno + ", paese=" + paese + ", durata=" + durata + ", distribuzione=" + distribuzione
				+ ", fotoLocandina=" + fotoLocandina + ", voto=" + voto + ", genere=" + genere + "]";
	}

}
