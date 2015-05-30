
function bindEvents() {
  $('#trip_destination_city').on('keyup', populateCitiesForm);
  $('#trip_origin_city').on('keyup', populateDeparturesForm);
  console.log("events bound");
}

function populateCitiesForm(event) {
  console.log("event is: ", event);
  // event.preventDefault();
  var cityInput = $('#trip_destination_city').val();

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
      $('#cities').append("<option value='" + cities[i] + "'>" + cities[i]);
    };
  })
  .fail(function(response){
    console.log("fail: ", response);
  })
  // AJAX call sending letters from city field
  // done function appending possible cities based on server response
}

function populateDeparturesForm(event) {
  console.log("event is: ", event);
  // event.preventDefault();
  var airportInput = $('#trip_origin_city').val();

  $.ajax({
    url: '/trips/departure_airports',
    type: 'get',
    data: { airport_input: airportInput }
  })

  .done(function(response){
    var airportCities = response.airport_options;
    console.log("city strings are: ", airportCities);
    $('#trip_origin_city').empty();
    $('#trip_origin_city').append("<datalist id='airport-cities'></datalist>");
    for (var i = 0; i < airportCities.length; i++) {
      console.log(airportCities[i]);
      $('#airport-cities').append("<option value='" + airportCities[i] + "'>" + airportCities[i]);
    };
  })
  .fail(function(response){
    console.log("fail: ", response);
  })
  // AJAX call sending letters from airport
  // done function appending possible cities based on server response
}


$(document).ready(function() {
  console.log("in document ready")
  bindEvents();
});

$(document).on("page:load", bindEvents);