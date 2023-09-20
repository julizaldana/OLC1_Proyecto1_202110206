package AnalizadorStatpy;
import java_cup.runtime.*;
import ReportesHtml.ReporteTokenSp;
import ReportesHtml.ReporteErrorSp;

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
DOSP = ":"

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
IF = "if"
ELSEIF = "else if"
SWITCH = "switch"
CASE = "case"
BREAK = "break"
DEFAULT = "default" 
FOR = "for"
WHILE = "while"
DO = "do"


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

//caracteres
COMILLA_S = "'"

//expresiones regulares

ENTERO = [0-9]+
DOUBLE = [0-9]+.[0-9]
DECIMAL = [0-9]+.[0-9]+
ID = [A-Za-zñÑ][_0-9A-Za-zñÑ]*
blancos = [ \t\r\n\f]+
comentario=("//".*\n)|("//".*\r)
comentario2=("/" "*"[^\*]* "*""/")

%%

<YYINITIAL> {INT1}      { System.out.println("Reconocio "+yytext()+" INT_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," INT_Reservada ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.INT1, yyline, yycolumn,"entero");}

<YYINITIAL> {CHAR1}     { System.out.println("Reconocio "+yytext()+" CHAR_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," CHAR_Reservada ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.CHAR1, yyline, yycolumn,"caracter");}

<YYINITIAL> {DOUBLE1}   { System.out.println("Reconocio "+yytext()+" DOUBLE_Rersevada " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," DOUBLE_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DOUBLE1, yyline, yycolumn,"double");}

<YYINITIAL> {BOOL1}     { System.out.println("Reconocio "+yytext()+" BOOL_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," BOOL_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.BOOL1, yyline, yycolumn,"booleano");}

<YYINITIAL> {STRING1}     { System.out.println("Reconocio "+yytext()+" STRING_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," STRING_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.STRING1, yyline, yycolumn,"string");}

<YYINITIAL> {VOI}       { System.out.println("Reconocio "+yytext()+" VOID_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," VOID_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.VOI, yyline, yycolumn,yytext());}

<YYINITIAL> {MAIN}      { System.out.println("Reconocio "+yytext()+" MAIN_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," MAIN_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.MAIN, yyline, yycolumn,yytext());}

<YYINITIAL> {CONSOLE}    { System.out.println("Reconocio "+yytext()+" CONSOLE_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," CONSOLE_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.CONSOLE, yyline, yycolumn,yytext());}

<YYINITIAL> {WRITE}      { System.out.println("Reconocio "+yytext()+" WRITE_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," WRITE_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.WRITE, yyline, yycolumn,yytext());}

<YYINITIAL> {SUMA}      {System.out.println("Reconocio "+yytext()+" OP_SUMA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_SUMA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.SUMA, yyline, yycolumn,yytext());}

<YYINITIAL> {RESTA}      { System.out.println("Reconocio "+yytext()+" OP_RESTA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_RESTA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.RESTA, yyline, yycolumn,yytext());}

<YYINITIAL> {MULT}      { System.out.println("Reconocio "+yytext()+" OP_MULT " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_MULTIPLICACION ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.MULT, yyline, yycolumn,yytext());}

<YYINITIAL> {DIV}      { System.out.println("Reconocio "+yytext()+" OP_DIV " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_DIVISION ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DIV, yyline, yycolumn,yytext());}

<YYINITIAL> {MAYOR}      { System.out.println("Reconocio "+yytext()+" OP_MAYOR " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_MAYOR ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.MAYOR, yyline, yycolumn,yytext());}

<YYINITIAL> {MENOR}      { System.out.println("Reconocio "+yytext()+" OP_MENOR " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_MENOR ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.MENOR, yyline, yycolumn,yytext());}

<YYINITIAL> {MAYOR_I}      { System.out.println("Reconocio "+yytext()+" OP_MAYOR_IGUAL " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_MAYOR_IGUAL ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.MAYOR_I, yyline, yycolumn,yytext());}

<YYINITIAL> {MENOR_I}      { System.out.println("Reconocio "+yytext()+" OP_MENOR_IGUAL " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_MENOR_IGUAL ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.MENOR_I, yyline, yycolumn,yytext());}

<YYINITIAL> {IGUAL}      { System.out.println("Reconocio "+yytext()+" OP_IGUAL " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_IGUAL ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.IGUAL , yyline, yycolumn,yytext());}

<YYINITIAL> {DIST}      { System.out.println("Reconocio "+yytext()+" OP_DISTINTO " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_DISTINTO ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DIST, yyline, yycolumn,yytext());}

<YYINITIAL> {AND}      { System.out.println("Reconocio "+yytext()+" OP_AND " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_AND ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.AND, yyline, yycolumn,yytext());}

<YYINITIAL> {OR}      { System.out.println("Reconocio "+yytext()+" OP_OR " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_OR ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.OR, yyline, yycolumn,yytext());}
<YYINITIAL> {NOT}      {  System.out.println("Reconocio "+yytext()+" OP_NOT " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_NOT ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.NOT, yyline, yycolumn,yytext());}


<YYINITIAL> {IF}      { System.out.println("Reconocio "+yytext()+" IF_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," IF_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.IF, yyline, yycolumn,yytext());}

<YYINITIAL> {ELSEIF}      { System.out.println("Reconocio "+yytext()+" ELSEIF_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," ELSEIF_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.ELSEIF, yyline, yycolumn,yytext());}

<YYINITIAL> {SWITCH}      { System.out.println("Reconocio "+yytext()+" SWITCH_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," SWITCH_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.SWITCH, yyline, yycolumn,yytext());}

<YYINITIAL> {CASE}      { System.out.println("Reconocio "+yytext()+" CASE_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," CASE_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.CASE, yyline, yycolumn,yytext());}

<YYINITIAL> {BREAK}      { System.out.println("Reconocio "+yytext()+" BREAK_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," BREAK_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.BREAK, yyline, yycolumn,yytext());}

<YYINITIAL> {DEFAULT}      { System.out.println("Reconocio "+yytext()+" DEFAULT_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," DEFAULT_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DEFAULT, yyline, yycolumn,yytext());}

<YYINITIAL> {FOR}      { System.out.println("Reconocio "+yytext()+" FOR_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," FOR_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.FOR, yyline, yycolumn,yytext());}

<YYINITIAL> {WHILE}      { System.out.println("Reconocio "+yytext()+" WHILE_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," WHILE_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.WHILE, yyline, yycolumn,yytext());}

<YYINITIAL> {DO}      { System.out.println("Reconocio "+yytext()+" DO_R " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," DO_R ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DO, yyline, yycolumn,yytext());}


<YYINITIAL> {PAR_A}     {System.out.println("Reconocio "+yytext()+" PAR_ABRE " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext(),"  PAR_ABRE ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.PAR_A, yyline, yycolumn,yytext());}

<YYINITIAL> {PAR_C}     {System.out.println("Reconocio "+yytext()+" PAR_CIERRA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," PAR_CIERRA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.PAR_C, yyline, yycolumn,yytext());}

<YYINITIAL> {LLAV_A}    {System.out.println("Reconocio "+yytext()+" LLAV_ABRE " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," LLAV_ABRE ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.LLAV_A, yyline, yycolumn,yytext());}

<YYINITIAL> {LLAV_C}    {System.out.println("Reconocio "+yytext()+" LLAV_CIERRA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," LLAV_CIERRA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.LLAV_C, yyline, yycolumn,yytext());}

<YYINITIAL> {COMA}      { System.out.println("Reconocio "+yytext()+" COMA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," COMA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.COMA, yyline, yycolumn,yytext());}

<YYINITIAL> {PYCOMA}    {System.out.println("Reconocio "+yytext()+" PYCOMA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," PYCOMA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.PYCOMA, yyline, yycolumn,yytext());}

<YYINITIAL> {ASIGNA}    {System.out.println("Reconocio "+yytext()+" OP_ASIGNACION " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," OP_ASIGNACION ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.ASIGNA, yyline, yycolumn,yytext());}

<YYINITIAL> {PUNTO}    {System.out.println("Reconocio "+yytext()+" SIMBOLO_PUNTO " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," SIMBOLO_PUNTO ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.PUNTO, yyline, yycolumn,yytext());}

<YYINITIAL> {DOSP}    {System.out.println("Reconocio "+yytext()+" SIMBOLO_DOS_PUNTOS " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," SIMBOLO_DOS_PUNTOS ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DOSP, yyline, yycolumn,yytext());}

<YYINITIAL> {ENTERO}    { System.out.println("Reconocio "+yytext()+" ENTERO " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," ENTERO ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.ENTERO, yyline, yycolumn,yytext());}

<YYINITIAL> {DOUBLE}    { System.out.println("Reconocio "+yytext()+" DOUBLE " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," DOUBLE ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DOUBLE, yyline, yycolumn,yytext());}

<YYINITIAL> {DECIMAL}    { System.out.println("Reconocio "+yytext()+" DECIMAL " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," DECIMAL ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.DECIMAL, yyline, yycolumn,yytext());}

<YYINITIAL> {ID}        {System.out.println("Reconocio "+yytext()+" IDENTIFICADOR " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," IDENTIFICADOR ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.ID, yyline, yycolumn,yytext());}

<YYINITIAL> {COMILLA_S}    { System.out.println("Reconocio "+yytext()+" COMILLA_SIMPLE " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," COMILLA_SIMPLE ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.COMILLA_S, yyline, yycolumn,yytext());}

<YYINITIAL> [\"] { yybegin(CADENA) ; cadena+="\"";   }

<YYINITIAL>{blancos} {}
<YYINITIAL> {comentario} { System.out.println("Reconocio "+yytext()+" COMENTARIO_SIMPLE " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," COMENTARIO_SIMPLE ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.comentario, yyline, yycolumn,yytext());}
<YYINITIAL> {comentario2} { System.out.println("Reconocio "+yytext()+" COMENTARIO_MULTILINEA " + " en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1) );  
                        ReporteTokenSp token = new ReporteTokenSp (yytext()," COMENTARIO_MULTILINEA ",yyline+1,yycolumn+1);
                        ReporteTokenSp.tokenListSP.add(token);
                        return new Symbol(sym.comentario2, yyline, yycolumn,yytext());}

<YYINITIAL> . {
        String errLex = "Error léxico : '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+(yycolumn+1);
        System.out.println(errLex);

        String lexema = yytext(); // Lexema es yytext()
        String descripcion = "Error léxico";
        int linea = yyline + 1;
        int columna = yycolumn + 1;

        ReporteErrorSp error = new ReporteErrorSp(lexema, descripcion, linea, columna);
        // Se añade a la lista de errores
        ReporteErrorSp.errorListSP.add(error);

}





<CADENA> {

                     [\"] { String tmp = cadena+"\""; cadena=""; yybegin(YYINITIAL);                             
                            return new Symbol(sym.CADENA, yychar,yyline,tmp);   }
                     [\n] {
                        String tmp = cadena; cadena="";
                      System.out.println("se esperaba un cierre de cadena (\") ");
                      yybegin(YYINITIAL);
                }
                    [^\"] { cadena+= yytext();}
}