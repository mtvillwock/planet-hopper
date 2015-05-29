
function bindEvents() {
  addTestTripListener();
  $('#trip_destination_city').on('keyup', populateCitiesForm);
  console.log("events bound");
}

function populateCitiesForm() {
  // event.preventDefault();
  console.log("here")
  debugger;
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