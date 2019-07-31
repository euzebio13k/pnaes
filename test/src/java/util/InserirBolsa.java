/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.DaoFactory;
import java.util.List;
import modelo.Bolsa;
import modelo.Dependente;
import modelo.Empresa;
import modelo.FichaMedica;
import modelo.Inscricao;
import modelo.OrcamentoMensal;

/**
 *
 * @author ronan
 */
public class InserirBolsa {
    
    
    public static void main(String[] args) {
    
        Bolsa bolsa = new Bolsa();
        DaoFactory daoFactory = new DaoFactory();
    
        bolsa.setNome("Alimentação");
        bolsa.setValor(180.00);
        daoFactory.getBolsaDao().inserirOuAlterar(bolsa);
           
       
   /*
      DaoFactory daoFactory = new DaoFactory();
       Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(1);
       List<Dependente> dependentes = daoFactory.getDependenteDao().perquisarPorAluno(2);
       FichaMedica fichaMedica = daoFactory.getFichaMedicaDao().pesquisarPorId(2);
       //Empresa empresa = new DaoFactory().getEmpresaDao().perquisarPorAluno(2).get(0);
       OrcamentoMensal orcamentoMensal = new DaoFactory().getOrcamentoMensalDao().perquisarPorAluno(2).get(0);
      // System.out.println("nome = "+dependente.getNome()); 
       System.out.println("tam = "+dependentes.size()); 
       System.out.println("doenca = "+fichaMedica.getDoencaCronica());
       System.out.println("id = "+inscricao.getAluno().getId()); 
       System.out.println("agua = "+orcamentoMensal.getAgua()); 
       
       
       for(Dependente d: dependentes){
           System.out.println("nome = "+d.getNome());
       }   */
    }
    
}