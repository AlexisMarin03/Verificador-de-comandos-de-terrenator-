%{
void yyerror(char *s);
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
%}

%union {
    int ival;
    float fval;
}

%token STATE
%token ACCELERATE
%token BRAKE
%token BACKWARD
%token LEFT
%token RIGHT
%token TURN_LATERAL_SIDE
%token TURN_FRONTAL
%token JUMP
%token HORN
%token <ival> INT
%token <fval> FLOAT

%%

commands:
    | commands command
    ;

command:
    estado
    |
    acelerar
    |   
    frenar
    |     
    iratras
    |    
    izquierda
    |  
    derecha
    |    
    girolateral
    |
    girofrontal
    |
    saltar
    |     
    bocina     
    ;
;
    estado:
        STATE
        {
             int i;
            printf("Cambiando estado");
            fflush(stdout);
            for (i = 0; i < 3; ++i) {
                usleep(500000); printf("."); fflush(stdout);
            }
            usleep(500000); printf(" Listo.\n");
        }
    ;

    acelerar:
        ACCELERATE FLOAT
        {
             int i;
            if ($2 >= 0.0 && $2 <= 10.0) {
                printf("Acelerando a %.2f", $2);
                fflush(stdout);
                for (i = 0; i < 3; ++i) {
                    usleep(500000); printf("."); fflush(stdout);
                }
                usleep(500000); printf(" Listo.\n");
            } else {
                printf("Error: Valor fuera de rango para acelerar.\n");
                YYERROR;
            }
        }
    ;

    frenar:
        BRAKE FLOAT
        {
             int i;
            if ($2 >= 0.0 && $2 <= 10.0) {
                printf("Frenando a %.2f", $2);
                fflush(stdout);
                for (i = 0; i < 3; ++i) {
                    usleep(500000); printf("."); fflush(stdout);
                }
                usleep(500000); printf(" Listo.\n");
            } else {
                printf("Error: Valor fuera de rango para frenar.\n");
                YYERROR;
            }
        }
    ;

    iratras:
        BACKWARD
        {
             int i;
            printf("Retrocediendo");
            fflush(stdout);
            for (i = 0; i < 3; ++i) {
                usleep(500000); printf("."); fflush(stdout);
            }
            usleep(500000); printf(" Listo.\n");
        }
    ;

    izquierda:
        LEFT FLOAT
        {
             int i;
            if ($2 >= 0.0 && $2 <= 360.0) {
                printf("Girando a la izquierda %.2f grados", $2);
                fflush(stdout);
                for (i = 0; i < 3; ++i) {
                    usleep(500000); printf("."); fflush(stdout);
                }
                usleep(500000); printf(" Listo.\n");
            } else {
                printf("Error: Valor fuera de rango para girar a la izquierda.\n");
                YYERROR;
            }
        }
    ;

    derecha:
        RIGHT FLOAT
        {
             int i;
            if ($2 >= 0.0 && $2 <= 360.0) {
                printf("Girando a la derecha %.2f grados", $2);
                fflush(stdout);
                for (i = 0; i < 3; ++i) {
                    usleep(500000); printf("."); fflush(stdout);
                }
                usleep(500000); printf(" Listo.\n");
            } else {
                printf("Error: Valor fuera de rango para girar a la derecha.\n");
                YYERROR;
            }
        }
    ;
    
    girolateral:
        TURN_LATERAL_SIDE
        {
             int i;
            printf("Girando hacia el lado lateral");
            fflush(stdout);
            for (i = 0; i < 3; ++i) {
                usleep(500000); printf("."); fflush(stdout);
            }
            usleep(500000); printf(" Listo.\n");
        }   
    ;

    girofrontal:
        TURN_FRONTAL
        {
             int i;
            printf("Girando hacia el lado frontal");
            fflush(stdout);
            for (i = 0; i < 3; ++i) {
                usleep(500000); printf("."); fflush(stdout);
            }
            usleep(500000); printf(" Listo.\n");
        }
    ;

    saltar:
        JUMP
        {
             int i;
            printf("Saltando");
            fflush(stdout);
            for (i = 0; i < 3; ++i) {
                usleep(500000); printf("."); fflush(stdout);
            }
            usleep(500000); printf(" Listo.\n");
        }
    ;

    bocina:
        HORN INT
        {
             int i;
            if ($2 >= 1 && $2 <= 5) {
                printf("Tocando la bocina %d veces", $2);
                fflush(stdout);
                for (i = 0; i < 3; ++i) {
                    usleep(500000); printf("."); fflush(stdout);
                }
                usleep(500000); printf(" Listo.\n");
            } else {
                printf("Error: Valor fuera de rango para tocar la bocina.\n");
                YYERROR;
            }
        }
    ;
%%

int main()
{
   
    yyparse();
    return 0;
}
void yyerror (char *s)
{
    printf("-%s at %s !\n",s );
}

