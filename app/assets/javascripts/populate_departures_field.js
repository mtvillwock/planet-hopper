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