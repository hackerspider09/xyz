const table = document.getElementById("tableBox");

function generateForLoopTable() {
    const number = parseInt(document.getElementById("tableNumber").value);
    let html = "<p>For Loop</p>";
    for (let i = 1; i <= 10; i++) {
        html += `<p>${number} x ${i} = ${number * i}</p>`;
    }
    table.innerHTML = html;
}

function generateWhileLoopTable() {
    const number = parseInt(document.getElementById("tableNumber").value);
    let html = "<p>while Loop</p>";
    let i = 1;
    while (i <= 10) {
        html += `<p>${number} x ${i} = ${number * i}</p>`;
        i++;
    }
    table.innerHTML = html;
}

function generateDoWhileLoopTable() {
    const number = parseInt(document.getElementById("tableNumber").value);
    let html = "<p>Do while Loop</p>";
    let i = 1;
    do {
        html += `<p>${number} x ${i} = ${number * i}</p>`;
        i++;
    } while (i <= 10);
    table.innerHTML = html;
}
