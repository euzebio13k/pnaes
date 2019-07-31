package modelo;

import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@PrimaryKeyJoinColumn(name="pessoa_id")
public class Aluno extends PessoaFisica{
    
    @Column(unique = true)
    private String matricula;
    private String senha;
    private Integer nivel;
    private String disciplina;
    private String ensinoMedio;
    private String ensinoFundamental;
    private String entradaIfto;
    private String periodoVisita;
    private String meioTransporte;
    private String curso;
    private String periodo;
   
    
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

   
    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

   
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Integer getNivel() {
        return nivel;
    }

    public void setNivel(Integer nivel) {
        this.nivel = nivel;
    }

   

    public String getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public String getEnsinoMedio() {
        return ensinoMedio;
    }

    public void setEnsinoMedio(String ensinoMedio) {
        this.ensinoMedio = ensinoMedio;
    }

    public String getEnsinoFundamental() {
        return ensinoFundamental;
    }

    public void setEnsinoFundamental(String ensinoFundamental) {
        this.ensinoFundamental = ensinoFundamental;
    }

    

    public String getPeriodoVisita() {
        return periodoVisita;
    }

    public void setPeriodoVisita(String periodoVisita) {
        this.periodoVisita = periodoVisita;
    }

    public String getMeioTransporte() {
        return meioTransporte;
    }

    public void setMeioTransporte(String meioTransporte) {
        this.meioTransporte = meioTransporte;
    }

   

    public String getEntradaIfto() {
        return entradaIfto;
    }

    public void setEntradaIfto(String entradaIfto) {
        this.entradaIfto = entradaIfto;
    }

  

    
    
       
}