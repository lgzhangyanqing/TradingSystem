var Script = function () {


    $().ready(function() {
        // validate the comment form when it is submitted
        $("#login-form").validate({
          rules: {
              j_username: {
                  required: true,
                  minlength: 2
              },
              j_password: {
                  required: true,
                  minlength: 5
              }
          },
          messages: {                
          	  j_username: {
                  required: "Please enter a Username.",
                  minlength: "Your Username must consist of at least 2 characters long."
              },
              j_password: {
                  required: "Please enter a Password.",
                  minlength: "Your Password must consist of at least 5 characters long."
              }
          }
        });
        $("#register-form").validate({
            rules: {
            	userName: {
                    required: true,
                    minlength: 2
                },
                lastName: {
                    required: true,
                    minlength: 2
                },
                firstName: {
                    required: true,
                    minlength: 2
                },
                passWord: {
                    required: true,
                    minlength: 5
                },
                confirm_password: {
                    required: true,
                    minlength: 5,
                    equalTo: "#j_passWord"
                },
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {                
            	userName: {
                    required: "Please enter a Username.",
                    minlength: "Your Username must consist of at least 2 characters long."
                },
                lastName: {
                    required: "Please enter a Lastname.",
                    minlength: "Your Lastname must consist of at least 2 characters long."
                },
                firstName: {
                    required: "Please enter a Firstname.",
                    minlength: "Your Firstname must consist of at least 2 characters long."
                },
                passWord: {
                    required: "Please provide a password.",
                    minlength: "Your password must be at least 5 characters long."
                },
                confirm_password: {
                    required: "Please provide a password.",
                    minlength: "Your password must be at least 5 characters long.",
                    equalTo: "Please enter the same password as above."
                },
                email: "Please enter a valid email address.",
            }
        });

        // propose username by combining first- and lastname
        $("#username").focus(function() {
            var firstname = $("#firstname").val();
            var lastname = $("#lastname").val();
            if(firstname && lastname && !this.value) {
                this.value = firstname + "." + lastname;
            }
        });

        //code to hide topic selection, disable for demo
        var newsletter = $("#newsletter");
        // newsletter topics are optional, hide at first
        var inital = newsletter.is(":checked");
        var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
        var topicInputs = topics.find("input").attr("disabled", !inital);
        // show when newsletter is checked
        newsletter.click(function() {
            topics[this.checked ? "removeClass" : "addClass"]("gray");
            topicInputs.attr("disabled", !this.checked);
        });
    });


}();