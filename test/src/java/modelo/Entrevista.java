/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
public class Entrevista implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private GregorianCalendar dataEntrevista;
    private String local;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="inscricao_id",unique = true)
    private Inscricao inscricao;
    private String observacao;
    private String resultado;
      @OneToOne
   @JoinColumn(nullable = false,name="status_id",updatable = false)
    private StatusEntrevista se;
    
    public Integer getId() {
        return id;
    }

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }

    
    
    public void setId(Integer id) {
        this.id = id;
    }

    public GregorianCalendar getDataEntrevista() {
        return dataEntrevista;
    }

    public void setDataEntrevista(GregorianCalendar dataEntrevista) {
        this.dataEntrevista = dataEntrevista;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
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

    public StatusEntrevista getSe() {
        return se;
    }

    public void setSe(StatusEntrevista se) {
        this.se = se;
    }

    
    

   
    
    
    
}
