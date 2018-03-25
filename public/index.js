
var HomePage = {
  template: "#home-page",
  data: function() {
    return {
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SurveyPage = {
  template: "#survey-page",
  data: function() {
    return {
      lawService: "",
      mentalHealthService: "",
      shelter: "",
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      gender: "",
      sex: "",
      homelessDate: "",
      annualIncome: "",
      householdSize: "",
      domesticViolenceSurvivor: "",
      age: "",
      phoneNumber: "",
      address: "",
      city: "",
      state: "",
      zip: "",
      photoId: "",
      insurance: "",
      errors: [],
    };
  },
  methods: {
    submit: function () {

      var params = {
        law: this.lawService || false, 
        mental: this.mentalHealthService || false, 
        shelter: this.shelter || false,
        name: this.name,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        email: this.email,
        gender: this.gender,
        sex: this.sex,
        homeless_date: this.homelessDate,
        annual_income: this.annualIncome,
        household_size: this.householdSize,
        domestic_violence_survivor: this.domesticViolenceSurvivor,
        age: this.age,
        phone_number: this.phoneNumber,
        address: this.address,
        city: this.city,
        state: this.state,
        zip: this.zip,
        photo_id: this.photoId,
        insurance: this.insurance
      };

      console.log(params);

      var login_params = {
        auth: { email: this.email, password: this.password }
      };

        axios 
          .post("/users", params)
          .then(function(response) {})
          .catch(
            function(error) {
              this.errors = error.response.data.errors;
            }.bind(this)
          ).then(function() { 
          axios
            .post("/user_token", login_params)
            .then(function(response) {
              axios.defaults.headers.common["Authorization"] =
                "Bearer " + response.data.jwt;
              localStorage.setItem("jwt", response.data.jwt);
              router.push("/user_services");
            })
            .catch(
              function(error) {
                this.errors = ["Invalid email or password."];
                this.email = "";
                this.password = "";
              }.bind(this)
            )})
            
    },
  },
};

var MatchPage = {
  template: "#match-page",
  data: function() {
    return {
      lawService: "",
      mentalHealthService: "",
      shelter: "",
    };
  },
  created: function() {},
  methods: {
    submit: function () {
      var categories = {law: this.lawService || false, mental: this.mentalHealthService || false, shelter: this.shelter || false};

      console.log(categories);

      axios 
        .post("/user_services", categories)
        .then(function(response) {
          router.push("/user_services");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ServicesIndexPage = {
  template: "#services-index-page",
  data: function() {
    return {
      law_services: [],
      mental_health_services: [],
      shelters: [],
      user_services:[],
    };
  },
  created: function() {
    axios.get("/law_services").then(function(response){
      this.law_services=response.data;
    }.bind(this));
    axios.get("/shelters").then(function(response){
      this.shelters=response.data;
    }.bind(this));
    axios.get("/mental_health_services").then(function(response){
      this.mental_health_services=response.data;
    }.bind(this));
    axios.get("/user_services").then(function(response){
      this.user_services=response.data;
      console.log(this.user_services);
    }.bind(this));
  },

  methods: {
    showMatchedServices: function(service) {
      match = false

      this.user_services.forEach(function (user_service) {
        if (service.type == user_service.servicable_type) {
          if (service.id == user_service.servicable_id ) {
            match = true;
          }
        }
      });

      if (match == true) {
        return true;
      }
      else if (match == false) {
        return false;
      }
    },
  },
  computed: {}

};

var LawServicesShowPage = {
  template: "#law_services-show-page",

  data: function() {
    return {
      law_service: [],

      mapName: this.name + "-map",
    };
  },

  created: function() {
    axios.get("/law_services/" + this.$route.params.id).then(function(response) {
        this.law_service = response.data;
      }.bind(this));
  },  

  updated: function () {
      this.$nextTick(function () {

      console.log("UGH")

        var service = {
                    latitude: this.law_service.latitude,
                    longitude: this.law_service.longitude,
                    name: this.law_service.name,
                    address: this.law_service.full_address,
                    type: this.law_service.type,
        };
        console.log(service);

        var mapCenter = {lat: service["latitude"], lng: service["longitude"]};

        var mapOptions = {
                          zoom: 12,
                          center: mapCenter,
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

        var map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
        
        var contentString = "<div style = 'width:300px;min-height:10px'>" + "Name: " + service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";

         var infoWindow = new google.maps.InfoWindow({
           content: contentString
         });

        var marker = new google.maps.Marker({ 
          position: mapCenter,
          map,
          title: service["name"]
        });

        marker.addListener('click', function() {
                 infoWindow.open(map, marker);
               });

        });

    },

  methods: {
    toggleMessageBox: function () {
          var element = document.getElementById("message-input");
          element.classList.toggle("hidden");
      },
  },
  computed: {}
};

var SheltersShowPage = {
  template: "#shelters-show-page",

  data: function() {
    return {
      shelter: [],

      mapName: this.name + "-map",
    };
  },

  created: function() {
    axios.get("/shelters/" + this.$route.params.id).then(function(response) {
        this.shelter = response.data;
      }.bind(this));
  },  

  updated: function () {
      this.$nextTick(function () {

      console.log("UGH")

        var service = {
                    latitude: this.shelter.latitude,
                    longitude: this.shelter.longitude,
                    name: this.shelter.name,
                    address: this.shelter.full_address,
                    type: this.shelter.type,
        };
        console.log(service);

        var mapCenter = {lat: service["latitude"], lng: service["longitude"]};

        var mapOptions = {
                          zoom: 12,
                          center: mapCenter,
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

        var map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
        
        var contentString = "<div style = 'width:300px;min-height:10px'>" + "Name: " + service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";

         var infoWindow = new google.maps.InfoWindow({
           content: contentString
         });

        var marker = new google.maps.Marker({ 
          position: mapCenter,
          map,
          title: service["name"]
        });

        marker.addListener('click', function() {
                 infoWindow.open(map, marker);
               });

        });

    },

  methods: {
    toggleMessageBox: function () {
          var element = document.getElementById("message-input");
          element.classList.toggle("hidden");
      },
  },
  computed: {}
};

var MentalHealthServicesShowPage = {
  template: "#mental-health-services-show-page",

  data: function() {
    return {
      mental_health_service: [],

      mapName: this.name + "-map",
    };
  },

  created: function() {
    axios.get("/mental_health_services/" + this.$route.params.id).then(function(response) {
        this.mental_health_service = response.data;
      }.bind(this));
  },  

  updated: function () {
      this.$nextTick(function () {

      console.log("UGH")

        var service = {
                    latitude: this.mental_health_service.latitude,
                    longitude: this.mental_health_service.longitude,
                    name: this.mental_health_service.name,
                    address: this.mental_health_service.full_address,
                    type: this.mental_health_service.type,
        };
        console.log(service);

        var mapCenter = {lat: service["latitude"], lng: service["longitude"]};

        var mapOptions = {
                          zoom: 12,
                          center: mapCenter,
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

        var map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
        
        var contentString = "<div style = 'width:300px;min-height:10px'>" + "Name: " + service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";

         var infoWindow = new google.maps.InfoWindow({
           content: contentString
         });

        var marker = new google.maps.Marker({ 
          position: mapCenter,
          map,
          title: service["name"]
        });

        marker.addListener('click', function() {
                 infoWindow.open(map, marker);
               });

        });

    },

  methods: {
    toggleMessageBox: function () {
          var element = document.getElementById("message-input");
          element.classList.toggle("hidden");
      },
  },
  computed: {}
};

var UserServicesIndexPage = {
  template: "#user-services-index-page",
  data: function() {
    return {
      user_services: [],
      user_id: this.user_id,
      errors: [],
      sortAscending: true,
      optionMiles: 30,
      filterType: "all",

      mapName: this.name + "-map",
    };
  },
  created: function() {
    axios.get("/user_services")
      .then(function(response) {
        this.user_services = response.data;
        this.user_id = response.data[0].user_id;
      }.bind(this))
      .catch(
        function(error) {
          this.errors = error.response.data.errors;
          router.push("/login");
        }.bind(this)
      );

    },

    updated: function () {
        this.$nextTick(function () {
          console.log(this.user_id);

        service_data = []

        this.user_services.forEach(function(service) {
          var data = {
                      latitude: service.latitude,
                      longitude: service.longitude,
                      name: service.name,
                      address: service.full_address,
                      type: service.servicable_type,
                      distance: service.distance
          }
          service_data.push(data)
        });


        var userData = {
                        latitude: this.user_services[0].user_latitude,
                        longitude: this.user_services[0].user_longitude,
                        address: this.user_services[0].user_full_address,
                        type: "user"

        };

        service_data.push(userData);

        var length = service_data.length 
        var index = 0 

        const bounds = new google.maps.LatLngBounds();

        const mapOptions = {
                          zoom: 20,
                          center: new google.maps.LatLng(service_data[0]["latitude"], service_data
                          [0]["longitude"]),
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

        const map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
        var infoWindow = new google.maps.InfoWindow();

        service_data.forEach(function(service){
            const position = new google.maps.LatLng(service["latitude"], service["longitude"]);

            if (service.type == "user") {
              var marker = new google.maps.Marker({ 
                position,
                map,
                title: "Your Input Address",
                icon: "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png",
              });
              var content = "<div style = 'width:300px;min-height:10px'>" + "Your disclosed address/location" + "</div>"; 
            }

            else if (service.type == "LawService") {
              var marker = new google.maps.Marker({ 
                position,
                map,
                title: service["name"],
                icon: "http://maps.google.com/mapfiles/ms/icons/purple-dot.png"
              });
              var content = "<div style = 'width:300px;min-height:10px'>" + "Name: " +service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";
            }

            else if (service.type == "MentalHealthService") {
              var marker = new google.maps.Marker({ 
                position,
                map,
                title: service["name"],
                icon: "http://maps.google.com/mapfiles/ms/icons/red-dot.png"
              });
              var content = "<div style = 'width:300px;min-height:10px'>" + "Name: " +service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";
            }

            else if (service.type == "Shelter") {
              var marker = new google.maps.Marker({ 
                position,
                map,
                title: service["name"],
                icon: "http://maps.google.com/mapfiles/ms/icons/orange-dot.png"
              });
              var content = "<div style = 'width:300px;min-height:10px'>" + "Name: " +service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";
            }

            map.fitBounds(bounds.extend(position));

            index = index += 1;
            (function (marker, service) {
                   google.maps.event.addListener(marker, "click", function (e) {
                       infoWindow.setContent(content);
                       infoWindow.open(map, marker);
                   });
               })(marker, service);

          });

      });

    },

    methods: {
      filterDistance:function(user_service) {
        
        if (parseFloat(user_service.distance) < this.optionMiles) {
          return true;
        }
          return false;
      },

      filterServiceType:function(user_service) {
        if (this.filterType == "all") {
          return true 
        }
        else { 
          if (user_service.servicable_type == this.filterType) {
            return true;
          }
            return false;
        }

      },

    },
    computed: {

      sortedServiceDistances: function() {

        return this.user_services.sort(function(service1, service2) {
          if (this.sortAscending) {
            return service1.distance - service2.distance;
          }
          else {
            return service2.distance - service1.distance;
          }
        }.bind(this));
      }
    },
};

var UserServicesShowPage = {
  template: "#user-services-show-page",

  data: function() {
    return {
      user_service: [],

      notes: "",
      status: "",

      mapName: this.name + "-map",
    };
  },

  created: function() {
    axios.get("/user_services/" + this.$route.params.id).then(function(response) {
        this.user_service = response.data
        this.status = response.data.status;
      }.bind(this));
  },  

  updated: function () {
      this.$nextTick(function () {

      console.log("UGH")

        var service_data = [{
                    latitude: this.user_service.latitude,
                    longitude: this.user_service.longitude,
                    name: this.user_service.name,
                    address: this.user_service.full_address,
                    type: this.user_service.servicable_type,
                    distance: this.user_service.distance
        }]

        var userData = {
                        latitude: this.user_service.user_latitude,
                        longitude: this.user_service.user_longitude,
                        address: this.user_service.user_full_address,
        }
        service_data.push(userData);

        var length = service_data.length 
        var index = 0 

        const bounds = new google.maps.LatLngBounds();

        const mapOptions = {
                          zoom: 20,
                          center: new google.maps.LatLng(service_data[0]["latitude"], service_data[0]
                          ["longitude"]),
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

        const map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
        var infoWindow = new google.maps.InfoWindow();

        service_data.forEach(function(service){
            const position = new google.maps.LatLng(service["latitude"], service["longitude"]);
            console.log(service);

            if (index === 1) {
              var marker = new google.maps.Marker({ 
                position,
                map,
                title: "Your Input Address",
                icon: "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png",
              });
              var content = "<div style = 'width:300px;min-height:10px'>" + "Your disclosed address/location" + "</div>"; 
            }
            else {
              var marker = new google.maps.Marker({ 
                position,
                map,
                title: service["name"]
              });
              var content = "<div style = 'width:300px;min-height:10px'>" + "Name: " + service.name + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Address: " + service.address + "</div>" + "<div style = 'width:250px;min-height:10px'>" + "Service Type: " + service.type + "</div>";
            }

            map.fitBounds(bounds.extend(position));

            index = index += 1;
            (function (marker, service) {
                   google.maps.event.addListener(marker, "click", function (e) {
                       infoWindow.setContent(content);
                       infoWindow.open(map, marker);
                   });
               })(marker, service);

            });

        });

    },

  methods: {

  updateNotes: function() {
        var params = {
          notes: this.notes,
        };

        axios
          .patch("/user_services/" + this.$route.params.id, params)
          .then(function(response) {
            router.push("/user_services/" + this.$route.params.id);
          }.bind(this))
          .catch(
            function(error) {
              this.errors = error.response.data.errors;
            }.bind(this)
          );
      },

  updateStatus: function(new_status) {
        this.status = new_status;
        axios
          .patch("/user_services/" + this.$route.params.id, {status: new_status})
          .then(function(response) {
            router.push("/user_services/" + this.$route.params.id);
          }.bind(this))
          .catch(
            function(error) {
              this.errors = error.response.data.errors;
            }.bind(this)
          );
          

      },

  toggleNoteBox: function () {
        var element = document.getElementById("notes-input");
        element.classList.toggle("hidden");
    },
  toggleMessageBox: function () {
        var element = document.getElementById("message-input");
        element.classList.toggle("hidden");
    },

  sendText: function() {
        var params = {
          full_address: this.user_service.full_address,
          phone_number: this.user_service.phone_number,
          website: this.user_service.website,
          zip: this.user_service.zip,

        };

        axios
          .post("/user_text/", params)
          .then(function(response) {
            router.push("/user_services/" + this.$route.params.id);
          }.bind(this))
          .catch(
            function(error) {
              this.errors = error.response.data.errors;
            }.bind(this)
          );
      },  
      
  },
  computed: {}
};

var UserUpdatePage = {
  template: "#user-update-page",
  data: function() {
    return {
      user: {},
      user_services: [],
      lawService: "",
      mentalHealthService: "",
      shelter: "",
      name: null,
      email: null,
      gender: null,
      sex: null,
      annualIncome: null,
      householdSize: null,
      domesticViolenceSurvivor: null,
      age: null,
      phoneNumber: null,
      address: null,
      city: null,
      state: null,
      zip: null,
      password: null,
      rematch: "no",
      errors: [],
    };
  },
  created: function() {
    axios
      .get("/users/" + this.$route.params.id)
      .then(function(response) {
        console.log("DOING STUFF")
        this.user = response.data;
        console.log(this.user)
      }.bind(this));
  },
  methods: {
    toggleInputBox: function (inputBoxNumber) {
      console.log(inputBoxNumber);
          var element = document.getElementById(inputBoxNumber);
          element.classList.toggle("hidden");
      },
    submit: function() {
      var params = {
        law: this.lawService || false, 
        mental: this.mentalHealthService || false, 
        shelter: this.shelter || false,
        name: this.name,
        email: this.email,
        gender: this.gender,
        sex: this.sex,
        annual_income: this.annualIncome,
        household_size: this.householdSize,
        domestic_violence_survivor: this.domesticViolenceSurvivor,
        age: this.age,
        password: this.password,
        phone_number: this.phoneNumber,
        address: this.address,
        city: this.city,
        state: this.state,
        zip: this.zip,
        rematch: this.rematch
      };

      console.log("params:");
      console.log(params);
      axios
        .patch("/users/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/user_services/");
          console.log(response.data);
          // var user = response.data;
          // this.name = user.name;
          // the others

        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


// var ProvidersCreatePage = {
//   template: "#providers-create-page",
//   data: function() {
//     return {
//       lawService: "",
//       mentalHealthService: "",
//       shelter: "",
//       name: "",
//       message: "welcome",
//     };
//   },
//   created: function() {},
//   methods: {
//     submit: function() {
//       var params = {
//         law: this.lawService || false, 
//         mental: this.mentalHealthService || false, 
//         shelter: this.shelter || false,
//         name: this.name,
//       };

//       axios 
//         .post("/users", params)
//         .then(function(response) {})
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this))
//     },
//   },
//   computed: {}
// };


var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/user_services");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
          { path: "/", component: HomePage },
          { path: "/#/", component: HomePage },
          { path: "/users/:id", component: UserUpdatePage },

          { path: "/law_services/:id", component: LawServicesShowPage },
          { path: "/shelters/:id", component: SheltersShowPage },
          { path: "/mental_health_services/:id", component: MentalHealthServicesShowPage },

          { path: "/survey-page", component: SurveyPage},
          { path: "/match-page", component: MatchPage},

          { path: "/services/", component: ServicesIndexPage },

          { path: "/user_services/:id", component: UserServicesShowPage },
          { path: "/user_services", component: UserServicesIndexPage },

          // { path: "/provider_create", component: ProvidersCreatePage },
          { path: "/login", component: LoginPage },
          { path: "/logout", component: LogoutPage },

          ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,

  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  },

  mounted: function () {
    this.$nextTick(function () {
      document.addEventListener('keyup', this.exit);
    })
  },

  methods: {
    exit: function() {
      if (event.keyCode === 27) {
          window.location.href = "https://www.google.com/";
        }
    }

  },

});





