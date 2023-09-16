package AnalizadorJson;
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
{COMILLA}     { System.out.println("Reconocio "+yytext()+" comilla"); return new Symbol(sym.COMILLA, yyline, yycolumn,yytext());}
{LLAV_A}    { System.out.println("Reconocio "+yytext()+" llave que abre"); return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());}
{LLAV_C}    { System.out.println("Reconocio "+yytext()+" llave que cierra"); return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());}
{COMA}      { System.out.println("Reconocio "+yytext()+" coma"); return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
{DOSPTS}     { System.out.println("Reconocio "+yytext()+" dos puntos"); return new Symbol(sym.DOSPTS, yyline, yycolumn,yytext());}

{STRING}  { System.out.println("Reconocio "+yytext()+" cadena"); return new Symbol(sym.STRING, yyline, yycolumn,yytext());}
{DOUBLE}  { System.out.println("Reconocio "+yytext()+" double"); return new Symbol(sym.DOUBLE, yyline, yycolumn,yytext());}


{blancos} {}
{comentario} {System.out.println("Comentario: "+yytext()); }
{comentario2} {System.out.println("Comentario: "+yytext()); }


. {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
}


