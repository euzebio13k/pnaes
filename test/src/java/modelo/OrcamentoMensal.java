/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
public class OrcamentoMensal implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private Double renda;
    private Double rendaDeps;
    private Double outrasRendas;
    private Double moradia;
    private Double agua;
    private Double energia;
    private Double telefone;
    private Double farmacia;
    private Double outrasDespesas;
    @OneToOne
    @JoinColumn(name="aluno_id", unique=true)
    private Aluno aluno;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getMoradia() {
        return moradia;
    }

    public void setMoradia(Double moradia) {
        this.moradia = moradia;
    }

    public Double getAgua() {
        return agua;
    }

    public void setAgua(Double agua) {
        this.agua = agua;
    }

    public Double getEnergia() {
        return energia;
    }

    public void setEnergia(Double energia) {
        this.energia = energia;
    }

    public Double getTelefone() {
        return telefone;
    }

    public void setTelefone(Double telefone) {
        this.telefone = telefone;
    }

   

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Double getFarmacia() {
        return farmacia;
    }

    public void setFarmacia(Double farmacia) {
        this.farmacia = farmacia;
    }

    public Double getRenda() {
        return renda;
    }

    public void setRenda(Double renda) {
        this.renda = renda;
    }

    public Double getRendaDeps() {
        return rendaDeps;
    }

    public void setRendaDeps(Double rendaDeps) {
        this.rendaDeps = rendaDeps;
    }

    public Double getOutrasRendas() {
        return outrasRendas;
    }

    public void setOutrasRendas(Double outrasRendas) {
        this.outrasRendas = outrasRendas;
    }

    public Double getOutrasDespesas() {
        return outrasDespesas;
    }

    public void setOutrasDespesas(Double outrasDespesas) {
        this.outrasDespesas = outrasDespesas;
    }

   
    }

   

  
    
    
            
    

