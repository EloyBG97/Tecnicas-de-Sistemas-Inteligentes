(define (domain BELKAN)

(:types Robot Zona Personaje Objeto)

(:predicates

    ;;El Robot ?robot actualmente se encuentra en la Zona ?zona
    (ZonaActual ?robot - Robot ?zona - Zona)

    ;;El Robot ?robot está orientado hacia el Norte
    (OrientadoNorte ?robot - Robot)

    ;;El Robot ?robot está orientado hacia el Este
    (OrientadoEste ?robot - Robot)

    ;;El Robot ?robot está orientado hacia el Oeste
    (OrientadoOeste ?robot - Robot)

    ;;El Robot ?robot está orientado hacia el Sur
    (OrientadoSur ?robot - Robot)

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

    ;;El Robot ?robot no tiene ningún objeto en la mano
    (ManoVacia ?robot - Robot)

    ;;El Robot ?robot tiene el Objeto ?objeto
    (TieneObjeto2 ?robot - Robot ?objeto - Objeto)
)

;;El Robot ?robot gira a la Izquierda
(:action GirarIzquierda
    :parameters (?robot - Robot)
    :precondition (or 
            (OrientadoNorte ?robot)
            (OrientadoEste ?robot)
            (OrientadoOeste ?robot)
            (OrientadoSur ?robot)
    )
    :effect (and
       (when (OrientadoNorte ?robot) (and
            (OrientadoOeste ?robot)
            (not (OrientadoNorte ?robot))
            )
       )

       (when (OrientadoOeste ?robot) (and
            (OrientadoSur ?robot)
            (not (OrientadoOeste ?robot))
            )
       )

       (when (OrientadoSur ?robot) (and
            (OrientadoEste ?robot)
            (not (OrientadoSur ?robot))
            )
       ) 
       
       (when (OrientadoEste ?robot) (and
            (OrientadoNorte ?robot)
            (not (OrientadoEste ?robot))
            )
       )
    ) 
)

;;El Robot ?robot gira a la Derecha
(:action GirarDerecha
    :parameters (?robot - Robot)
    :precondition (or
            (OrientadoNorte ?robot)
            (OrientadoEste ?robot)
            (OrientadoOeste ?robot)
            (OrientadoSur ?robot)
    )

    :effect (and
       (when (OrientadoNorte ?robot) (and
            (OrientadoEste ?robot)
            (not (OrientadoNorte ?robot))
            )
       )

       (when (OrientadoOeste ?robot) (and
            (OrientadoNorte ?robot)
            (not (OrientadoOeste ?robot))
            )
       )

       (when (OrientadoSur ?robot) (and
            (OrientadoOeste ?robot)
            (not (OrientadoSur ?robot))
            )
       ) 
       
       (when (OrientadoEste ?robot) (and
            (OrientadoSur ?robot)
            (not (OrientadoEste ?robot))
            )
       )
    ) 
)

;;El Robot ?robot viaja desde la Zona ?zona1 (dónde se encuentra) hacia la Zona ?zona2
(:action IrZona
    :parameters (?robot - Robot ?zona1 - Zona ?zona2 - Zona)
    :precondition (and 
            (ZonaActual ?robot ?zona1)
            (or 
                (and (OrientadoNorte ?robot)
                    (AlNorteDe ?zona1 ?zona2)
                )

                (and (OrientadoEste ?robot)
                    (AlEsteDe ?zona1 ?zona2)
                )

                (and (OrientadoSur ?robot)
                    (AlSurDe ?zona1 ?zona2)
                )

                (and (OrientadoOeste ?robot)
                    (AlOesteDe ?zona1 ?zona2)
                )
        
            )
    )

    :effect (and 
            (ZonaActual ?robot ?zona2)
            (not (ZonaActual ?robot ?zona1))
    )
)

;;El Robot ?robot coge el Objeto ?objeto de la Zona ?zona dónde se encuentra
(:action CogerObjeto
    :parameters (?robot - Robot ?zona - Zona ?objeto - Objeto)
    :precondition (and 
            (ManoVacia ?robot)
            (DondeObjeto ?objeto ?zona)
            (ZonaActual ?robot ?zona)
    )
    :effect (and
       (not (ManoVacia ?robot))
       (not (DondeObjeto ?objeto ?zona))
       (TieneObjeto2 ?robot ?objeto)
    ) 
)

;;El Robot ?robot coge el Objeto ?objeto de la Zona ?zona dónde se encuentra
(:action DejarObjeto
    :parameters (?robot - Robot ?zona - Zona ?objeto - Objeto)
    :precondition (and 
            (not (ManoVacia ?robot))
            (TieneObjeto2 ?robot ?objeto)
            (ZonaActual ?robot ?zona)
    )
    :effect (and
       (ManoVacia ?robot)
       (DondeObjeto ?objeto ?zona)
       (not (TieneObjeto2 ?robot ?objeto))
    ) 
)

;;El Robot ?robot da el Objeto ?objeto  al Personaje ?personaje de la Zona ?zona dónde se encuentra
(:action DarObjeto
    :parameters (?robot - Robot ?zona - Zona ?objeto - Objeto ?personaje - Personaje)
    :precondition (and 
            (ZonaActual ?robot ?zona)
            (DondePersonaje ?personaje ?zona)
            (not (ManoVacia ?robot))
            (TieneObjeto2 ?robot ?objeto)
    )
    :effect (and
       (ManoVacia ?robot)
       (not (TieneObjeto2 ?robot ?objeto))
       (TieneObjeto1 ?personaje ?objeto)
    ) 
)

)