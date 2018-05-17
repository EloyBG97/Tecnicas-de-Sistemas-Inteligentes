(define (domain BELKANV7)

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

    ;;El Robot ?robot no tiene ningún objeto en la mano
    (MochilaVacia ?robot - Robot)

    ;;El Robot ?robot tiene el Objeto ?objeto
    (TieneObjeto2 ?robot - Robot ?objeto - Objeto)

    ;;El Robot ?robot tiene el Objeto ?objeto en la mochila
    (TieneObjeto3 ?robot - Robot ?objeto - Objeto)

    (RobotRepartidorRobots ?robot - Robot)
    (RobotRepartidorPersonajes ?robot - Robot)

    (Bosque ?zona - Zona)
    (Agua ?zona - Zona)
    (Precipicio ?zona - Zona)
    (Arena ?zona - Zona)
    (Piedra ?zona - Zona)

    (EsZapatilla ?objeto - Objeto)
    (EsBikini ?objeto - Objeto)
    (TengoZapatilla ?robot - Robot)
    (TengoBikini ?robot - Robot)

    (ObjetoBolsillo ?robot - Robot ?objeto - Objeto)
)

(:functions
    (distancia-total ?robot - Robot)
    (distancia-zonas ?z1 - Zona ?z2 - Zona)

    (puntuacion-total ?robot - Robot)
    (puntuacion ?o1 - Objeto ?p1 - Personaje)

    (nObjetosBolsillo ?robot - Robot)
    (maxObjetosBolsillo)
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
            (not (Precipicio ?zona2))
            (or
                (and (Bosque ?zona2) (TengoZapatilla ?robot))
                (and (Agua ?zona2) (TengoBikini ?robot))
                (Arena ?zona2)
                (Piedra ?zona2)
            )
            
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
            (increase (distancia-total ?robot) (distancia-zonas ?zona1 ?zona2))
    )
)

;;El Robot ?robot coge el Objeto ?objeto de la Zona ?zona dónde se encuentra
(:action CogerObjeto
    :parameters (?robot - Robot ?zona - Zona ?objeto - Objeto)
    :precondition (and 
            (RobotRepartidorRobots ?robot)
            (ManoVacia ?robot)
            (DondeObjeto ?objeto ?zona)
            (ZonaActual ?robot ?zona)
    )
    :effect (and
        (when (EsZapatilla ?objeto) (TengoZapatilla ?robot))
        (when (EsBikini ?objeto) (TengoBikini ?robot))
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
        (when (EsZapatilla ?objeto) (not (TengoZapatilla ?robot)))
        (when (EsBikini ?objeto)  (not (TengoBikini ?robot)))
       (ManoVacia ?robot)
       (DondeObjeto ?objeto ?zona)
       (not (TieneObjeto2 ?robot ?objeto))
    ) 
)

;;El Robot ?robot da el Objeto ?objeto  al Personaje ?personaje de la Zona ?zona dónde se encuentra
(:action DarObjetoPersonaje
    :parameters (?robot - Robot ?zona - Zona ?objeto - Objeto ?personaje - Personaje)
    :precondition (and
            (RobotRepartidorPersonajes ?robot)
            (ZonaActual ?robot ?zona)
            (DondePersonaje ?personaje ?zona)
            (not (ManoVacia ?robot))
            (TieneObjeto2 ?robot ?objeto)
    )
    :effect (and
        (when (EsZapatilla ?objeto) (not (TengoZapatilla ?robot)))
        (when (EsBikini ?objeto)  (not (TengoBikini ?robot)))
        (ManoVacia ?robot)
        (not (TieneObjeto2 ?robot ?objeto))
        (TieneObjeto1 ?personaje ?objeto)

        (increase (puntuacion-total ?robot) (puntuacion ?objeto ?personaje))
    ) 
)

(:action DarObjetoRobot
    :parameters (?robot1 - Robot ?zona - Zona ?objeto - Objeto ?robot2 - Robot)
    :precondition (and 
            (RobotRepartidorRobots ?robot1)
            (RobotRepartidorPersonajes ?robot2)
            (ZonaActual ?robot1 ?zona)
            (ZonaActual ?robot2 ?zona)
            (not (ManoVacia ?robot1))
            (ManoVacia ?robot2)
            (TieneObjeto2 ?robot1 ?objeto)
    )
    :effect (and
        (when (EsZapatilla ?objeto) (and (not (TengoZapatilla ?robot1)) (TengoZapatilla ?robot2)) )
        (when (EsBikini ?objeto)  (and (not (TengoBikini ?robot1)) (TengoBikini ?robot2)))
        (ManoVacia ?robot1)
        (not (ManoVacia ?robot2))
        (not (TieneObjeto2 ?robot1 ?objeto))
        (TieneObjeto2 ?robot2 ?objeto)
    ) 
)

;;El Robot ?robot se mete el Objeto ?objeto en la mochila
(:action MeterMochila
    :parameters (?robot - Robot ?objeto - Objeto)
    :precondition (and 
            (MochilaVacia ?robot)
            (not (ManoVacia ?robot))
            (TieneObjeto2 ?robot ?objeto)

    )
    :effect (and
       (ManoVacia ?robot)
       (not (MochilaVacia ?robot))
       (TieneObjeto3 ?robot ?objeto)
       (not (TieneObjeto2 ?robot ?objeto))
    ) 
)

;;El Robot ?robot se saca el Objeto ?objeto de la mochila
(:action SacarMochila
    :parameters (?robot - Robot ?objeto - Objeto)
    :precondition (and 
            (not (MochilaVacia ?robot))
            (ManoVacia ?robot)
            (TieneObjeto3 ?robot ?objeto)
    )
    :effect (and
       (not (ManoVacia ?robot))
       (MochilaVacia ?robot)
       (not (TieneObjeto3 ?robot ?objeto))
       (TieneObjeto2 ?robot ?objeto)
    ) 
)

(:action MeterBolsillo 
    :parameters (?robot - Robot ?objeto - Objeto)
    :precondition (and
        (TieneObjeto2 ?robot ?objeto)
        (not (ManoVacia ?robot))
        (<= (nObjetosBolsillo ?robot) (maxObjetosBolsillo))

    )

    :effect (and
        (ObjetoBolsillo ?robot ?objeto)
        (not (TieneObjeto2 ?robot ?objeto))
        (ManoVacia ?robot)
        (increase (nObjetosBolsillo ?robot) 1)
    )
)

(:action SacarBolsillo
    :parameters (?robot - Robot ?objeto - Objeto)
    :precondition (and
        (not (TieneObjeto2 ?robot ?objeto))
        (ManoVacia ?robot)
        (ObjetoBolsillo ?robot ?objeto)
    )

    :effect (and
        (not (ObjetoBolsillo ?robot ?objeto))
        (TieneObjeto2 ?robot ?objeto)
        (not (ManoVacia ?robot))
        (decrease  (nObjetosBolsillo ?robot) 1)
    )
)


)
