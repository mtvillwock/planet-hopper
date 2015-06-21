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