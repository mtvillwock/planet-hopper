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