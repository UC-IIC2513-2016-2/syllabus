# Pauta Interrogación 2

El enunciado se encuentra [en PDF](I2.pdf).

## Ejercicio 1 (30%): Preguntas conceptuales

A continuación tanto una posible solución/respuesta como también la pauta de asignación de puntajes:

### Pregunta 1 (1.5 puntos)

Los dos criterios que entran en juego en esta situación son especificidad y luego orden.

Para determinar si un selector tiene mayor especificidad que otro es necesario contar el número de *ids*, *clases* y *elementos* que contiene cada uno. Entonces, se comparan estas tres cantidades, en ese orden, hasta que uno de los dos tiene un número mayor, el que resultará ser más específico.

Otra manera de verlo es formar con estos tres valores un número de "base infinita" (en lugar de base 10) y comparar como se comparan los números en general.

Si la especificidad de las dos reglas con una propiedad en conflicto es la misma, entonces se utilizará la propiedad cuya posición en el archivo de estilos sea posterior.

**Pauta**: 0.75 puntos por mencionar ambos criterios, 0.75 puntos por explicarlos correctamente.

### Pregunta 2 (1.5 puntos)

El recurso con el que se trabaja es una `Subscription`, como un sub-recurso del recurso `Category`. Es en una `Subscription` que tendremos una propiedad para almacenar la periodicidad.

Como lo que estamos haciendo es crear una _subscription_ entonces corresponde que ese _request_ sea un **POST** al recurso que representa la colección de _subscriptions_ (`POST /categories/:category_id/subscriptions`).

Lo que tenemos que agregar a `routes.rb` es:

```ruby
resources :categories do
  resources :subscriptions, only: [:create]
end
```

**Pauta**: 1 punto por explicación de cuál es el recurso, 0.5 puntos por el código en `routes.rb`. Si no se considera un recurso anidado, los puntajes de estos dos ítems son 0.7 y 0.3 respectivamente.

### Pregunta 3 (1.3 puntos)

La afirmación **no es cierta**. Aún cuando se almacene la información de sesión en la base de datos, es necesario crear un identificador de sesión que permita asociar un cierto _request_ a una información de sesión específica (que será cargada al procesar tal _request_). Para que el request contenga tal identificador, es necesario utilizar una _cookie_ que contendrá únicamente tal identificador. Por lo tanto, siempre será necesario utilizar _cookies_, con mayor o menor información, para mantener sesión en un protocolo _stateless_ como HTTP.

**Pauta**: 0.5 puntos por responder que la afirmación no es cierta, y 1 punto por la explicación. En la explicación es importante mencionar la _cookie_ con el identificador de sesión.

### Pregunta 4 (1.5 puntos)

Dos elementos en Rails que ayudan a mantener nuestras vistas _DRY_ son los _helpers_ y los _partials_.

Los _helpers_ son métodos declarados en módulos Ruby que quedan disponibles en los _templates_ de la aplicación y pueden generar contenido HTML.

Los _partials_ son un _template_ especial (identificado por comenzar con _underscore_) cuya orientación es ser incluido en otros _templates_ (por lo tanto, fomentando reutilización).

Otras posibles respuestas válidas son _layout_ y _content_for_, por ejemplo.

**Pauta**: 0.5 puntos por cada mención, 0.25 puntos por cada explicación.

## Ejercicios prácticos

En la carpeta [elections_poll](elections_poll) puedes encontrar una aplicación completa y funcionando, que contiene soluciones de ejemplo para los dos ejercicios prácticos.

## Ejercicio 2 (35%)

### Posible solución

Puedes ver un ejemplo de [controller](elections_poll/app/controllers/answers_controller.rb) y de [formulario](elections_poll/app/views/answers/new.html.erb) en la aplicación publicada.

### Pauta

Esta pregunta fue corregida utilizando la [siguiente rúbrica]().

## Ejercicio 3 (35%)

Puedes ver un ejemplo de la [vista HTML](elections_poll/app/views/poll_results/index.html.erb) y del [código CSS](elections_poll/app/assets/stylesheets/poll_results.scss) necesarios en la aplicación publicada.

### Pauta

Esta pregunta fue corregida utilizando la [siguiente rúbrica]().
