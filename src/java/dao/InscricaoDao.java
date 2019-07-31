/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Inscricao;

/**
 *
 * @author euzebio
 */
public class InscricaoDao extends DaoGenerico{
    
    public InscricaoDao(){
        super(Inscricao.class);
    }
    public List<Inscricao> perquisarPorBolsa(Integer bolsaId) 
    {
        String jpql = "select i from Inscricao i where i.bolsa1.id = "+bolsaId;
        Query query = em.createQuery(jpql, Inscricao.class);
        return query.getResultList();
    }
    public List<Inscricao> perquisarPorCategoria(Integer categoriaId) 
    {
        String jpql = "select i from Inscricao i where i.aluno.curso.categoria.id = "+categoriaId;
        Query query = em.createQuery(jpql, Inscricao.class);
        return query.getResultList();
    }
    public List<Inscricao> perquisarPorBolsaCategoria(Integer categoriaId, Integer bolsaId) 
    {
        String jpql;
        if(categoriaId == 0){
            jpql = "select i from Inscricao i where i.bolsa1.id = "+bolsaId;            
        }else if(bolsaId ==0){
            jpql = "select i from Inscricao i where i.aluno.curso.categoria.id = "+categoriaId;
        }else{
            jpql = "select i from Inscricao i where i.aluno.curso.categoria.id = "+categoriaId+" and i.bolsa1.id = "+bolsaId;        
        }
        Query query = em.createQuery(jpql, Inscricao.class);        
        return query.getResultList();
    }
}
