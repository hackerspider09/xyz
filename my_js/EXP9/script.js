function validateForm() {
    let isValid = true;

    let name = document.getElementById("name").value.trim();
    let address = document.getElementById("address").value.trim();
    let city = document.getElementById("city").value.trim();
    let state = document.getElementById("state").value.trim();
    let gender = document.querySelector('input[name="gender"]:checked');
    let mobile = document.getElementById("mobile").value.trim();
    let email = document.getElementById("email").value.trim();

    resetErrors();

    if (name === "" || !/^[a-zA-Z\s]+$/.test(name)) {
        document.getElementById("nameError").innerText = "Please enter a valid name.";
        isValid = false;
    }

    if (address === "") {
        document.getElementById("addressError").innerText = "Address cannot be empty.";
        isValid = false;
    }

    if (city === "" || !/^[a-zA-Z\s]+$/.test(city)) {
        document.getElementById("cityError").innerText = "Please enter a valid city";
        isValid = false;
    }

    if (state === "" || !/^[a-zA-Z\s]+$/.test(state)) {
        document.getElementById("stateError").innerText = "Please enter a valid state";
        isValid = false;
    }

    if (!gender) {
        document.getElementById("genderError").innerText = "Please select a gender.";
        isValid = false;
    }

    if (mobile === "" || !/^\d{10}$/.test(mobile)) {
        document.getElementById("mobileError").innerText = "Please enter a valid 10-digit mobile number.";
        isValid = false;
    }

    if (email === "" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        document.getElementById("emailError").innerText = "Please enter a valid email address.";
        isValid = false;
    }

    if (isValid) {
        document.getElementById("studentForm").style.display = "none";
        document.getElementById("successMessage").style.display = "block";
        document.getElementById("data").style.display = "block";
        document.getElementById("data").innerText=`Hello ${name}`;
    }

    // return false; // Prevent form submission for testing purposes
}

// Function to reset all error messages
function resetErrors() {
    let errors = document.getElementsByClassName("error");
    for (let error of errors) {
        error.innerText = "";
    }
}