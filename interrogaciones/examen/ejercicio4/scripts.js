$(function () {
  $('#menu').on('click', 'a', function () {
    $('#menu .results').hide();
    var $menuItem = $(this);
    var $results = $menuItem.find('.results');
    var results = $menuItem.data('results');
    if (!$results.length) {
      var $voteIntention = $('<div></div>').html('Intención de voto: ' + results.voteIntention);
      var $approval = $('<div></div>').html('Aprobación: ' + results.approval.approve);
      $results = $('<div></div>').addClass('results').append($voteIntention).append($approval).appendTo($menuItem);
    }
    $results.show();
  });
});
