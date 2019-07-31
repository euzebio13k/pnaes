/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author ronan
 */
@Entity
public class Inscricao implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private GregorianCalendar dataInscricao;
    @ManyToOne
    @JoinColumn(name="aluno_id",unique = true)
    private Aluno aluno;
    @ManyToOne
    @JoinColumn(name="bolsaAnterior_id")
    private Bolsa bolsaAnterior;
    @ManyToOne
    @JoinColumn(name="bolsa1_id")
    private Bolsa bolsa1;
    @ManyToOne
    @JoinColumn(name="bolsa2_id")
    private Bolsa bolsa2;
    private String ano;
    private String reprovou;
    private Integer quantas;
    private String graduacao;
    private String observacao;
    private String resultado;
    private String documentosFaltantes;
    @ManyToOne
    @JoinColumn(name="edital_id",nullable = false)
    private Edital edital;
    //@Column(columnDefinition="varchar(10) default 'Pendente'")
    //private String status;
    @OneToOne(mappedBy = "inscricao", cascade = CascadeType.ALL)
   
   private StatusEntrevista statusEntrevista;
   
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public GregorianCalendar getDataInscricao() {
        return dataInscricao;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public String getDocumentosFaltantes() {
        return documentosFaltantes;
    }

    public void setDocumentosFaltantes(String documentosFaltantes) {
        this.documentosFaltantes = documentosFaltantes;
    }

    public void setDataInscricao(GregorianCalendar dataInscricao) {
        this.dataInscricao = dataInscricao;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Bolsa getBolsaAnterior() {
        return bolsaAnterior;
    }

    public void setBolsaAnterior(Bolsa bolsaAnterior) {
        this.bolsaAnterior = bolsaAnterior;
    }

    public Bolsa getBolsa1() {
        return bolsa1;
    }

    public void setBolsa1(Bolsa bolsa1) {
        this.bolsa1 = bolsa1;
    }

    public Bolsa getBolsa2() {
        return bolsa2;
    }

    public void setBolsa2(Bolsa bolsa2) {
        this.bolsa2 = bolsa2;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getReprovou() {
        return reprovou;
    }

    public void setReprovou(String reprovou) {
        this.reprovou = reprovou;
    }

    public Integer getQuantas() {
        return quantas;
    }

    public void setQuantas(Integer quantas) {
        this.quantas = quantas;
    }

    public Edital getEdital() {
        return edital;
    }

    public void setEdital(Edital edital) {
        this.edital = edital;
    }

    public String getGraduacao() {
        return graduacao;
    }

    public void setGraduacao(String graduacao) {
        this.graduacao = graduacao;
    }

    public StatusEntrevista getStatusEntrevista() {
        return statusEntrevista;
    }

    public void setStatusEntrevista(StatusEntrevista statusEntrevista) {
        this.statusEntrevista = statusEntrevista;
    }

    

   

   
    
    
    
    
}
