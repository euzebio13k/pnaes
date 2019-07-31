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
public class Empresa extends PessoaJuridica{
    
    private String responsavel;
    @ManyToOne
    @JoinColumn(name="aluno_id")
    private Aluno aluno;

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }
    
    
    
}
