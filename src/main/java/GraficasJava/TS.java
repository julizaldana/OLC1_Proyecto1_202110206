

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GraficasJava;
import java.util.Hashtable;
import AnalizadorJson.JsonHashTable;
/**
 *
 * @author juliz
 */
public class TS {
        private Hashtable<String, String> tabla;
        private JsonHashTable jsonInstance; // Create an instance of RegistroJson

        
        public TS() {
            tabla = new Hashtable<>();
            jsonInstance = new JsonHashTable(); // Initialize the RegistroJson instance

        }
        public void add(String clave, String valor) {
            tabla.put(clave, valor);
 
        }
        public String get(String clave) {
             return tabla.get(clave);
        }
        
        public void addJson(String clave, String valor) {
        // Use the jsonInstance to add key-value pairs to RegistroJson's jsonHash
                jsonInstance.add(clave, valor);
        }
    
        public String getFromJson(String clave) {
            // Use the jsonInstance to get values from RegistroJson's jsonHash
            return jsonInstance.get(clave);
        }
        
}
