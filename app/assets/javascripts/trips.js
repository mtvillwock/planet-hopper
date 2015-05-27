$(document).ready(bindEvents);

function bindEvents() {
  addTestTripListener();
  console.log("events bound")
}

function addTestTripListener() {
  $('.container').on('click', '.test', handleTestClick);
}

function handleTestClick() {
  event.preventDefault();

  debugger;
  console.log("remember to remove turbolinks");
  // $.ajax({
    // url: url,
    // type: 'post'
  // }).done(function(serverData){ $('.container').append(serverData)})
}