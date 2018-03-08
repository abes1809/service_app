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
      errors: []
    };
  },
  methods: {
    submit: function () {
      var params = {
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
      };
      axios 
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    },
  }
};

var ServicesIndexPage = {
  template: "#services-index-page",
  data: function() {
    return {
      services: []
    };
  },
  created: function() {
    axios.get("/services")
      .then(function(response) {
        this.services = response.data;
      }.bind(this));
  },
};

// var ServiceIndexPage = {
//   template: "#home-page",
//   data: function() {
//     return {
//     };
//   },
//   created: function() {},
//   methods: {},
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
          router.push("/");
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
          { path: "/#", component: HomePage },
          { path: "/survey-page", component: SurveyPage},

          { path: "/services", component: ServicesIndexPage },
          
          // { path: "/services?=law", component: LawServicesIndexPage },
          // { path: "/services?=mental", component: MentalHealthServicesIndexPage },
          // { path: "/services?=shelter", component: SheltersIndexPage },

          // { path: "/services/new", component: ServicesNewPage },
          // { path: "/se,rvices/:id", component: ServicesShowPage },
          // { path: "/services/8/edit", component: ServicesEditPage },
          // { path: "/services/:id/delete", component: ServicesDestoryPage },
          // { path: "/signup", component: SignupPage },
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
  }
});

