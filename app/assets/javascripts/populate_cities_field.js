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