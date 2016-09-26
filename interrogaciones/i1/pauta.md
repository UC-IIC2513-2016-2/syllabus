# Pauta Interrogación 1

El enunciado se encuentra [en PDF](I1.pdf).

## Ejercicio 1 (35%): Preguntas conceptuales

A continuación tanto una posible solución/respuesta como también la pauta de asignación de puntajes:

### Pregunta 1 (1.2 puntos)

_Duck Typing_ se refiere a que, en lugar de conocer con precisión el  tipo de un objeto, nos preocupamos de chequear si sus capacidades (métodos) son las necesarias para un cierto propósito (0.6 puntos por explicación).

Ejemplo en Ruby (0.6 puntos por ejemplo):

```ruby
if some_object.respond_to?(:each)
  some_object.each { |o| puts o }
end
```
No nos importa si `some_object` es un `Array` u otro tipo enumerable; sólo nos importa que sea capaz de responder al método `each`.

### Pregunta 2 (1.2 puntos)

Lo que ocurre en este caso no es una asignación de un atributo de instancia directamente, sino que es un llamado a un método público de nombre `title=` y que recibe un argumento. El poder escribir un método de este nombre de manera que parezca que estamos asignando una variable es _syntax sugar_ de Ruby.

Aunque no es requisito, normalmente un método de nombre `title=` se encargará de asignar el atributo de instancia `@title` del objeto, pero dado que es un método potencialmente definido enteramente por el programador, podría estar realizando una tarea completamente diferente.

**Pauta**: hasta 0.6 si la explicación es únicamente por utilizar _accessors_. Hasta 1.2 puntos si la explicación incluye el hecho de que `title=` es un método.

### Pregunta 3 (1.2 puntos)

Un _mixin_ en Ruby nos sirve para declarar un conjunto de comportamientos en un _módulo_ que luego podemos compartir en las diferentes clases en las que este módulo se incluya (0.6 puntos).

Un ejemplo en Ruby (0.6 puntos por ejemplo que declare un módulo y luego una clase con la llamada `include`):

```ruby
module Debug
  def whoami
    puts "I'm a #{self.class.name} with id #{self.object_id}"
  end
end

class Test
  include Debug
end

Test.new.whoami
```

### Pregunta 4 (1.2 puntos)

Se pidieron sólo 3 tecnologías correctas. En caso de especificar más de 3, se corrigen las 3 primeras. Cada tecnología tiene 0.4 puntos de los cuales son 0.2 por la mención y 0.2 por su rol.

- **HTML**: permite definir la estructura y contenido de los documentos/páginas.
- **CSS**: permite especificar la presentación (o estilo visual) de los documents/páginas.
- **JavaScript**: lenguaje de programación para definir comportamiento de la aplicación Web en el lado de cliente.
- **HTTP**: protocolo que especifica cómo se comunica el cliente y el servidor en una interacción Web.

Todas estas tecnologías mencionadas son las únicas disponibles que cumplen su rol respectivo. Sin embargo, para otros roles como por ejemplo lenguajes de programación para definir el comportamiento del lado del servidor existen una infinidad diferentes de donde elegir.

### Pregunta 5 (1.2 puntos)

Los elementos más relevantes que deben mencionarse con 4 (0.25 puntos cada uno):
- se envía un request HTTP solicitando la raíz de www.uc.cl.
- se interpreta el documento HTML enviado como respuesta.
- se realizan sucesivos requests HTTP por cada recurso asociado en el HTML interpretado (imágenes, hojas de estilo, archivos con código JavaScript, etc.)
- se genera una vista gráfica con todo el contenido interpretado.

La posible mejora a este proceso vale 0.2 puntos. Hay varias respuestas válidas (entre las cuales está simplemente _caché_), pero una bien interesante es una mejora que de hecho se implementó en la versión 2 de HTTP (_Server Push_): como se espera que el browser siempre necesite los recursos asociados a una petición inicial del documento, el servidor podría enviarlos inmediatamente en la misma conexión, sin esperar a que el browser deba interpretar y solicitar con requests HTTP independientes estos recursos más adelante.

## Ejercicio 2 (30%)

### Posible solución

En el archivo [ejercicio_2.rb](ejercicio_2.rb) puedes encontrar la solución completa, aunque sólo se pedía una parte de ella.

### Pauta

En este ejercicio se pide una cantidad específica de columnas en migraciones y de
validaciones y relaciones ActiveRecord. En caso de que la respuesta incluya más de
lo pedido, sólo se corregirá las primeras instancias encontradas hasta completar la cantidad pedida.

#### Parte 1 (2.4 puntos)

No se considera la declaración de la clase para la migración. Es suficiente con escribir el método (`change`, por ejemplo). Cada columna declarada completamente
correcta tiene 0.8 puntos. Si está "casi" buena, 0.4 puntos (por ejemplo, omitir
las opciones `default` o `null` en las tablas asociadas a entidades que especificaban valores _default_ o _requeridos_).

#### Parte 2 (3.6 puntos)

- 0.6 puntos por la declaración de una clase ActiveRecord
- parte a) 0.6 puntos por cada validación
- parte b) 0.6 puntos por cada asociación

## Ejercicio 3 (35%)

Una posible solución se encuentra en el archivo [ejercicio_3.rb](ejercicio_3.rb).

La asignación de puntajes se realiza con el siguiente criterio:

- 2 ptos: Llamada a métodos de RaceManger/Race desde el controlador manteniendo funcionamiento original
- 3 ptos: Métodos en RaceManager para la simulación:
  - 1 pto: Actualizar distancias
  - 1 pto: Buscar ganadores/líder
  - 1 pto: Actualizar Race si alguien ganó
- 1 pto: Modificaciones al modelo Race/SnailRaceParticipation para eliminar métodos de consulta a base de datos en el controlador
