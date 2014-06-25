
$(document).ready -> 
  window.log = _.bind console.log, console

  
  $(document).on
    mouseenter: ->
      $(this).find("img").show()
    mouseleave: ->
      $(this).find("img").hide()
  ,".tag_column"

  console.log "init fileupload plugin"

  $("#fileupload").fileupload
    datatype: "script"
    add: (e, data)-> 
      types = /(\.|\/)(gif|jpe?g|zip|tbz)$/i
      file = data.files[0]
      if types.test(file.type) or types.test(file.name)
        data.context = $("#progress_sidebar")
        each_progress_bar = "<span><div class='progress-filename'>" + file.name + " :</div><div class='progress progress-striped mini-bar'><div class='progress-bar progress-bar-success processbar-hack' style='width: 0%'><span class='sr-only'>40% Complete (success)</span></div></div></span>"
      
        $("#progress_sidebar").append each_progress_bar
        data.submit()
      else
        alert "" + file.name + " is not a gif, jpeg, or png image file"

    progress: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      console.log data.files[0].name + " progress now: " + progress + "%"
    
      if data.context
        progress_now = data.context.find(".progress-bar-success")
        progress_now.css "width", progress + "%"
        progress_now.parent().parent().fadeOut 2000  if progress is 100 # not    work in here , but fine in console
        false

  $("#upload-menu").sidr
    name: "progress_sidebar" #thsi is the sidebarid
    side: "right"
  
    # source: window.location.origin+'/ringtones/sidebarform.html'
    # source: "#fileupload"
    onOpen: ->
      console.log "sidebar open"
      $("#fileupload").toggleClass "hide"
      return 
    onClose: ->
      $("#fileupload").toggleClass "hide"
      return