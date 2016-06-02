$(document).on('page:change', function() {
  // fetch initial data
  var data = [];
  $.ajax({
    url: '/posts',
    method: 'get',
    headers: {
      accept: 'application/json'
    }
  }).then(function(res) {
    // display that data
    var $el = $('#all-posts');
    data = res;
    var html = "";
    data.forEach(function(post){
      html += '<h2><a href="/posts/' + post.id + '">' + post.title + '</a></h2>';
      html += '<p>' + post.description + '</p>';
      $el.append(html);
    });
  });

});
