jQuery ->
  ready = ()->
    $(".selectize").each (i, el)->
      $(el).selectize({maxItems: $(el).data("max-items") || null})
  ready()

  $(document).on("page:load", ready)