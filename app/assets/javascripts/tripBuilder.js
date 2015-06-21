var Trip = (function Trip() {
    var API = {
        init: function() {
            this.tripForm = $('#new_trip');
            this.destination_city = $('#trip_destination_city');
            this.destination_country = $('#trip_destination_country');
            this.origin_city = $('#trip_origin_city');
            this.origin_country = $('#trip_origin_country');
            this.timespan = $('#trip_timespan');
            this.duration = $('#trip_duration');
            this.start_date = $('#trip_start_date');
            this.end_date = $('#trip_end_date');
            // Add event listeners
            this.bindAJAXListeners();
            this.bindFocusListeners();
        },

        bindAJAXListeners: function() {
            $('#trip_destination_city').on('keyup', populateCitiesField);
            $('#trip_destination_country').on('keyup', populateDestinationCountryField);
            $('#trip_origin_city').on('keyup', populateDeparturesField);
            $('#trip_duration').on('keyup', populateTimespanField);
            $('#trip_origin_country').on('keyup', populateOriginCountryField);
            console.log("AJAX listeners bound");
        },

        bindFocusListeners: function() {
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
            console.log("focus listeners bound")
        },
    };

    return API;
})();

$(document).ready(function() {
  Trip.init();
    console.log("Trip API listeners should be bound");
});