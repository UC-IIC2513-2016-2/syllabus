# Pauta Interrogación 3

El enunciado se encuentra [en PDF](I3.pdf).

## Ejercicio 1 (34%): Preguntas conceptuales

A continuación tanto una posible solución/respuesta como también la pauta de asignación de puntajes:

### Pregunta 1 (1 punto)

Una vez que un elemento tiene el valor `absolute` en su propiedad `position`, podremos asignar valores a sus propiedades `top`, `right`, `bottom` y `right`, de manera de cambiar la posición en la que se encuentra ese elemento.

Un elemento con este posicionamiento dejará de utilizar espacio en el documento (como si estuviese en una capa diferente al resto de los elementos), por lo que la posición de los demás elementos se calculará como si éste no existiese.

A pesar de lo que pueda insinuar un valor `absolute`, los valores de las propiedades para especificar la posición (`top`, `right`, …) se calcularán _relativas_ al ancestro más próximo del elemento que también esté posicionado (tenga un valor para position diferente de `static`). De no haber ninguno, entonces se determinará su posición de manera relativa al contenedor inicial (`body`).

Ejemplo:
```html
<div id="parent">
  <div id="child">Posicionado absoluto</div>
</div>
```

```css
#parent {
  position: relative;
}
#child {
  position: absolute;
  top: 42px;
}
```
En este ejemplo, el div `#child` quedará ubicado 30px más abajo del borde superior de `#parent` y este último se comportará como si no tuviese contenido.

**Pauta**: 0.3 puntos por explicar que elementos posicionados de manera absoluta no utilizan espacio, 0.5 puntos por explicar que el posicionamiento es relativo al ancestro posicionado más próximo y 0.2 puntos por el ejemplo.

### Pregunta 2 (1 punto)

La línea en cuestión si está creando un objeto, sólo que no a partir de una clase. `Amoeba` es en realidad una función que está pensada para ser utilizada como _función constructora_ (cuando se utiliza con el operador `new`). Normalmente esto implica que no tiene un valor de retorno (`undefined`) y que puede asignar algunas propiedades a `this`, que estará referenciando al objeto que está siendo construido en cada momento.

Además, el prototipo del objeto creado utilizando esta función será el objeto de la propiedad `prototype` de la función constructora, dando la posibilidad de que a éste objeto prototipo se le asignen propiedades que serán compartidas por todos los objetos creados usando la misma función constructora.

**Pauta**: 0.7 puntos por explicar que no es una clase, sino una función constructora. 0.3 puntos por explicar que a los objetos creados se les asigna el `prototype` del constructor.

### Pregunta 3 (1 punto)

**Trozo 1**: el texto `hello world` (0.2 puntos)

**Trozo 2**: el valor `undefined` (0.2 puntos). A pesar de que la variable utlizada en la sentencia de log es declarada en una línea posterior a ésta, JavaScript tiene un comportamiento conocido como _hoisting_, que hace parecer como si todas las variables hubiesen sido declaradas al principio de su _scope_ (esto ocurre pues las declaraciones son procesadas antes de la ejecución). Por ello esta sentencia no desencadenará un error (0.2 puntos por explicar _hoisting_; no importa que no se mencione el nombre, pero la idea respecto a cómo se comporta la declaración de variables debe estar presente).

**Trozo 3**: el valor `undefined` (0.2 puntos). Al igual que en el trozo 2 aquí tenemos _hoisting_. Sin embargo, esto sólo implica que la declaración se procesa antes, pero la operación de asignación seguirá ocurriendo en tiempo de ejecución. Por ello, la sentencia de log mostrará lo mismo que en el trozo 2, y luego de ésta se estará asignando el string `hello world` a la variable `baz` (0.2 puntos por explicar que el _output_ es undefined por la misma razón que trozo 2 y por explicar que la asignación ocurre después del log).

### Pregunta 4 (1 punto)

La manera de solucionar esto es que, en lugar de ejecutar el código que queremos ejecutar de manera inmediata, lo hacemos dentro de una función que agregamos como _ event listener_ a un evento que el _browser_ gatillará en cuanto el DOM esté enteramente disponible: `DOMContentLoaded`.

De esta manera, al cargar el script sólo se agregará esta función como _callback_ asociado al evento mencionado, realmente ejecutándose el código que interactuará con elementos del documento una vez que éstos ya están disponibles.

**Pauta**: 0.5 puntos si la respuesta se basa en _jQuery_ sin explicar lo que realmente ocurre (como por ejemplo, mencionar simplemente entregarle una función con el contenido a ejecutar a la función `$`). 1 punto si es que se explica que se está agregando un _event listener_ al evento gatillado cuando se ha cargado el DOM (no es importante que se mencione el nombre del evento, sólo la descripción de cuándo ocurre).

### Pregunta 5 (1 punto)

Un ejemplo clásico es respecto a la mayoría de las validaciones que podríamos querer realizar en un formulario. Validaciones como que un campo sea requerido, o respete un cierto formato, o tenga algún largo mínimo/máximo, etc.

Para lograr esto tenemos que escuchar eventos asociados al formulario y sus campos: podría bastar sólo con el evento `submit` del formulario para validarlo únicamente cuando el usuario intente enviarlo, o podríamos querer validar apenas se realicen cambios en los campos del formulario utilizando eventos `change` y/o `blur`. Al ocurrir el evento objetivo, deberemos obtener los valores actuales del/de los campo(s) a validar y, mediante código JavaScript, determinar si cumplen o no con los requisitos. Si la validación es exitosa, se deja proceder con el envío del formulario; en caso contrario, se pueden crear/mostrar elementos que explique el error de validación y detener el envío del formulario.

Otro ejemplo común en que Javascript puede ayudar es en ayudas contextuales o diálogos de confirmación. Por ejemplo, si tenemos un botón que al ser presionado enviará un _request_ para eliminar una cierta entidad en el servidor, podría ser deseable que, luego de presionarlo, tengamos una pantalla intermedia explicando lo irreversible de esta acción y pidiendo presionar un botón para confirmar que se desea proceder. Con JavaScript podemos escuchar el evento `click` del botón para eliminar la entidad y, en lugar de proceder con el _request_, generar este diálogo de confirmación, generando el _request_ sólo una vez que el usuario haya presionado el botón de confirmación.

**Pauta**: 0.5 puntos por mencionar un ejemplo válido (en que se pueda evitar un _request_ manteniendo o mejorando la interfaz de usuario) y 0.5 puntos por explicar en alto nivel cómo se puede lograr eso con JavaScript.

### Pregunta 6 (1 punto)

La manera de lograr esto es que se genera un _token_ **único** asociado al reingreso de contraseña del **usuario en particular**. Entonces, en el correo, el _link_ incluido contendrá este _token_, permitiendo que el procesamiento del mismo en el lado del servidor sólo cambie la contraseña del usuario identificado por ese _token_.

El _token_ debe ser suficientemente difícil de "adivinar", y con eso tendremos suficiente certeza de que sea muy difícil simplemente ingresar URLs para cambiar contraseñas de usuarios ajenos.

Si tenemos una aplicación que ya cuenta con un sistema de usuarios básico, para tener un sistema de olvido de contraseña necesitaríamos:
- una migración para agregar una nueva columna que pueda contener el _token_ según los criterios con que lo generemos (usualmente un _string_ de cierto largo), ya sea en la tabla `users` o en alguna otra que represente las solicitudes de olvido de contraseña.
- 4 acciones de controlador nuevas:
  - una para ingresar el correo (u otro identificador) del usuario que olvidó la contraseña
  - otra para procesar el formulario anterior, realizar la generación del _token_ y enviar el correo con un link a la tercera acción que es...
  - una que muestre un formulario para ingresar una nueva contraseña, y que contenga el _token_ ya sea en la URL de destino del formulario o como un _input hidden_
  - y finalmente una que procese el formulario anterior, asignando la nueva contraseña al usuario que esté identificado por el _token_ entregado.

**Pauta**: 0.7 puntos por explicar una solución válida como utilizando _tokens_ para identificar la solicitud de cambio de contraseña de un usuario en particular. 0.3 puntos por explicar de manera general qué cambios se necesitan en la aplicación. El nivel de detalle en esta pauta es mayor al exigible. Basta con que tengan claridad acerca de agregar columnas a la BD y ciertas acciones de controlador para procesar los requests nuevos que esta funcionalidad implica.

## Ejercicio 2 (32%)

### Posible solución

En la carpeta [ejercicio2](ejercicio2) puedes encontrar la solución completa en una app Rails que puedes llegar y ejecutar. Recuerda que sólo se pedían 2 de los 3 componentes del MVC, pero en la solución están los 3.

### Pauta

Cada uno de los dos componentes pedidos tiene 2.5 puntos, más 1 punto por la descripción de cómo implementar el faltante. Si hay una implementación de los tres, los dos primeros tendrán 2.5 puntos, mientras que el tercero 1 punto. Descripciones de cómo implementar el componente sólo cuentan como puntaje para el tercer componente no implementado, pero no cuentan como puntaje en los otros dos que debían ser implementados.

#### Modelo

- (0.5 puntos) es una clase ActiveRecord. Se espera que herede ya sea de ApplicationRecord o ActiveRecord::Base. Impresiciones respecto al nombre de esta clase padre son perdonables.
- (1 punto) validaciones _presence_ de atributos
- (1 punto) validaciones adicionales dependiendo de cómo fueron representados los datos (numericality, inclusion, valores defaults).

En las validaciones son perdonables impresiciones menores (_presence_ mal escrito, _validate_ en lugar de _validates_, orden de argumentos cambiados, etc.). Si no están todas las validaciones necesarias pero hay al menos la mitad, asignar la mitad de puntaje en el ítem. En caso contrario, 0 en ese ítem.

#### Vista
- (0.5 puntos) formulario orientado al recurso. Mitad de puntaje por formulario correcto (considerando URL de destino) pero no orientado al recurso.
- (0.5 puntos) por mostrar errores de validación, ya sea como un resumen superior o _inline_ en cada campo. Impresiciones respecto a los atributos para obtener los mensajes de error son perdonables, pero debe notarse una clara orientación hacia una solución correcta.
- (0.5 puntos) Campos numéricos. También es válido usar `text_field`s siempre que consideren validaciones _numericality_. Deben tener su _label_ respectivo. _Typos_ o pequeñas impresiciones de API son aceptables. Mitad de puntaje si hay errores menores y 0 si hay errores importantes.
- (0.6 puntos) otros campos no numéricos: unidad de temperatura, outside/inside y notes. Considerar 0.2 puntos por cada uno. De igual manera, _typos_ y API ligeramente incorrecta se perdonan, errores menores descuentan mitad de puntaje.
- (0.4 puntos) botón de envío de formulario.

#### Controlador

- (0.5 puntos) filtro (`before_action`) que evita que usuarios no identificados ingresen datos (no importa si generan un error, o redirigen a cualquier _path_, pero importa que lo detecten y reaccionen ante ello).
- (1 punto) método `new`. Sólo necesita crear un objeto vacío para usar en el formulario, y cualquier otra cosa en que la vista dependa eventualmente.
- (1 punto) método `create`: 0.2 puntos por obtener los argumentos adecuadamente; 0.4 puntos por crear y almacenar el objeto correctamente; 0.4 puntos por reaccionar correctamente dependiendo del resultado de almacenar el registro nuevo (un _redirect_ o _render_ con algún mensaje de éxito o _render_ del formulario con errores). _Typos_ y errores menores de API son perdonables. Mitad de puntaje en cada ítem por errores menores en la funcionalidad.

#### Explicación de componente no implementado (1 punto)

Lo importante es que mencionen aspectos relevantes que deba tener la implementación del componente en cuestión. Una guía de ello es la misma pauta de cada componente, pero en general lo crítico es:
- Modelo: especificar las validaciones necesarias.
- Vista: utilizar un `form_for` para el objeto de la variable `@data_entry`, explicar en especial cómo se representarán los datos no obvios (unidad de temperatura, _outside_/_inside_).
- Controlador: especificar la necesidad de los dos métodos, `new` y `create`, , crear objeto inicial que usará el formulario, obtener los argumentos de manera segura (_strong params_), reaccionar con cierta acción diferente dependiendo del éxito o fracaso de la operación de almacenar la tupla.

Si están presente casi todos estos elementos, entonces tienen el punto completo. Si está presente más de la mitad, tienen la mitad de puntaje. 0 en otros casos.

## Ejercicio 3 (35%)

Una posible solución se encuentra en la carpeta [ejercicio3](ejercicio3). Puedes abrir `app.html` en el browser y probar la solución.

### Pauta

#### Parte A (3 puntos)

- (0.5 puntos) por correctamente escribir una función constructora para utilizar "como clase".
- (0.5 puntos) visibilidad adecuada del argumento entregado al constructor y de los métodos. El argumento no debe ser asignado a `this`, aunque es posible crear un _getter_ para obtenerlo. Los métodos deben estar declarados dentro de la función constructora y asignados a `this` en caso de que usen alguna variable local del constructor o asignados en el `prototype` en caso contrario.
- (0.5 puntos x 4) cada uno de los 4 métodos pedidos. Perdonar errores menores asociados a desconocimiento del lenguaje (mientras no sea algo muy lejano a la realidad). La lógica debe estar correcta. De haber algún error importante o algunos errores menores, considerar mitad de puntaje si al menos parece ser una solución plausible.

#### Parte B (3 puntos)

La asignación de puntajes está especificada en el enunciado. Errores menores asociados a no mucha familiaridad con el lenguaje son perdonables mientras no se alejen demasiado de la realidad. Mientras la solución sea funcional puede obtener todo el puntaje, aún cuando no sea óptima o no siga algunas buenas prácticas en la escritura de JS (como dejar variables globales). En cada ítem se subdivide mitad de puntaje a lo asociado a jQuery (manejo, obtención y manipulación de DOM) y mitad a la parte algorítmica y de interacción con las clases de la parte A.
