function StateResult(id, countingPercentage, electorsCount, results) {
  this.getId = function () {
    return id;
  };
  this.getCountingPercentage = function () {
    return countingPercentage;
  };
  this.getElectorsCount = function () {
    return electorsCount;
  };
  this.getResults = function () {
    return results;
  };
}

StateResult.prototype.getWinner = function () {
  var winner, winnerVotes = 0, results = this.getResults();
  for (var candidateId in results) {
    if (results[candidateId] > winnerVotes) {
      winner = candidateId;
      winnerVotes = results[candidateId];
    }
  }
  return winner;
};

/**
 * Parte A
 * Si el método que estamos creando no utiliza variables locales del constructor
 * entonces conviene crear el método en el prototype de la función (de manera que se
 * cree sólo una función compartida por todos los objetos). Pero si necesita de algún dato
 * (como stateResults) entonces deberemos crearla dentro del constructor, como "función privilegiada".
 * En estricto rigor, sólo se pide que el arreglo stateResults no quede público (asignado a "this"), pues
 * en ese caso es posible reasignarlo directamente. Creando un getter igual podremos mutar el array, es cierto,
 * pero hay maneras de evitar eso, como por ejemplo trabajando con datos inmutables en JS.
 * De todas maneras, el criterio aquí se mantiene: si estás usando stateResults entonces es razonable dejar
 * el método como función privilegiada. Si no, debería quedar directamente en prototype.
 *
 * En los métodos escritos aquí bien podríamos realizar el cálculo que hacen una única vez (ya sea realizando los cálculos
 * en el constructor o utilizando memoization), si suponemos que el objeto stateResults entregado no cambiará. Pero por
 * simplicidad eso no está presente (tampoco se exige en el enunciado).
 *
 * Durante la evaluación se indicó que estaba permitido suponer que sólo existen 2 candidatos con los ids clinton y trump.
 * Esto permite algunas pocas simplificaciones (y evitar los for..in), aunque no cambia la estructura de lo pedido.
 */
function ElectionResult(stateResults) {
  this.getStateResultsArray = function () {
    return stateResults;
  };
}

ElectionResult.prototype.getStateResults = function () {
  var result = {}, stateResults = this.getStateResultsArray();
  for (var i = 0; i < stateResults.length; i++) {
    result[stateResults[i].getId()] = stateResults[i];
  }
  return result;
};

ElectionResult.prototype.getAverageCountingPercentage = function () {
  var sum = 0, stateResults = this.getStateResultsArray();
  for (var i = 0; i < stateResults.length; i++) {
    sum += stateResults[i].getCountingPercentage();
  }
  return sum / stateResults.length;
};

ElectionResult.prototype.getElectorsResult = function () {
  var electorsResult = {}, stateResults = this.getStateResultsArray();
  for (var i = 0; i < stateResults.length; i++) {
    var stateResult = stateResults[i];
    var stateWinner = stateResult.getWinner();
    electorsResult[stateWinner] || (electorsResult[stateWinner] = 0);
    electorsResult[stateWinner] += stateResult.getElectorsCount();
  }
  return electorsResult;
};

ElectionResult.prototype.getWinner = function () {
  var electorsResult = this.getElectorsResult();
  var winner, winnerElectors = 0;
  for (var candidateId in electorsResult) {
    if (electorsResult[candidateId] === winnerElectors) {
      winner = undefined; // empate
    } else if (electorsResult[candidateId] > winnerElectors) {
      winner = candidateId;
      winnerElectors = electorsResult[candidateId];
    }
  }
  return winner;
};


var CANDIDATES = { clinton: 'Hillary Clinton', trump: 'Donald Trump' };

/**
 * Parte B
 * Nota: en el HTML entregado en el enunciado faltó especificar el atributo "name" en los
 * radio buttons. Esto sólo afecta en que, de no haber un atributo name con el mismo valor para ambos,
 * el browser permitirá que ambos estén activos, mientras que de lo contrario se desactivará el no elegido automáticamente.
 * Esto no cambia en nada esta solución ni lo que se pide como respuesta, sólo hace que este selector funcione como uno esperaría.
 */
function updateResults(electionResult) {
  // 1.5 puntos
  var winnerId = electionResult.getWinner();
  $('#winner strong').html(winnerId ? CANDIDATES[winnerId] : 'Empate');

  /*
   * 1 pto. Hay dos maneras principales de hacer esto. Una es buscando qué radio button
   * está seleccionado en este momento (cuando se necesita) y la otra es escuchando desde el principio
   * por cambios en alguno de los radio buttons y "acordarse" de cuál ha sido el último seleccionado (ver alternativa abajo).
   * En el enunciado se pedía que esta función, al ser llamada (será llamada frecuentemente) cambie las clases de acuerdo a los
   * resultados actuales. Aunque esto tiene la limitante de que no reaccionará cuando el usuario cambie de candidato entre medio
   * de las actualizaciones. Esto no es requisito hacerlo (y no es un caso de uso muy frecuente).
   */
  var selectedCandidateId = $('input[type=radio]:checked').val();
  // evitar marcar happy o sad si es undefined... perdonable si es que no lo hicieron.
  if (selectedCandidateId) {
    if (winnerId === selectedCandidateId) {
      $('#winner').removeClass('sad');
      $('#winner').addClass('happy');
    } else {
      $('#winner').removeClass('happy');
      $('#winner').addClass('sad');
    }
  }

  /**
   * 0.5 puntos. Esta función será llamada muchas veces, por lo que si simplemente escuchamos el evento click nuevamente cada vez
   * que es llamada, terminaremos teniendo varios click listeners por cada anchor. *No es requisito* haberse dado cuenta y evitado esto.
   * Pero si queremos hacerlo tenemos las siguientes alternativas:
   * - "apagar" el listener anterior con la función jQuery off, y añadir una nueva cada vez
   * - tener un "flag" que nos permita saber que el evento ya está siendo escuchado
   *   - podría ser una variable declarada fuera de esta función, en cuyo caso necesitaríamos encerrar todo esto en una IIFE
   *   - o podría ser asignando un data-* al anchor en cuestión, marcándolo como que ya tiene un listener
   * - o también podríamos simplemente actualizar los datos desde esta función (en data-* de cada anchor, por ejemplo, o en variables externas
   *   accesibles también por otra función por compartirla en sus respectivos closures) y activar la escucha de los clicks desde otra función llamada
   *   una única vez cuando se gatilla DOMContentLoaded.
   * Dado que no será requisito solucionar este problema, usaremos la solución más simple.
   */
  $('#states-details').off('click');
  $('#states-details').on('click', 'a', function () {
    var $anchor = $(this);
    var stateId = $anchor.attr('id');
    var stateResult = electionResult.getStateResults()[stateId];
    if (stateResult) {
      var results = stateResult.getResults();
      var votesStringArray = []
      for (var candidateId in results) {
        votesStringArray.push(CANDIDATES[candidateId] + ' ' + results[candidateId] + ' votes');
      }
      // con cada click se creará un nuevo div (el enunciado no pide evitar eso). Si quisiéramos evitar esto, tendríamos que examinar antes si es que
      // ya existe uno previamente y sólo crearlo en caso de que no sea así.
      $('<div></div>')
        .addClass('details')
        .html(votesStringArray.join('; '))
        .on('click', function () { $(this).remove(); })
        .insertAfter($anchor);
    }
  });
}

/**
 * Parte B, manera alternativa para el segundo requisito, escuchando cambios en radio buttons.
 * Encerramos todo en un una IIFE para no dejar variables globales. Esto último no es requisito,
 * de la pregunta ni exigible como respuesta, pero es bueno hacerlo :)
 */
var updateResultsAlt = (function () {
  var selectedCandidateId = undefined;

  $(function () {
    $('input[type=radio]').on('change', function () {
      selectedCandidateId = $(this).val();
    });
  });
  return function (electionResult) {
    // código similar al anterior...
  };
})();

// algunos datos de prueba
var stateResults = [];
stateResults.push(new StateResult('california', 0.5, 10, {clinton: 100, trump: 8}));
stateResults.push(new StateResult('north-carolina', 0.5, 9, {clinton: 30, trump: 45}));
stateResults.push(new StateResult('south-carolina', 0.7, 7, {clinton: 20, trump: 50}));
stateResults.push(new StateResult('new-york', 0.7, 8, {clinton: 70, trump: 30}));

var electionResult = new ElectionResult(stateResults);
console.log('getElectorsResult: ' + electionResult.getElectorsResult());
console.log('getAverageCountingPercentage: ' + electionResult.getAverageCountingPercentage());
console.log('getStateResults: ' + electionResult.getStateResults());
console.log('getWinner: ' + electionResult.getWinner());

// llamada inicial
$(function () {
  updateResults(electionResult);
});

// por si queremos llamar esta función "frecuentemente"
window.setInterval(function () {
  updateResults(electionResult);
}, 3000);
