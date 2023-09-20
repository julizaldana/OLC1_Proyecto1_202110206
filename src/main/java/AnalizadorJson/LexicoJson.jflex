package AnalizadorJson;
import ReportesHtml.ReporteError;
import ReportesHtml.ReporteToken;
import java_cup.runtime.*;

%%

%{
    String cadena="";

%}

//Directivas
%class LexicoJson
%cupsym sym
%cup 
%public
%unicode
%line 
%state CADENA
%column
%ignorecase


//simbolos

COMILLA = "\""
LLAV_A = "{"
LLAV_C = "}"
COMA = ","
DOSPTS = ":"


//palabras reservadas


//expresiones regulares

DOUBLE = [0-9]+.[0-9]
STRING = \"[^\"]*\" 
blancos = [ \t\r\n\f]+
comentario=("//".*\n)|("//".*\r)
comentario2=("/" "*"[^\*]* "*""/")

%%

{COMILLA}     { System.out.println("Reconocio "+yytext()+" comilla" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteToken token = new ReporteToken (yytext()," comilla ",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                        return new Symbol(sym.COMILLA, yyline, yycolumn,yytext());
              }
{LLAV_A}    { System.out.println("Reconocio "+yytext()+" llave que abre" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," llave que abre ",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                        return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());
            }
{LLAV_C}    { System.out.println("Reconocio "+yytext()+" llave que cierra" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," llave que cierra",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                        return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());
            }
{COMA}      { System.out.println("Reconocio "+yytext()+" coma" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," coma",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);    
                        return new Symbol(sym.COMA, yyline, yycolumn,yytext());
            }
{DOSPTS}     { System.out.println("Reconocio "+yytext()+" dos puntos" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," dos puntos",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                        return new Symbol(sym.DOSPTS, yyline, yycolumn,yytext());
                }

{STRING}  { System.out.println("Reconocio "+yytext()+" cadena" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," cadena",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                        return new Symbol(sym.STRING, yyline, yycolumn,yytext());
            }
{DOUBLE}  { System.out.println("Reconocio "+yytext()+" double" + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," double",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                        return new Symbol(sym.DOUBLE, yyline, yycolumn,yytext()); 
            }


{blancos} {}
{comentario} {System.out.println("Comentario: "+yytext() + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext(),"comentario una linea ",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                }
{comentario2} {System.out.println("Comentario: "+yytext()+ " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1)); 
                        ReporteToken token = new ReporteToken (yytext()," comentario multilinea ",yyline+1,yycolumn+1);
                        ReporteToken.tokenList.add(token);
                }


. {
        
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);

        String lexema = yytext(); // Lexema es yytext()
        String descripcion = "Error léxico";
        int linea = yyline + 1;
        int columna = yycolumn + 1;

        ReporteError error = new ReporteError(lexema, descripcion, linea, columna);
        // Se añade a la lista de errores
        ReporteError.errorList.add(error);
        


}


