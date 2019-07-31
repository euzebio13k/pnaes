/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.GregorianCalendar;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@PrimaryKeyJoinColumn(name="pessoa_id")
public class PessoaFisica extends Pessoa {

    @Column(unique = true, nullable = true)
    private String cpf;
    private String rg;
    @ManyToOne
    @JoinColumn(name="ufExpedicao_id")
    private Uf ufExpedicao;
    private String sexo;
    private GregorianCalendar dtn;
    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Uf getUfExpedicao() {
        return ufExpedicao;
    }

    public void setUfExpedicao(Uf ufExpedicao) {
        this.ufExpedicao = ufExpedicao;
    }

    public GregorianCalendar getDtn() {
        return dtn;
    }

    public void setDtn(GregorianCalendar dtn) {
        this.dtn = dtn;
    }
    

  
    
    
    
}
