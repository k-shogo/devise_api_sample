$ ->
  $('#generate_authentication_token')
    .on 'ajax:complete', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      $('#authentication_token').val response.authentication_token
  $('#delete_authentication_token')
    .on 'ajax:complete', (event, ajax, status) ->
      $('#authentication_token').val ''
