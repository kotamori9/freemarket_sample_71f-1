$(function(){
  $('#address_postal_code').jpostal({
  postcode : [ "#address_postal_code" ],
  address  : {
                "#address_prefecture" : "%3",
                "#address_city"            : "%4",
                "#address_address_number"          : "%5%6%7"
              }
  });
});