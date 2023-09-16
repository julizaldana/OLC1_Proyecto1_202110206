/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AnalizadorJson;

/**
 *
 * @author juliz
 */
public class AnalizadorJson {
    
    /**
     * @param args the command line arguments
     */
   public static void main(String[] args) {
        // TODO code application logic here
        generarCompilador();
    }
    private static void generarCompilador() 
    {
        try {
            String ruta = "src/main/java/AnalizadorJson/";
            String opcFlex[] = {ruta + "LexicoJson.jflex", "-d", ruta};
            jflex.Main.generate(opcFlex);
            
            
            String opcCUP[] = {"-destdir", ruta, "-parser", "SintacticoJson", ruta + "SintacticoJson.cup"};
            java_cup.Main.main(opcCUP);
        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }
    
}
