/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ReportesHtml;

import java.util.ArrayList;

/**
 *
 * @author juliz
 */
public class ReporteToken {
    public String lexema;
    public String token;
    public int linea;
    public int columna; 
    
  public ReporteToken(String lexema, String token, int linea, int columna) {
        this.lexema = lexema;
        this.token = token;
        this.linea = linea;
        this.columna = columna;
    } 
  
    // Lista para ir almacenanod tokens de archivo Json
    public static ArrayList<ReporteToken> tokenList = new ArrayList<>();
  
    // Getters para cada uno de los parámetros de la tabla de tokens
    public String getLexema() {
        return lexema;
    }

    public String getToken() {
        return token;
    }

    public int getLinea() {
        return linea;
    }

    public int getColumna() {
        return columna;
    }  
}
