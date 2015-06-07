function bindEvents() {
    $('#trip_destination_city').on('keyup', populateCitiesField);
    $('#trip_destination_country').on('keyup', populateDestinationCountryField);
    $('#trip_origin_city').on('keyup', populateDeparturesField);
    $('#trip_duration').on('keyup', populateTimespanField);
    $('#trip_origin_country').on('keyup', populateOriginCountryField);
    console.log("events bound");
    $('#trip_destination_country').on("focus", function() {
        $('.trip-duration').show();
    });
    $('#trip_duration').on("focus", function() {
        populateTimespanField();
    });
    $('#trip_timespan').on("focus", function() {
        $('.trip-airport').show();
    });
    $('#trip_origin_city').on("focus", function() {
        $('.trip-passport').show();
    });
    $('#trip_origin_country').on("focus", function() {

        $('.trip-submit').show();
    });
}

function populateCitiesField(e) {
    console.log("e is: ", e);
    // e.preventDefault();
    var cityInput = $('#trip_destination_city').val();

    $.ajax({
        url: '/trips/get_cities',
        type: 'get',
        data: {
            city_input: cityInput
        }
    })

    .done(function(response) {
        var cities = response.city_options;
        console.log("city strings are: ", cities);
        $('#trip_destination_city').empty();
        $('#trip_destination_city').append("<datalist id='cities'></datalist>");
        for (var i = 0; i < cities.length; i++) {
            console.log(cities[i]);
            $('#cities').append("<option value='" + cities[i] + "'>" + cities[i]);
        };
    })
        .fail(function(response) {
            console.log("fail: ", response);
        })
    // AJAX call sending letters from city field
    // done function appending possible cities based on server response
}

function populateDeparturesField(e) {
    console.log("e is: ", e);
    // e.preventDefault();
    var airportInput = $('#trip_origin_city').val();

    $.ajax({
        url: '/trips/departure_airports',
        type: 'get',
        data: {
            airport_input: airportInput
        }
    })

    .done(function(response) {
        var airportCities = response.airport_options;
        console.log("city strings are: ", airportCities);
        $('#trip_origin_city').empty();
        $('#trip_origin_city').append("<datalist id='airport-cities'></datalist>");
        for (var i = 0; i < airportCities.length; i++) {
            console.log(airportCities[i]);
            $('#airport-cities').append("<option value='" + airportCities[i] + "'>" + airportCities[i]);
        };
    })
        .fail(function(response) {
            console.log("fail: ", response);
        })
}

function populateTimespanField(e) {
    console.log("e is: ", e);
    // e.preventDefault();
    var timespanInput = document.getElementById('trip_timespan').value;

    $.ajax({
        url: '/trips/timespans',
        type: 'get',
        data: {
            timespan: timespanInput
        }
    })

    .done(function(response) {
        var timespans = response.timespan_options;
        console.log("timespans is: ", timespans);
        $('#trip_timespan').empty();
        $('#trip_timespan').append("<datalist id='timespans'></datalist>");
        for (var i = 0; i < timespans.length; i++) {
            console.log(timespans[i]);
            $('#timespans').append("<option value='" + timespans[i] + "'>" + timespans[i]);
        };
    })
        .fail(function(response) {
            console.log("fail: ", response);
        })
}

function populateDestinationCountryField(e){
  console.log("e is: ", e);
    // e.preventDefault();
    var input = document.getElementById('trip_destination_country').value;

    $.ajax({
        url: '/trips/destination_countries',
        type: 'get',
        data: {
            destination_country: input
        }
    })

    .done(function(response) {
        var destination_countries = response.country_options;
        console.log("response is: ", destination_countries);
        $('#trip_destination_country').empty();
        $('#trip_destination_country').append("<datalist id='destination_countries'></datalist>");
        for (var i = 0; i < destination_countries.length; i++) {
            console.log(destination_countries[i]);
            $('#destination_countries').append("<option value='" + destination_countries[i] + "'>" + destination_countries[i]);
        };
    })
        .fail(function(response) {
            console.log("fail: ", response);
        })
}
function populateOriginCountryField(e){
  console.log("e is: ", e);
    // e.preventDefault();
    var input = document.getElementById('trip_origin_country').value;

    $.ajax({
        url: '/trips/origin_countries',
        type: 'get',
        data: {
            origin_country: input
        }
    })

    .done(function(response) {
        var origin_countries = response.country_options;
        console.log("response is: ", origin_countries);
        $('#trip_origin_country').empty();
        $('#trip_origin_country').append("<datalist id='origin_countries'></datalist>");
        for (var i = 0; i < origin_countries.length; i++) {
            console.log(origin_countries[i]);
            $('#origin_countries').append("<option value='" + origin_countries[i] + "'>" + origin_countries[i]);
        };
    })
        .fail(function(response) {
            console.log("fail: ", response);
        })
}



$(document).ready(function() {
    console.log("in document ready")
    bindEvents();
});

$(document).on("page:load", bindEvents);