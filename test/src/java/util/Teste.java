/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.DaoFactory;
import java.util.ArrayList;
import java.util.List;
import modelo.Aluno;
import modelo.Dependente;

/**
 *
 * @author ronan
 */
public class Teste {
    
    public static void main(String args[]){
       
        DataFormat dataFormat = new DataFormat();
        DaoFactory daoFactory = new DaoFactory();        
            
         Aluno a = daoFactory.getAlunoDao().pesquisarPorId(1);
            System.out.println("nome = "+a.getNome());
            System.out.println("dtn = "+dataFormat.formatarData(a.getDtn()));
  
    }
    
}
