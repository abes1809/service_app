
var HomePage = {
  template: "#home-page",
  data: function() {
    return {
    };
  },
  created: function() {},
  methods: {

  },
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
      errors: [],
    };
  },
  methods: {
    submit: function () {

      // var service_params = {
      //                       lawService: this.lawService,
      //                       shelter: this.shelter,
      //                       mentalHealthService: this.mentalHealthService
      //                       }


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
        zip: this.zip
        
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
      shelters: []
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
  },

};

var UserServicesIndexPage = {
  template: "#user-services-index-page",
  data: function() {
    return {
      user_services: [],
      errors: [],
      coordinates: this.coordinates, 
      mapName: this.name + "-map",
      map: null,
      bounds: null,
      markers: [],
    };
  },
  created: function() {
    axios.get("/user_services")
      .then(function(response) {
        this.user_services = response.data;
        var coordinates = [];
        response.data.forEach(function(service) { 
          var coordinate = {latitude: service.latitude, longitude: service.longitude}
          coordinates.push(coordinate)
        });
        this.coordinates = coordinates;
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

        this.bounds = new google.maps.LatLngBounds();

        const mapCentre = ({lat: this.coordinates[0]["latitude"], long: this.coordinates[0]["longitude"]})

        const mapOptions = {
                          zoom: 15,
                          center: new google.maps.LatLng(mapCentre['lat'], mapCentre["long"]),
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

        this.map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);


        // const markers = []

        this.coordinates.forEach(function(coord){
            const position = new google.maps.LatLng(coord["latitude"], coord["longitude"]);
            const marker = new google.maps.Marker({ 
              position,
              map: this.map
            });
            console.log({lat: coord["latitude"], long: coord["longitude"]});
            console.log(marker);
            this.markers.push(marker)
              this.map.fitBounds(this.bounds.extend(position))
          });
              // var map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
              // var marker = new google.maps.Marker({
              //   position: service_marker,
              //   map: map
              // });

      });

    },
};


var UserServicesShowPage = {
  template: "#user-services-show-page",
  name: 'google-map',
  props: ['name'],

  data: function() {
    return {
      user_service: [],
      lat: this.latitude,
      log: this.longitude,

      notes: "",
      status: "",

      mapName: this.name + "-map",
      map: null,
    };
  },

  created: function() {
    axios.get("/user_services/" + this.$route.params.id).then(function(response) {
        this.user_service = response.data
        this.latitude = response.data.latitude
        this.longitude = response.data.longitude
        this.status = response.data.status;
      }.bind(this));
  },  

  updated: function () {
      this.$nextTick(function () {

      console.log("UGH")

        var service_marker = {lat: this.latitude, lng: this.longitude}

        var mapOptions = {
                          zoom: 15,
                          center: service_marker,
                          styles: [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}],
                        }

              var map = new google.maps.Map(document.getElementById(this.mapName), mapOptions);
              var marker = new google.maps.Marker({
                position: service_marker,
                map: map
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
            router.push("/user_services/" + response.data.id);
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
        element.classList.toggle("user-services-buttons");
    },
  toggleMessageBox: function () {
        var element = document.getElementById("message-input");
        element.classList.toggle("user-services-buttons");
    },
      
  },
  computed: {}
};

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
          { path: "/survey-page", component: SurveyPage},
          { path: "/match-page", component: MatchPage},

          { path: "/user_services/:id", component: UserServicesShowPage },
          { path: "/services/", component: ServicesIndexPage },

          { path: "/user_services", component:UserServicesIndexPage },

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

});

// var gMap = new Vue({
//   el: "#google-map",
//   props: ['name'],
//   data: function () {
//     return {
//       mapName: this.name + "-map",
//     }
//   },
//   mounted: function () {
//     const element = document.getElementById(this.mapName)
//     const options = {
//       zoom: 14,
//       center: new google.maps.LatLng(51.501527,-0.1921837)
//     }
//     const map = new google.maps.Map(element, options);
//   }

// });




