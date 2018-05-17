(define (problem Belkan1)

(:domain BELKANV1)

(:objects
    dicaprio bruja principe profesor princesa - Personaje
    oscar manzanas oro algoritmo rosas - Objeto
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
    
    ;;Situacion de los personajes
    (DondePersonaje dicaprio Z9)
    (DondePersonaje bruja Z1)
    (DondePersonaje principe Z25)
    (DondePersonaje profesor Z21)
    (DondePersonaje princesa Z17)
    
    ;;Situacion de los objetos
    (DondeObjeto oscar Z16)
    (DondeObjeto manzanas Z23)
    (DondeObjeto oro Z2)
    (DondeObjeto algoritmo Z13)
    (DondeObjeto rosas Z10)

    ;;Situacion y Orientacion del Robot
    (ZonaActual  Z4)
    (OrientadoSur )

    (ManoVacia )
)

(:goal
    (and
        (TieneObjeto1 dicaprio oscar)
        (TieneObjeto1 bruja manzanas)
        (TieneObjeto1 principe oro)
        (TieneObjeto1 profesor algoritmo)
        (TieneObjeto1 princesa rosas)
    )
)

)