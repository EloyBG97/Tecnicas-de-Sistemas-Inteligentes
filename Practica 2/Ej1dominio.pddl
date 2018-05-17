(define (domain BELKANV1)

(:types Zona Personaje Objeto)

(:predicates

    ;;El Robot  actualmente se encuentra en la Zona ?zona
    (ZonaActual  ?zona - Zona)

    ;;El Robot  está orientado hacia el Norte
    (OrientadoNorte )

    ;;El Robot  está orientado hacia el Este
    (OrientadoEste )

    ;;El Robot  está orientado hacia el Oeste
    (OrientadoOeste )

    ;;El Robot  está orientado hacia el Sur
    (OrientadoSur )

    ;;El Personaje ?personaje está en la Zona ?zona
    (DondePersonaje ?personaje - Personaje ?zona - Zona)

    ;;La Zona ?zona1 está al Norte de la Zona ?zona2
    (AlNorteDe ?zona1 - Zona ?zona2 - Zona)

    ;;La Zona ?zona1 está al Este de la Zona ?zona2
    (AlEsteDe ?zona1 - Zona ?zona2 - Zona)

    ;;La Zona ?zona1 está al Sur de la Zona ?zona2
    (AlSurDe ?zona1 - Zona ?zona2 - Zona)

    ;;La Zona ?zona1 está al Oeste de la Zona ?zona2
    (AlOesteDe ?zona1 - Zona ?zona2 - Zona)

    ;;El Objeto ?objeto está en la Zona ?zona
    (DondeObjeto ?objeto - Objeto ?zona - Zona)

    ;;El Personaje ?personaje tiene el Objeto ?objeto
    (TieneObjeto1 ?personaje - Personaje ?objeto - Objeto)

    ;;El Robot  no tiene ningún objeto en la mano
    (ManoVacia )


    ;;El Robot  tiene el Objeto ?objeto
    (TieneObjeto2  ?objeto - Objeto)


)
¡

;;El Robot  gira a la Izquierda
(:action GirarIzquierda
    :parameters ()
    :precondition (or 
            (OrientadoNorte )
            (OrientadoEste )
            (OrientadoOeste )
            (OrientadoSur )
    )
    :effect (and
       (when (OrientadoNorte ) (and
            (OrientadoOeste )
            (not (OrientadoNorte ))
            )
       )

       (when (OrientadoOeste ) (and
            (OrientadoSur )
            (not (OrientadoOeste ))
            )
       )

       (when (OrientadoSur ) (and
            (OrientadoEste )
            (not (OrientadoSur ))
            )
       ) 
       
       (when (OrientadoEste ) (and
            (OrientadoNorte )
            (not (OrientadoEste ))
            )
       )
    ) 
)

;;El Robot  gira a la Derecha
(:action GirarDerecha
    :parameters ()
    :precondition (or
            (OrientadoNorte )
            (OrientadoEste )
            (OrientadoOeste )
            (OrientadoSur )
    )

    :effect (and
       (when (OrientadoNorte ) (and
            (OrientadoEste )
            (not (OrientadoNorte ))
            )
       )

       (when (OrientadoOeste ) (and
            (OrientadoNorte )
            (not (OrientadoOeste ))
            )
       )

       (when (OrientadoSur ) (and
            (OrientadoOeste )
            (not (OrientadoSur ))
            )
       ) 
       
       (when (OrientadoEste ) (and
            (OrientadoSur )
            (not (OrientadoEste ))
            )
       )
    ) 
)

;;El Robot  viaja desde la Zona ?zona1 (dónde se encuentra) hacia la Zona ?zona2
(:action IrZona
    :parameters ( ?zona1 - Zona ?zona2 - Zona)
    :precondition (and 
            (ZonaActual  ?zona1)
                        
            (or 
                (and (OrientadoNorte )
                    (AlNorteDe ?zona1 ?zona2)
                )

                (and (OrientadoEste )
                    (AlEsteDe ?zona1 ?zona2)
                )

                (and (OrientadoSur )
                    (AlSurDe ?zona1 ?zona2)
                )

                (and (OrientadoOeste )
                    (AlOesteDe ?zona1 ?zona2)
                )
        
            )
    )

    :effect (and 
            (ZonaActual  ?zona2)
            (not (ZonaActual  ?zona1))
    )
)

;;El Robot  coge el Objeto ?objeto de la Zona ?zona dónde se encuentra
(:action CogerObjeto
    :parameters ( ?zona - Zona ?objeto - Objeto)
    :precondition (and 
            (ManoVacia )
            (DondeObjeto ?objeto ?zona)
            (ZonaActual  ?zona)
    )
    :effect (and
       (not (ManoVacia ))
       (not (DondeObjeto ?objeto ?zona))
       (TieneObjeto2  ?objeto)
    ) 
)

;;El Robot  coge el Objeto ?objeto de la Zona ?zona dónde se encuentra
(:action DejarObjeto
    :parameters ( ?zona - Zona ?objeto - Objeto)
    :precondition (and 
            (not (ManoVacia ))
            (TieneObjeto2  ?objeto)
            (ZonaActual  ?zona)
    )
    :effect (and
       (ManoVacia )
       (DondeObjeto ?objeto ?zona)
       (not (TieneObjeto2  ?objeto))
    ) 
)

;;El Robot  da el Objeto ?objeto  al Personaje ?personaje de la Zona ?zona dónde se encuentra
(:action DarObjeto
    :parameters ( ?zona - Zona ?objeto - Objeto ?personaje - Personaje)
    :precondition (and 
            (ZonaActual  ?zona)
            (DondePersonaje ?personaje ?zona)
            (not (ManoVacia ))
            (TieneObjeto2  ?objeto)
    )
    :effect (and
        (ManoVacia )
        (not (TieneObjeto2  ?objeto))
        (TieneObjeto1 ?personaje ?objeto)
    ) 
)



)
