entry_modal = ->
  $('.icon-comment').on 'click', (e) ->
    vals = $(e.target).data('entry').split('-')
    $.get '/student/' + vals[0] + '/entry/' + vals[1], (data) ->
      $('#entry-modal > .modal-body').html data
      $('#entry-modal').modal()


$(document).ready entry_modal
$(document).on 'page:load page:restore', entry_modal
