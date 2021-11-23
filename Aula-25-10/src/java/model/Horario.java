/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author t2s-user-cod218
 */
public class Horario {
    private int hora;
    private int minutos;
    private int segundos;

    public Horario(){
        hora = 00;
        minutos = 00;
        segundos = 00;
    }
    
    public Horario(int hora, int minutos, int segundos) {
        this.setHorario(hora, minutos, segundos);
    }   
    
    public String horarioAtual(){
        String timeStamp = new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime());
        return timeStamp;
    }
    
    public String getHorario(){
        String horario = "";
        if(hora<10) horario +="0";
        horario += hora +":";
        if(minutos<10) horario +="0";
        horario += minutos+":";
        if(segundos<10) horario +="0";
        horario += segundos;
        return horario;
    }
    
    public void setHorario(int hora, int minutos, int segundos){
        this.setHora(hora);      
        this.setMinutos(minutos);
        this.setSegundos(segundos); 
    }

    public int getSegundos() {
        return segundos;
    }

    public void setSegundos(int segundos) {
        this.segundos = segundos;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public int getMinutos() {
        return minutos;
    }

    public void setMinutos(int minutos) {
        this.minutos = minutos;
    }
    
}
