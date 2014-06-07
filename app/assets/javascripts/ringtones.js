
$(document).ready(function(){
    // $('.tag_column').mouseover(function() {
    //  $(this).find('img').show();
    // });
        // $('.tag_column').mouseout(function() {
    //  $(this).find('img').hide();
    // });



    // $(".tag_column").on("mouseover", function(){
    //  $(this).find('img').show();
    // });

    // $(".tag_column").on("mouseout", function(){
    //  $(this).find('img').hide();
    // });


    // 首先 railscast 里的解决办法 live 被移除了
    //  其次只有这种绑定 doeument 的写法可以保证新添加的元素不用重新加载 script
    //  写法 1

    $(document).on({
        mouseenter: function(){
            $(this).find('img').show();
        }, 
        mouseleave: function(){
            $(this).find('img').hide();
        }
        
    }, '.tag_column');

    //  写法 2
    // $(document).on("mouseover", ".tag_column", function(){
    //  $(this).find('img').show();
    // });

    // $(document).on("mouseout", ".tag_column", function(){
    //  $(this).find('img').hide();
    // });
    
    console.log("init fileupload");
    // $("#fileupload").fileupload();

    $('#fileupload').fileupload({
      dataType: "script",
      add: function(e, data) {
        // one file toggle once
        var file, types;
        var each_progress_bar; 
        
        types = /(\.|\/)(gif|jpe?g|zip|tbz)$/i;
        file = data.files[0];
        if (types.test(file.type) || types.test(file.name)) {
          // data.context = $(tmpl("template-upload", file));
          // data.context = $("#process_area")
          data.context = $("#progress_sidebar")
          // each_progress_bar = "<div>filanem:</div><div class='progress progress-striped mini-bar'><div class='progress-bar progress-bar-success processbar-hack' style='width: 0%'><span class='sr-only'>40% Complete (success)</span></div></div>";
          each_progress_bar = "<span><div class='progress-filename'>"+ file.name + " :</div><div class='progress progress-striped mini-bar'><div class='progress-bar progress-bar-success processbar-hack' style='width: 0%'><span class='sr-only'>40% Complete (success)</span></div></div></span>";

          // $("#process_area").append(each_progress_bar);
          $("#progress_sidebar").append(each_progress_bar);
          
          return data.submit();
          } else {
            return alert("" + file.name + " is not a gif, jpeg, or png image file");
        }
      },
      progress: function(e, data) {
        var progress;
        var progress_now;
        progress = parseInt(data.loaded / data.total * 100, 10);
        console.log(data.files[0].name + " progress now: " + progress + "%");
        // data.context.find('.processbar-hack').css('width', progress + '%');
        // return false;
        if (data.context) {
                    
          progress_now = data.context.find('.progress-bar-success');
          progress_now.css('width', progress + '%');

          if (progress == 100) {
            progress_now.parent().parent().fadeOut(2000); // not work in here , but fine in console
          }

          return false;
        }
      },

    });

  
  $('#upload-menu').sidr({
    name: 'progress_sidebar',//thsi is the sidebarid
    side: 'right',
    // source: window.location.origin+'/ringtones/sidebarform.html'
    // source: "#fileupload"
    onOpen: function() {
      console.log("sidebar open");
      $("#fileupload").toggleClass('hide');
    }, 
    onClose: function() {
      $("#fileupload").toggleClass('hide');
    },

  });


});






