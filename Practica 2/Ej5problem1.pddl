(define (problem Belkan1)

(:domain BELKANV5)

(:objects
    P1 P2 P3 P4 P5 - Personaje
    O1 O2 O3 O4 O5 O6 O7 - Objeto
    Z1 Z2 Z3 Z4 Z5 - Zona
    Z6 Z7 Z8 Z9 Z10 - Zona
    Z11 Z12 Z13 Z14 Z15 - Zona
    Z16 Z17 Z18 Z19 Z20 - Zona
    Z21 Z22 Z23 Z24 Z25 - Zona
)

(:init

    ;;Al Norte de Z_{i} está Z_{j}
    (AlNorteDe Z21 Z16)
    (AlNorteDe Z16 Z11)
    (AlNorteDe Z11 Z6)
    (AlNorteDe Z6 Z1)
    (AlNorteDe Z22 Z17)
    (AlNorteDe Z17 Z12)
    (AlNorteDe Z12 Z7)
    (AlNorteDe Z7 Z2)
    (AlNorteDe Z23 Z18)
    (AlNorteDe Z18 Z13)
    (AlNorteDe Z13 Z8)
    (AlNorteDe Z8 Z3)
    (AlNorteDe Z24 Z19)
    (AlNorteDe Z19 Z14)
    (AlNorteDe Z14 Z9)
    (AlNorteDe Z9 Z4)
    (AlNorteDe Z25 Z20)
    (AlNorteDe Z20 Z15)
    (AlNorteDe Z15 Z10)
    (AlNorteDe Z10 Z5)

    ;;Al Este de Z_{i} está Z_{j}
    (AlEsteDe Z1 Z2)
    (AlEsteDe Z2 Z3)
    (AlEsteDe Z3 Z4)
    (AlEsteDe Z4 Z5)
    (AlEsteDe Z6 Z7)
    (AlEsteDe Z7 Z8)
    (AlEsteDe Z8 Z9)
    (AlEsteDe Z9 Z10)
    (AlEsteDe Z11 Z12)
    (AlEsteDe Z12 Z13)
    (AlEsteDe Z13 Z14)
    (AlEsteDe Z14 Z15)
    (AlEsteDe Z16 Z17)
    (AlEsteDe Z17 Z18)
    (AlEsteDe Z18 Z19)
    (AlEsteDe Z19 Z20)
    (AlEsteDe Z21 Z22)
    (AlEsteDe Z22 Z23)
    (AlEsteDe Z23 Z24)
    (AlEsteDe Z24 Z25)

    ;;Al Sur de Z_{i} está Z_{j}
    (AlSurDe Z1 Z6)
    (AlSurDe Z6 Z11)
    (AlSurDe Z11 Z16)
    (AlSurDe Z16 Z21)
    (AlSurDe Z2 Z7)
    (AlSurDe Z7 Z12)
    (AlSurDe Z12 Z17)
    (AlSurDe Z17 Z22)
    (AlSurDe Z3 Z8)
    (AlSurDe Z8 Z13)
    (AlSurDe Z13 Z18)
    (AlSurDe Z18 Z23)
    (AlSurDe Z4 Z9)
    (AlSurDe Z9 Z14)
    (AlSurDe Z14 Z19)
    (AlSurDe Z19 Z24)
    (AlSurDe Z5 Z10)
    (AlSurDe Z10 Z15)
    (AlSurDe Z15 Z20)
    (AlSurDe Z20 Z25)

    ;;Al Oeste de Z_{i} está Z_{j}
    (AlOesteDe Z5 Z4)
    (AlOesteDe Z4 Z3)
    (AlOesteDe Z3 Z2)
    (AlOesteDe Z2 Z1)
    (AlOesteDe Z10 Z9)
    (AlOesteDe Z9 Z8)
    (AlOesteDe Z8 Z7)
    (AlOesteDe Z7 Z6)
    (AlOesteDe Z15 Z14)
    (AlOesteDe Z14 Z13)
    (AlOesteDe Z13 Z12)
    (AlOesteDe Z12 Z11)
    (AlOesteDe Z20 Z19)
    (AlOesteDe Z19 Z18)
    (AlOesteDe Z18 Z17)
    (AlOesteDe Z17 Z16)
    (AlOesteDe Z25 Z24)
    (AlOesteDe Z24 Z23)
    (AlOesteDe Z23 Z22)
    (AlOesteDe Z22 Z21)

    

    ;;Situacion de los Precipicios
    (Precipicio Z16)


    ;;Situacion de los Agua
    (Agua Z12)


    ;;Situacion de los Arena
    (Arena Z17)
    (Arena Z18)
    (Arena Z19)
    (Arena Z13)
    (Arena Z14)

    ;;Situacion de los Bosque
    (Bosque Z20)

    ;;Situacion de los Piedra
    (Piedra Z10)
    (Piedra Z15)
    (Piedra Z7)
    (Piedra Z8)
    (Piedra Z9)
    (Piedra Z1)
    (Piedra Z2)
    (Piedra Z3)
    (Piedra Z4)
    (Piedra Z5)
    (Piedra Z6)
    (Piedra Z11)
    (Piedra Z21)
    (Piedra Z22)
    (Piedra Z23)
    (Piedra Z24)
    (Piedra Z25)
    
    
    ;;Situacion de los personajes
    (DondePersonaje P1 Z9)
    (DondePersonaje P2 Z10)
    (DondePersonaje P3 Z19)
    (DondePersonaje P4 Z7)
    (DondePersonaje P5 Z12)
    
    ;;Situacion de los objetos
    (DondeObjeto O1 Z9)
    (DondeObjeto O2 Z10)
    (DondeObjeto O3 Z19)
    (DondeObjeto O4 Z7)
    (DondeObjeto O5 Z13)

    (DondeObjeto O6 Z20)
    (EsBikini O6)

    (DondeObjeto O7 Z6)
    (EsZapatilla O7)

    ;;Situacion y Orientacion del Robot
    (ZonaActual Z10)
    (OrientadoSur)

    (ManoVacia)
    (MochilaVacia)

    (= (distancia-zonas Z1 Z2) 1)
    (= (distancia-zonas Z2 Z1) 1)
    (= (distancia-zonas Z2 Z3) 1)
    (= (distancia-zonas Z3 Z2) 1)
    (= (distancia-zonas Z3 Z4) 1)
    (= (distancia-zonas Z4 Z3) 1)
    (= (distancia-zonas Z4 Z5) 1)
    (= (distancia-zonas Z5 Z4) 1)

    (= (distancia-zonas Z6 Z7) 1)
    (= (distancia-zonas Z7 Z6) 1)
    (= (distancia-zonas Z7 Z8) 1)
    (= (distancia-zonas Z8 Z7) 1)
    (= (distancia-zonas Z8 Z9) 1)
    (= (distancia-zonas Z9 Z8) 1)
    (= (distancia-zonas Z9 Z10) 1)
    (= (distancia-zonas Z10 Z9) 1)

    (= (distancia-zonas Z11 Z12) 1)
    (= (distancia-zonas Z12 Z11) 1)
    (= (distancia-zonas Z12 Z13) 1)
    (= (distancia-zonas Z13 Z12) 1)
    (= (distancia-zonas Z13 Z14) 1)
    (= (distancia-zonas Z14 Z13) 1)
    (= (distancia-zonas Z14 Z15) 1)
    (= (distancia-zonas Z15 Z14) 1)

    (= (distancia-zonas Z16 Z17) 1)
    (= (distancia-zonas Z17 Z16) 1)
    (= (distancia-zonas Z17 Z18) 1)
    (= (distancia-zonas Z18 Z17) 1)
    (= (distancia-zonas Z18 Z19) 1)
    (= (distancia-zonas Z19 Z18) 1)
    (= (distancia-zonas Z19 Z20) 1)
    (= (distancia-zonas Z20 Z19) 1)

    (= (distancia-zonas Z21 Z22) 1)
    (= (distancia-zonas Z22 Z21) 1)
    (= (distancia-zonas Z22 Z23) 1)
    (= (distancia-zonas Z23 Z22) 1)
    (= (distancia-zonas Z23 Z24) 1)
    (= (distancia-zonas Z24 Z23) 1)
    (= (distancia-zonas Z24 Z25) 1)
    (= (distancia-zonas Z25 Z24) 1)

    (= (distancia-zonas Z1 Z6) 1)
    (= (distancia-zonas Z6 Z1) 1)
    (= (distancia-zonas Z6 Z11) 1)
    (= (distancia-zonas Z11 Z6) 1)
    (= (distancia-zonas Z11 Z16) 1)
    (= (distancia-zonas Z16 Z11) 1)
    (= (distancia-zonas Z16 Z21) 1)
    (= (distancia-zonas Z21 Z16) 1)

    (= (distancia-zonas Z2 Z7) 1)
    (= (distancia-zonas Z7 Z2) 1)
    (= (distancia-zonas Z7 Z12) 1)
    (= (distancia-zonas Z12 Z7) 1)
    (= (distancia-zonas Z12 Z17) 1)
    (= (distancia-zonas Z17 Z12) 1)
    (= (distancia-zonas Z17 Z22) 1)
    (= (distancia-zonas Z22 Z17) 1)

    (= (distancia-zonas Z3 Z8) 1)
    (= (distancia-zonas Z8 Z3) 1)
    (= (distancia-zonas Z8 Z13) 1)
    (= (distancia-zonas Z13 Z8) 1)
    (= (distancia-zonas Z13 Z18) 1)
    (= (distancia-zonas Z18 Z13) 1)
    (= (distancia-zonas Z18 Z23) 1)
    (= (distancia-zonas Z23 Z18) 1)

    (= (distancia-zonas Z4 Z9) 1)
    (= (distancia-zonas Z9 Z4) 1)
    (= (distancia-zonas Z9 Z14) 1)
    (= (distancia-zonas Z14 Z9) 1)
    (= (distancia-zonas Z14 Z19) 1)
    (= (distancia-zonas Z19 Z14) 1)
    (= (distancia-zonas Z19 Z24) 1)
    (= (distancia-zonas Z24 Z19) 1)

    (= (distancia-zonas Z5 Z10) 1)
    (= (distancia-zonas Z10 Z5) 1)
    (= (distancia-zonas Z10 Z15) 1)
    (= (distancia-zonas Z15 Z10) 1)
    (= (distancia-zonas Z15 Z20) 1)
    (= (distancia-zonas Z20 Z15) 1)
    (= (distancia-zonas Z20 Z25) 1)
    (= (distancia-zonas Z25 Z20) 1)

    (= (distancia-total) 0)

    (= (puntuacion O1 P1) 10)
    (= (puntuacion O1 P2) 5)
    (= (puntuacion O1 P3) 4)
    (= (puntuacion O1 P4) 3)
    (= (puntuacion O1 P5) 1)
    
    (= (puntuacion O2 P1) 1)
    (= (puntuacion O2 P2) 10)
    (= (puntuacion O2 P3) 5)
    (= (puntuacion O2 P4) 4)
    (= (puntuacion O2 P5) 3)

    (= (puntuacion O3 P1) 3)
    (= (puntuacion O3 P2) 1)
    (= (puntuacion O3 P3) 10)
    (= (puntuacion O3 P4) 5)
    (= (puntuacion O3 P5) 4)

    (= (puntuacion O4 P1) 4)
    (= (puntuacion O4 P2) 3)
    (= (puntuacion O4 P3) 1)
    (= (puntuacion O4 P4) 10)
    (= (puntuacion O4 P5) 5)

    (= (puntuacion O5 P1) 5)
    (= (puntuacion O5 P2) 4)
    (= (puntuacion O5 P3) 3)
    (= (puntuacion O5 P4) 1)
    (= (puntuacion O5 P5) 10)

    (= (puntuacion-total) 0)

    (= (nObjetosBolsillo) 0)
    (= (maxObjetosBolsillo) 5)
)

(:goal
    (and
        (< (distancia-total) 15)
        (= (puntuacion-total) 50)

    )
)

)
