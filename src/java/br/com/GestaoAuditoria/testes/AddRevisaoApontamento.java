/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.GestaoAuditoria.testes;

/**
 *
 * @author rafaelsilva
 */

import br.com.GestaoAuditoria.models.Apontamento;
import br.com.GestaoAuditoria.dao.Dao;

public class AddRevisaoApontamento {
    
    public static void main (String args []){
        
        Apontamento objeto = new Apontamento();
        Dao dao = new Dao();
        
        objeto.setDescricaoApontamento("ACESSO INDEVIDO");
        objeto.setStatusRevisao("APROVADO");
        objeto.setDescricaoRevisao("APONTAMENTO REVISADO COM SUCESSO!");
        objeto.setNomeAuditor("RENATA SOUZA SILVA");
        dao.revisaoApontamento(objeto);
        
    }
    
}
