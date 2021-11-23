/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author t2s-user-cod218
 */
public class Base {
    private static ArrayList<Contato> contatosList;
    public static ArrayList<Contato> getContatosList(){
        if(contatosList == null){
            contatosList = new ArrayList<>();
            contatosList.add(new Contato("Fulano", "(13) 99111-1771", new Data(11,10,1991)));
            contatosList.add(new Contato("Ciclano", "(13) 99333-1772", new Data(12,11,1992)));
            contatosList.add(new Contato("Beltrano", "(13) 99222-1773", new Data(13,12,1993)));
        }
        return contatosList;
    }
}
