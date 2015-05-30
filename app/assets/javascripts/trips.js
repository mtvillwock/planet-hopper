
function bindEvents() {
  addTestTripListener();
  $('#trip_destination_city').on('keyup', populateCitiesForm);
  console.log("events bound");
}

function populateCitiesForm(event) {
  console.log("event is: ", event);
  // event.preventDefault();
  var cityInput = $('#trip_destination_city').val()

  $.ajax({
    url: '/trips/get_cities',
    type: 'get',
    data: { city_input: cityInput }
  })

  .done(function(response){
    var cities = response.city_options;
    console.log("city strings are: ", cities);
    $('#trip_destination_city').empty();
    $('#trip_destination_city').append("<datalist id='cities'></datalist>");
    for (var i = 0; i < cities.length; i++) {
      console.log(cities[i]);
      $('#cities').append("<option value='" + cities[i] + "'>");
    };
  })
  .fail(function(response){
    console.log("fail: ", response)
  })
  // AJAX call sending letters from city field
  // done function appending possible cities based on server response
}

function addTestTripListener() {
  $('.container').on('click', 'a .test', handleTestClick);
  console.log("listener added");
}

function handleTestClick() {
  console.log("here");
  event.preventDefault();

  debugger;
  console.log("remember to remove turbolinks");
  // $.ajax({
    // url: url,
    // type: 'post'
  // }).done(function(serverData){ $('.container').append(serverData)})
}


$(document).ready(function() {
  console.log("in document ready")
  bindEvents();
});

$(document).on("page:load", bindEvents);