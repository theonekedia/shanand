jQuery(function() {
  $('#loading').hide();
  if ($('.pagination').length) {
    $('#endless_paginate').prepend('Show more');
    return $('#add_results').click(function() {
      var url;
      url = $('.pagination .next_page').attr('href');
      $('#endless_paginate').show();
      if (url) {
        $('#endless_paginate').hide();
        $('#loading').show();
        return $.getScript(url);
      }
    });
  }
});