/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AnalizadorStatpy;

/**
 *
 * @author juliz
 */
public class AnalizadorStatpy {
    
    /**
     * @param args the command line arguments
     */
   public static void main(String[] args) {
        // TODO code application logic here
        generarCompiladorStatpy();
    }
    private static void generarCompiladorStatpy() 
    {
        try {
            String ruta = "src/main/java/AnalizadorStatpy/";
            String opcFlex[] = {ruta + "LexicoStatpy.jflex", "-d", ruta};
            jflex.Main.generate(opcFlex);
            
            
            String opcCUP[] = {"-destdir", ruta, "-parser", "SintacticoStatpy", ruta + "SintacticoStatpy.cup"};
            java_cup.Main.main(opcCUP);
        } catch (Exception e) {
            e.printStackTrace();
            
        }
    }
    
    
    
    
}
