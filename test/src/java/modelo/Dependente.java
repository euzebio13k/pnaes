/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@PrimaryKeyJoinColumn(name="pessoa_id")
public class Dependente extends PessoaFisica{
    @ManyToOne
    @JoinColumn(name="aluno_id")
    private Aluno aluno;
    private String grauParentesco;
    @Column(precision=2)
    private String tipoDeficiente;

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

   
    public String getGrauParentesco() {
        return grauParentesco;
    }

    public void setGrauParentesco(String grauParentesco) {
        this.grauParentesco = grauParentesco;
    }

   

    public String getTipoDeficiente() {
        return tipoDeficiente;
    }

    public void setTipoDeficiente(String tipoDeficiente) {
        this.tipoDeficiente = tipoDeficiente;
    }
    
    
    
}
