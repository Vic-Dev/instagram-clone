// fetch initial data
var data = [];

function displayResults() {
  var $el = $('#all-posts');
  $el.html('');

  data.forEach(function(post){
    var html = "";
    html += '<h2><a href="/posts/' + post.id + '">' + post.title + '</a></h2>';
    html += '<p>' + post.description + '</p>';
    $el.append(html);
  });
}

function fetchResults() {
  $.ajax({
    url: '/posts',
    method: 'get',
    headers: {
      accept: 'application/json'
    }
  }).then(function(res){
    data = res;
    displayResults();
  });
}

$(document).on('page:change', function() {

  fetchResults();

  setInterval(function(){
    fetchResults();
  }, 1000);

  $('#add-post').on('click', function() {
    $('#new').toggleClass('show');
    $('#full-page').toggleClass('dark');
  });

  $('#new-post-form').on('submit', function(e) {
    e.preventDefault();
    // fetch form values
    var post = {
      title: $('#title').val(),
      description: $('#description').val()
    }

    $.ajax({
      url: '/posts',
      method: 'POST',
      headers: {
        accept: 'application/json'
      },
      data: {post: post}
    }).then(function(res) {
      fetchResults();
      $('#new').toggleClass('show');
      $('#full-page').toggleClass('dark');
    });
  });

});
