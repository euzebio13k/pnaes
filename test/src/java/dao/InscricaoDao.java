/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Cidade;
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
    
}
