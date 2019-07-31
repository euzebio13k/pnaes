/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Entrevista;
import modelo.Inscricao;

/**
 *
 * @author euzebio
 */
public class EntrevistaDao extends DaoGenerico{
    public EntrevistaDao(){
        super(Entrevista.class);
    }
    public List<Entrevista> perquisarPorDataCurso(String pData, String pCurso){
        String jpql = "select e from Entrevista e where e.dataEntrevista like '%"+pData+"%' and e.inscricao.aluno.turno like '%"+pCurso+"%'";
        Query query = em.createQuery(jpql, Entrevista.class);
        
        return query.getResultList();
    }
    public List<Entrevista> perquisarPorBolsaCategoria(Integer categoriaId, Integer bolsaId) 
    {
        String jpql;
        if(categoriaId == 0){
            jpql = "select e from Entrevista e where e.inscricao.bolsa1.id = "+bolsaId;            
        }else if(bolsaId ==0){
            jpql = "select e from Entrevista e where e.inscricao.aluno.curso.categoria.id = "+categoriaId;
        }else{
            jpql = "select e from Entrevista e where e.inscricao.aluno.curso.categoria.id = "+categoriaId+" and i.bolsa1.id = "+bolsaId;        
        }
        Query query = em.createQuery(jpql, Inscricao.class);        
        return query.getResultList();
    }
}
