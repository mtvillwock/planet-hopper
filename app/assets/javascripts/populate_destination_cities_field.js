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