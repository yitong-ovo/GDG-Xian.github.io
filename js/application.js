function doSiteSearch(keyword) {
  var $keyword = $('#keyword');
  $keyword.val('site:' + $keyword.data('site') + ' ' + keyword);
  $keyword.parents('form').submit(); 
}

$(function() {
  $('#input-search').on('keyup', function(evt) {
    var keyword = $.trim($(this).val());
    if (evt.keyCode == 13 && keyword) {
      doSiteSearch(keyword);
    }
  });
});