/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AnalizadorJson;

import java.util.Hashtable;

/**
 *
 * @author juliz
 */
public class JsonHashTable {
    private static Hashtable<String, String> jsonHash;

    // Static initializer to create and populate the hash table
    static {
        jsonHash = new Hashtable<>();
        // You can populate the hash table with default values if needed
        jsonHash.put("defaultKey", "defaultValue");
    }

    // Public methods to access and modify the hash table

    public static void add(String clave, String valor) {
        jsonHash.put(clave, valor);
    }

    public static String get(String clave) {
        return jsonHash.get(clave);
    }

    public static Hashtable<String, String> getJsonHash() {
        return jsonHash;
    }
}
