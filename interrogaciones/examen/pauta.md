# Pauta Examen

El enunciado se encuentra [en PDF](examen.pdf).

## Ejercicio 1 (25%): Preguntas conceptuales

A continuación tanto una posible solución/respuesta como también la pauta de asignación de puntajes:

### Pregunta 1 (1 punto)

Mantener _cookies_, con todo lo que eso implica, es una complicación adicional para los clientes de la API; en cambio, una autenticación basada en _tokens_ usualmente sólo necesita incluir ese _token_ en un _header_ o _query parameter_.

Por otra parte, exponer una API con autenticación en base a _cookies_ tiene implicancias negativas en cuanto a seguridad, en particular en cuanto a ataque de CSRF. En el caso de aplicaciones Web orientadas al usuario, solemos utilizar un token CSRF en _requests_ que modifican datos (como POST o PUT) de manera de tener la garantía de que el _request_ fue originado desde un formulario de nuestra misma aplicación (y no desde otra aplicación diferente queriendo engañar al usuario); sin embargo, este método no es aplicable para el caso de APIs.

**Pauta**: Considerar el punto completo si es que mencionan al menos una razón, como las dos expuestas en este ejemplo o alguna otra que sea igualmente válida.

### Pregunta 2 (1 punto)

- un primer criterio es sencillamente el de factibilidad: hay ciertas cosas que simplemente no es posible realizarlas puramente con código en el cliente (pues, por ejemplo, necesitan de información que se encuentra únicamente en el servidor). En esos casos podemos optar ya sea por sólo usar código en el servidor, o bien una combinación de servidor y cliente con _requests Ajax_.
- un segundo criterio es el de _performance_: hay ciertas tareas que se van a poder realizar mucho más rápido en el cliente o en el servidor. Una validación de un campo requerido en el cliente nos permite dar retroalimentación al usuario mucho más rápidamente que si se realizara en el servidor. Por otra parte, realizar una búsqueda sobre una cantidad grande de datos en el cliente implicaría, primero, haber cargado esos datos (de por sí una descarga eventualmente gigante) y, además, no contar con los índices que podríamos tener en el servidor que harían esa búsqueda mucho más eficiente.
- un tercer criterio tiene relación con eficiencia de recursos: si quisiéramos mostrar una transición de colores de algún elemento en la página, hacerlo en el servidor implicaría procesar y enviar varios _requests_ con contenido diferente para ello, siendo que con una animación CSS se puede realizar muy eficientemente. Algo similar ocurre con validaciones en el lado del cliente, que evitan procesar muchos _requests_ descartables en el lado del servidor.

**Pauta**: 0.5 puntos por un primer criterio correcto, 0.3 puntos por un segundo criterio correcto y 0.2 puntos por el tercer criterio correcto. Pueden haber otros criterios válidos además de los de esta respuesta en la pauta. Los ejemplos no son requisito para una respuesta correcta, sólo son necesarios si es que la explicación no es suficiente para entender la idea.

### Pregunta 3 (2 punto)

Respuesta correcta:

A: `i = 0`

B: (nada)

C: `i = 1 / j = 1`

D: `i = 2 / j = 1`

E: `i = 3 / j = 2 / k = 11`

F: `i = 4 / j = 3 / k = 21`

G: `i = 5 / j = 2 / k = 31`

**Pauta**: 0.3 puntos por cada marca correcta (incluyendo "nada" en la marca B) excepto por la marca A que tiene 0.2 puntos. Considerar cada variable separadamente (si en la marca F tiene el output de `i` y `k` correctos, pero de `j` incorrecto, considerar 0.2 de 0.3 puntos).

### Pregunta 4 (1 punto)

Siendo bien estrictos, tenemos un par de posibilidades bien correctas:
- método PATCH (aceptable PUT…), _path_ identificando al recurso al que queremos cambiar un atributo (ej.: `/books/123`), y _body_ para especificar los atributos a modificar (`{read: true}` por ejemplo).
- método PUT o DELETE entendiendo el recurso como el subrecurso "lectura del libro", que queda reflejado en el _path_ `/books/123/reading`, y utilizando el _body_ para especificar el valor (`true`) en caso de ser necesario.

Siendo más permisivos, podemos aceptar como correcta también una solución más simple como utilizar el método PATCH/PUT sobre el _path_ que identifica a una acción en el contexto del libro (`/books/123/mark_read` o `/books/123/mark_unread`) y un _body_ que no necesitamos, aunque en este caso no es un recurso a lo que estemos asociando el _request_.

**Pauta**: Cualquiera de las soluciones mencionadas en esta respuesta puede tener el puntaje completo. Considerar puntajes parciales por método, _path_ o _body_ correctos/incorrectos teniendo en consideración que, dependiendo de la respuesta, uno de ellos puede sólo tener sentido en conjunto con el otro.

### Pregunta 5 (1 punto)

Esta pregunta es bastante abierta, pero entre las buenas prácticas que se podrían recomendar están, por ejemplo: "fat models / skinny controllers", DRY, usar helpers, vistas simples y limpias de lógica, rutas orientadas a recursos, etc.

**Pauta**: 0.5 puntos por cada buena práctica mencionada. No es necesario explicar demasiado, siempre y cuando sea claro lo que se está recomendando.

## Ejercicio 2 (25%)

### Posible solución

En la carpeta [ejercicio2](ejercicio2) puedes encontrar una posible solución. Hay más de una forma correcta de lograr esto, pero en general los cambios necesarios son:
- el `form` debe ser enviado mediante un request Ajax: agregar el atributo `remote: true` a `form_for` basta para esto, y podemos agregar `data-type` con valor `html` si quisiéramos solicitar HTML (como en la respuesta ejemplo).
- en el _controller_ tenemos que responder diferente ante el request Ajax. Dependiendo de lo que solicitemos, podríamos tener que responder con un partial o con un archivo `js.erb` por ejemplo.
- debemos crear el/los _template(s)_ (ya sea un _partial_ HTML o un archivo `js.erb`) de la/las respuestas.
- las instrucciones JS para insertar en el DOM la respuesta obtenida, dependiendo del tipo de solución, pueden estar en archivos JS enviados a la aplicación al inicio, o bien en el template `js.erb`.

### Pauta

Cada uno de los 4 elementos mencionados anteriormente tiene 1.5 puntos. Tener sólo el caso de éxito o error correcto en algún elemento (si aplica) tendrá 1 punto en lugar de 1.5.

No considerar errores asociados a memoria acerca de la API mientras se vea que la idea está correcta (ej.: usar el evento "ajax:ok" en lugar de "ajax:success", o `response.ajax?` en lugar de `response.xhr?` y similares).

Dentro de cada elemento, considerar puntajes parciales si hay una idea coherente pero con errores. Si el error es menor y difícil de notar sin poder ejecutar la aplicación entonces debe tener un descuento menor (de 0 a 2 décimas). Por ejemplo, haber escuchado el evento `ajax:success` en el formulario directamente, sin darse cuenta que al reemplazar ese formulario por otro con errores, ese nuevo formulario dejará de tener el event listener inicial y por lo tanto dejará de funcionar. Si bien es un error grave en funcionalidad, es un error menor en cuanto a lo desarrollado, y fácilmente detectable cuando se ejecuta.


## Ejercicio 3 (25%)

Una posible solución se encuentra en la carpeta [ejercicio3](ejercicio3).

### Pauta

- Primera parte (3 puntos): API controller
  - 1 punto por alguna manera controlada de generación de JSON (un _serializer_ en el caso del ejemplo, pero usar JSON Builder o cualquier otro método es igualmente válido)
  - 1 punto por el método `index`, que debiera obtener los feeds desde `JournalEntryManager` (no importa si `get_feed` se usa como método de instancia o de clase)
  - 1 punto por el método `create`, que debe considerar éxito y error (0.4 puntos cada caso). Para el caso de error no importa que no se usen serializers ni la forma en que se responda con los errores, mientras esté la idea de responder con algo que indique el error. No usar un status para la respuesta sólo descuenta 1 décima en cada caso, pues es una omisión menor (aunque es importante en especial para el caso de error). Los restantes 0.2 puntos son para la autenticación. No es necesario haberse sabido de memoria el módulo que hay que incluir y el método de Rails para realizar la autenticación por token, así que se puede aceptar "pseudo-código" para esos dos elementos.
- Segunda parte (3 puntos): Cambios en la aplicación Web existente
  - 1.5 puntos por cada método (`index` y `create`)
  - Es válido crear el request directamente desde el controlador o (mejor práctica) hacerlo mediante alguna clase adicional.
  - Se puede usar cualquier gema para generar los _requests_ (el ejemplo usa RestClient).
  - No considerar errores menores de API si la idea se entiende.
  - Si bien la respuesta de ejemplo hace conversiones de la respuesta JSON a objetos de la clase ActiveRecord, esto no es necesario en la respuesta. Sólo fue hecho en el ejemplo para que las vistas pudieran seguir siendo las mismas, sin necesidad de adaptarlas. Esto implica que sí es válido setear como variable de instancia del controlador (para las vistas) el Hash obtenido desde el JSON de la llamada API, aún cuando esto vaya a romper las vistas _default_.

## Ejercicio 4 (25%)

Una posible solución se encuentra en la carpeta [ejercicio4](ejercicio4).

### Pauta

- (4 puntos) JavaScript:
  - 1 punto por escuchar evento clic (0.5) y ejecutar esto en DOMContentLoaded (0.5)
  - 1 punto por ocultar los detalles de precandidatos no cliqueados
  - 1 punto por generación correcta del contenido
  - 1 punto por inserción del contenido en el lugar adecuado
- (2 puntos) CSS:
  - 1 punto por posicionamiento de los detalles (considerar mitad de puntaje por idea de posicionamiento correcta pero con errores u omisiones importantes, y puntaje entre 0.5 y 1 por errores menores)
  - 1 punto por bordes y espaciados
