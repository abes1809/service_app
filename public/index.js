var HomePage = {
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
  methods: {},
  computed: {}
};

var ServicesIndexPage = {
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
  methods: {},
  computed: {}
};

var LawServicesIndexPage = {
var LawServicesIndexPage = {
  template: "#lawservices-index-page",
  data: function() {
    return {
      services: []
    };
  },
  created: function() {
    axios.get("/services?=law")
      .then(function(response) {
        this.services = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};

var SheltersIndexPage = {
var SheltersIndexPage = {
  template: "#mentalhealthservices-index-page",
  data: function() {
    return {
      services: []
    };
  },
  created: function() {
    axios.get("/services?=mental")
      .then(function(response) {
        this.services = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};

var ShelterIndexPage = {
var ShelterIndexPage = {
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
  methods: {},
  computed: {}
};


var ServicesNewPage = {
  template: "#services-new-page",
  data: function() {
    return {
      name: "",
      description: "",
      price: "",
      supplier_id: "",
      // image: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        description: this.description,
        price: this.price,
        supplier_id: this.supplierId,
        image: this.image
      };
      axios
        .post("/services", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  }
};

var ServicesShowPage = {
  template: "#services-show-page",
  data: function() {
    return {
      services: []
    };
  },
  created: function() {
    axios.get("/services/" + this.$route.params.id).then(function(response) {
        this.product = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};

var ServicesEditPage = {
  template: "#services-edit-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      supplierId: "",
      image: "",
      errors: [],
    };
  },
  created: function() {
    axios
      .patch("/services/8")
      .then(function(response){
        var product = response.data
        this.name = product.name
        this.price = product.price
        this.description = product.description
        this.supplierId = product.supplier_id
        this.image = product.image
      }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        supplier_id: this.supplierId,
        image: this.image,
      };
      axios
        .post("/prodcuts", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  }
};


var ServicesDestoryPage = {
  created: function() {
    axios.delete("/services/" + this.$route.params.id).then(function(response) {
      router.push("/");
    });
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
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
    }
  }
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
          { path: "/", component: ServicesIndexPage },
          { path: "/services", component: ServicesIndexPage },
          
          { path: "/services?=law", component: LawServicesIndexPage },
          { path: "/services?=mental", component: MentalHealthServicesIndexPage },
          { path: "/services?=shelter", component: SheltersIndexPage },

          { path: "/services/new", component: ServicesNewPage },
          { path: "/services/:id", component: ServicesShowPage },
          { path: "/services/8/edit", component: ServicesEditPage },
          { path: "/services/:id/delete", component: ServicesDestoryPage },
          { path: "/signup", component: SignupPage },
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

