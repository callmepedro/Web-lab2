const inputBorderColor = "91969e"
const redVtColor = "f02b4c"


function checkboxHandler(o) {
    let inputs = document.getElementsByClassName("custom-checkbox");

    for(let i = 0; i < inputs.length; i++) {
        if (inputs[i].checked && inputs[i] !== o)
            inputs[i].checked = false
    }
    o.checked = true

    let x_value = document.getElementById("x-value")
    x_value.value = o.value
}

function validateX() {
    let inputs = document.getElementsByClassName("custom-checkbox");
    let counter = 0
    for(let i = 0; i < inputs.length; i++) {
        if (inputs[i].checked)
            counter++
    }
    return counter === 1
}

function validateY() {
    let val = document.getElementById("y-value").value
    let cond = (val === "" || isNaN(val) || val <= -5 || val >= 3)

    return !cond
}

function validateR() {
    let val = document.getElementById("r-value").value
    let cond = (val === "" || isNaN(val) || val <= 1 || val >= 4)

    return !cond
}

$(document).ready(function() {
    $(document).on ("click", "#submit-button", function () {
        return validateR() && validateX() && validateY()
    });

    $("#y-value").keyup(function() {
        let val = $(this).val()

        if (val !== "" && (isNaN(val) || val <= -5 || val >= 3)) {
            $("#y-value").css("border-color", redVtColor)
        }
        else{
            $("#y-value").css("border-color", inputBorderColor)
        }
    });

    $("#r-value").keyup(function() {
        let val = $(this).val()

        if (val !== "" && (isNaN(val) || val <= 1 || val >= 4)) {
            $("#r-value").css("border-color", redVtColor)
        }
        else{
            $("#r-value").css("border-color", inputBorderColor)
        }
    });

    $("#clear-button").click(function() {
        $('.svg-point').remove();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: "clear-table=true",
            success: function(data)
            {
                $('#result-table tbody').empty();
            }
        });
    })

    $('#main-form').submit(function(e) {
        e.preventDefault();

        let form = $("#main-form")
        let x_value = form.find('input[name="x-value"]').val()
        let y_value = form.find('input[name="y-value"]').val()
        let r_value = form.find('input[name="r-value"]').val()

        let cursor_x = x_value / r_value * 100 + 130
        let cursor_y = 130 - y_value / r_value * 100

        let attrData = `x-value=${x_value}&y-value=${y_value}&r-value=${r_value}`
        postRequest(attrData).then(function (response) {
            $('#result-table tbody').append(response)
            let hitResult = response.includes("true")
            drawPoint(cursor_x, cursor_y, hitResult, 2.5)
        })
    });

    $('#svg-graph').on('click', function (event) {
        if (validateR()) {
            let pt = this.createSVGPoint();
            pt.x = event.clientX;
            pt.y = event.clientY;
            let cursor_pt = pt.matrixTransform(this.getScreenCTM().inverse());

            let r_value = $('#r-value').val()
            let x_value = (cursor_pt.x - 130) / 100 * r_value
            let y_value = (130 - cursor_pt.y) / 100 * r_value

            let attrData = `x-value=${x_value}&y-value=${y_value}&r-value=${r_value}`
            postRequest(attrData).then(function (response) {
                $('#result-table tbody').append(response)
                let hitResult = response.includes("true")
                drawPoint(cursor_pt.x, cursor_pt.y, hitResult, 2.5)
            })
        }
        else {
            alert("Сначала нужно ввести значение R")
        }
    })

    function drawPoint(x, y, hit, radius) {
        let element = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
        element.setAttribute('class', "svg-point")
        element.setAttribute('cx', x)
        element.setAttribute('cy', y)
        element.setAttribute('r', radius)
        if (hit) {
            element.setAttribute('fill', 'red')
        } else {
            element.setAttribute('fill', 'black')
        }

        document.getElementById("svg-graph").appendChild(element)
    }

    function postRequest(attrData){
        return $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: attrData,
        });
    }
});
