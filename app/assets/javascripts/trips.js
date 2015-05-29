
function bindEvents() {
  addTestTripListener();
  $('#trip_destination_city').on('keyup', populateCitiesForm);
  console.log("events bound");
}

function populateCitiesForm(event) {
  console.log("event is: ", event);
  // event.preventDefault();
  var cityInput = $('#trip_destination_city').val()
  debugger
  $.ajax({
    url: '/trips/1/get_cities',
    type: 'get',
    data: { city_input: cityInput }
  })

  .done(function(response){
    console.log("done: ", response);
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