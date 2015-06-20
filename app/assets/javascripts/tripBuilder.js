function Trip() {
  init: (function(){
    //
  }())
};

var trip = new Trip;

trip.prototype = {
  this.form = $('#new_trip');
  this.destination_city = $('#trip_destination_city').val();
  this.destination_country = $('#trip_destination_country').val();
  this.origin_city = $('#trip_origin_city').val();
  this.origin_country = $('#trip_origin_country').val();
  // need timespan, dates, etc.
}

