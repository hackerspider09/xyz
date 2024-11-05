let arr = [];
let n = 0;
function addToArray(){
const n = document.getElementById("arraySize").value;
const element = document.getElementById("addObject").value;
if(arr.length<n){
arr.push(element);
document.getElementById("arrayDisplay").innerText = `Array: [${arr.join(", ")}]`;
}else{
document.getElementById("arrayDisplay").innerText = `Array is Filled`;
}
}
function checkObject() {
let element = document.getElementById("checkObject").value;
const size = document.getElementById("arraysize").value;

if (element >= size || element < 0) {
    document.getElementById("array").innerText = `Index out of Bound`;
    } else {
    let val = JSON.parse(arr[element]);
    document.getElementById("array").innerText = Array.isArray(val) ? `Value at ${element} is Array` :
    `Value at ${element} is not Array`;
    }
    }