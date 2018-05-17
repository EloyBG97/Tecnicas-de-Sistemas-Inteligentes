(define (domain BELKANV5)

(:types
 Zona Personaje Objeto)

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

    ;;El Robot  no tiene ningún objeto en la mano
    (MochilaVacia )

    ;;El Robot  tiene el Objeto ?objeto
    (TieneObjeto2  ?objeto - Objeto)

    ;;El Robot  tiene el Objeto ?objeto en la mochila
    (TieneObjeto3  ?objeto - Objeto)

    (Bosque ?zona - Zona)
    (Agua ?zona - Zona)
    (Precipicio ?zona - Zona)
    (Arena ?zona - Zona)
    (Piedra ?zona - Zona)

    (EsZapatilla ?objeto - Objeto)
    (EsBikini ?objeto - Objeto)
    (TengoZapatilla )
    (TengoBikini )

    (ObjetoBolsillo  ?objeto - Objeto)
)


(:functions
    (distancia-total )
    (distancia-zonas ?z1 - Zona ?z2 - Zona)

    (puntuacion-total )
    (puntuacion ?o1 - Objeto ?p1 - Personaje)

    (nObjetosBolsillo)
    (maxObjetosBolsillo)
)

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
            (not (Precipicio ?zona2))
            (or
                (and (Bosque ?zona2) (TengoZapatilla ))
                (and (Agua ?zona2) (TengoBikini ))
                (Arena ?zona2)
                (Piedra ?zona2)
            )
            
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
            (increase (distancia-total ) (distancia-zonas ?zona1 ?zona2))
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
        (when (EsZapatilla ?objeto) (TengoZapatilla ))
        (when (EsBikini ?objeto) (TengoBikini ))
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
        (when (EsZapatilla ?objeto) (not (TengoZapatilla )))
        (when (EsBikini ?objeto)  (not (TengoBikini )))
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
        (when (EsZapatilla ?objeto) (not (TengoZapatilla )))
        (when (EsBikini ?objeto)  (not (TengoBikini )))
        (ManoVacia )
        (not (TieneObjeto2  ?objeto))
        (TieneObjeto1 ?personaje ?objeto)

        (increase (puntuacion-total ) (puntuacion ?objeto ?personaje))
    ) 
)

;;El Robot  se mete el Objeto ?objeto en la mochila
(:action MeterMochila
    :parameters ( ?objeto - Objeto)
    :precondition (and 
            (MochilaVacia )
            (not (ManoVacia ))
            (TieneObjeto2  ?objeto)
    )
    :effect (and
       (ManoVacia )
       (not (MochilaVacia ))
       (TieneObjeto3  ?objeto)
       (not (TieneObjeto2  ?objeto))
    ) 
)

;;El Robot  se saca el Objeto ?objeto de la mochila
(:action SacarMochila
    :parameters ( ?objeto - Objeto)
    :precondition (and 
            (not (MochilaVacia ))
            (ManoVacia )
            (TieneObjeto3  ?objeto)
    )
    :effect (and
       (not (ManoVacia ))
       (MochilaVacia )
       (not (TieneObjeto3  ?objeto))
       (TieneObjeto2  ?objeto)
    ) 
)

(:action MeterBolsillo 
    :parameters ( ?objeto - Objeto)
    :precondition (and
        (TieneObjeto2  ?objeto)
        (not (ManoVacia ))
        (<= (nObjetosBolsillo) (maxObjetosBolsillo))
    )

    :effect (and
        (ObjetoBolsillo  ?objeto)
        (not (TieneObjeto2  ?objeto))
        (ManoVacia )
        (increase (nObjetosBolsillo) 1)
    )
)

(:action SacarBolsillo
    :parameters ( ?objeto - Objeto)
    :precondition (and
        (not (TieneObjeto2  ?objeto))
        (ManoVacia )
        (ObjetoBolsillo  ?objeto)
    )

    :effect (and
        (not (ObjetoBolsillo  ?objeto))
        (TieneObjeto2  ?objeto)
        (not (ManoVacia ))
        (decrease (nObjetosBolsillo) 1)
    )
)
)
