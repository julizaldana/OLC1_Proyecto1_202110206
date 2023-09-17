package AnalizadorStatpy;
import java_cup.runtime.*;

%%

%{
    String cadena="";
%}

//Directivas
%class LexicoStatpy
%cupsym sym
%cup 
%public
%unicode
%line 
%state CADENA
%column
%ignorecase

//simbolos

PAR_A = "("
PAR_C = ")"
LLAV_A = "{"
LLAV_C = "}"
COMA = ","
PYCOMA = ";"
ASIGNA = "="
PUNTO = "."

//palabras reservadas

INT1  = "int"
CHAR1 = "char"
DOUBLE1 = "double"
BOOL1 = "bool"
STRING1 = "string"
VOI = "void"
CONSOLE = "console"
WRITE = "write"
MAIN = "main"

//operadores aritmeticos
SUMA = "+"
RESTA = "-"
MULT = "*"
DIV = "/"

//operadores relacionales
MAYOR = ">"
MENOR = "<"
MAYOR_I = ">="
MENOR_I = "<="
IGUAL = "=="
DIST = "!="


//operadores logicos
AND = "&&"
OR = "||"
NOT = "!"


//expresiones regulares

ENTERO = [0-9]+
DOUBLE = [0-9]+.[0-9]
ID = [A-Za-zñÑ][_0-9A-Za-zñÑ]*
blancos = [ \t\r\n\f]+
comentario=("//".*\n)|("//".*\r)
comentario2=("/" "*"[^\*]* "*""/")

%%

<YYINITIAL> {INT1}      { return new Symbol(sym.INT1, yyline, yycolumn,"entero");}
<YYINITIAL> {CHAR1}     { return new Symbol(sym.CHAR1, yyline, yycolumn,"caracter");}
<YYINITIAL> {DOUBLE1}   { return new Symbol(sym.DOUBLE1, yyline, yycolumn,"double");}
<YYINITIAL> {BOOL1}     { return new Symbol(sym.BOOL1, yyline, yycolumn,"booleano");}
<YYINITIAL> {STRING1}     { return new Symbol(sym.STRING1, yyline, yycolumn,"string");}
<YYINITIAL> {VOI}       { return new Symbol(sym.VOI, yyline, yycolumn,yytext());}
<YYINITIAL> {MAIN}      { return new Symbol(sym.MAIN, yyline, yycolumn,yytext());}
<YYINITIAL> {CONSOLE}    { return new Symbol(sym.CONSOLE, yyline, yycolumn,yytext());}
<YYINITIAL> {WRITE}      { return new Symbol(sym.WRITE, yyline, yycolumn,yytext());}

<YYINITIAL> {SUMA}      { return new Symbol(sym.SUMA, yyline, yycolumn,yytext());}
<YYINITIAL> {RESTA}      { return new Symbol(sym.RESTA, yyline, yycolumn,yytext());}
<YYINITIAL> {MULT}      { return new Symbol(sym.MULT, yyline, yycolumn,yytext());}
<YYINITIAL> {DIV}      { return new Symbol(sym.DIV, yyline, yycolumn,yytext());}

<YYINITIAL> {MAYOR}      { return new Symbol(sym.MAYOR, yyline, yycolumn,yytext());}
<YYINITIAL> {MENOR}      { return new Symbol(sym.MENOR, yyline, yycolumn,yytext());}
<YYINITIAL> {MAYOR_I}      { return new Symbol(sym.MAYOR_I, yyline, yycolumn,yytext());}
<YYINITIAL> {MENOR_I}      { return new Symbol(sym.MENOR_I, yyline, yycolumn,yytext());}
<YYINITIAL> {IGUAL}      { return new Symbol(sym.IGUAL , yyline, yycolumn,yytext());}
<YYINITIAL> {DIST}      { return new Symbol(sym.DIST, yyline, yycolumn,yytext());}

<YYINITIAL> {AND}      { return new Symbol(sym.AND, yyline, yycolumn,yytext());}
<YYINITIAL> {OR}      { return new Symbol(sym.OR, yyline, yycolumn,yytext());}
<YYINITIAL> {NOT}      { return new Symbol(sym.NOT, yyline, yycolumn,yytext());}


<YYINITIAL> {PAR_A}     {return new Symbol(sym.PAR_A, yyline, yycolumn,yytext());}
<YYINITIAL> {PAR_C}     {return new Symbol(sym.PAR_C, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_A}    {return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAV_C}    {return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());}
<YYINITIAL> {COMA}      {return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
<YYINITIAL> {PYCOMA}    {return new Symbol(sym.PYCOMA, yyline, yycolumn,yytext());}
<YYINITIAL> {ASIGNA}    {return new Symbol(sym.ASIGNA, yyline, yycolumn,yytext());}
<YYINITIAL> {PUNTO}    {return new Symbol(sym.PUNTO, yyline, yycolumn,yytext());}

<YYINITIAL> {ENTERO}    { return new Symbol(sym.ENTERO, yyline, yycolumn,yytext());}
<YYINITIAL> {DOUBLE}    { return new Symbol(sym.DOUBLE, yyline, yycolumn,yytext());}
<YYINITIAL> {ID}        {return new Symbol(sym.ID, yyline, yycolumn,yytext());}

<YYINITIAL> [\"] { yybegin(CADENA) ; cadena+="\"";   }

<YYINITIAL>{blancos} {}
<YYINITIAL> {comentario} {System.out.println("Comentario: "+yytext()); }
<YYINITIAL> {comentario2} {System.out.println("Comentario: "+yytext()); }

<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);
}
<CADENA> {

                     [\"] { String tmp = cadena+"\""; cadena=""; yybegin(YYINITIAL);  return new Symbol(sym.CADENA, yychar,yyline,tmp);   }
                     [\n] {
                        String tmp = cadena; cadena="";
                      System.out.println("se esperaba un cierre de cadena (\") ");
                      yybegin(YYINITIAL);
                }
                    [^\"] { cadena+= yytext();}
}