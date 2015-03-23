$(document).ready ->

  changeQuestion = ()->

    $("body").on "click", '.sort_paginate_ajax th a, .sort_paginate_ajax .pagination a', () ->
      $.getScript(this.href)
      return false

  changeQuestion()