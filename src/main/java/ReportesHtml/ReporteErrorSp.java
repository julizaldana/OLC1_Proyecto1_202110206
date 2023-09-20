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
public class ReporteErrorSp {
    public String lexema;
    public String descripcion;
    public int linea;
    public int columna; 
    
  public ReporteErrorSp(String lexema, String descripcion, int linea, int columna) {
        this.lexema = lexema;
        this.descripcion = descripcion;
        this.linea = linea;
        this.columna = columna;
    } 
  
    // Se define la lista de errorList para ir almacenando errores PARA STATPY
    public static ArrayList<ReporteErrorSp> errorListSP = new ArrayList<>();
  
    // Getters para cada uno de los parámetros de los reportes.
    public String getLexema() {
        return lexema;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getLinea() {
        return linea;
    }

    public int getColumna() {
        return columna;
    }  
  
}
