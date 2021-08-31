$(document).on('turbolinks:load', function () {
  $(function () {
    $('.js-text_field').on('keyup', function () {
        var title = $.trim($(this).val());
        $.ajax({
            type: 'GET',
            url: '/posts/searches',
            data: { title: title },
            dataType: 'json'
        })
        .done(function (data) {
            $('.js-posts li').remove();
            
            $(data).each(function (i, post) {
                $('.js-posts').append(`<li class="post"><a href="/posts/${post.id}">${post.title}</a></li>`
              );
          });
        })
    });
  });
});