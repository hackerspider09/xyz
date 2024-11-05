function calculateTriangleArea() {
    let a = parseFloat(document.getElementById("a").value);
    let b = parseFloat(document.getElementById("b").value);
    let c = parseFloat(document.getElementById("c").value);
  
    if (a < 0 || b < 0 || c < 0) {
      document.getElementById("triangleRes").innerText = "Enter vaild value";
    } else {
      if (a + b > c && b + c > a && c + a > b) {
        let s = (a + b + c) / 2;
        let area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
  
        document.getElementById("triangleRes").innerText =
          "Area of Triangle: " + area.toFixed(2);
      } else {
        document.getElementById("triangleRes").innerText = "Enter vaild values";
      }
    }
  }
  
  function calculateRectangleArea() {
    let length = parseFloat(document.getElementById("length").value);
    let width = parseFloat(document.getElementById("width").value);
  
    if (length < 0 || width < 0) {
      document.getElementById("rectangleRes").innerText = "Enter valid value";
    } else {
      let area = length * width;
  
      document.getElementById("rectangleRes").innerText =
        "Area of Rectangle: " + area.toFixed(2);
    }
  }
  
  function calculateCircleArea() {
    let radius = parseFloat(document.getElementById("radius").value);
    let area = Math.PI * Math.pow(radius, 2);
    if (radius < 0) {
      document.getElementById("circleRes").innerText = "Enter valid value";
    } else {
      document.getElementById("circleRes").innerText =
        "Area of Circle: " + area.toFixed(2);
    }
  }
  