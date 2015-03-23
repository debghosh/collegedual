$(document).ready ->

  changeCollege = ()->
    $('body').on 'change', '#first_college', ()->
      console.log $(this).val()

  changeCollege()
