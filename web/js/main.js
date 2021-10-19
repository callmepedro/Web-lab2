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
    $.ajax({
        type: "GET",
        url: $(this).attr('action'),
        data: "load-table",
        success: function(data)
        {
            $('#result-table tbody').empty().append(data);
        }
    });

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

    $('#main-form').submit(function(e) {
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(data)
            {
                $('#result-table tbody').empty().append(data);
            }
        });
    });

    $("#clear-button").click(function() {
        $('.svg-point').remove();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: "clear-table=true",
            success: function(data)
            {
                $('#result-table tbody').empty().append(data);
            }
        });
    })

    $('#svg-graph').on('click', function (event) {
        if (validateR()){
            let pt = this.createSVGPoint();
            pt.x = event.clientX;
            pt.y = event.clientY;
            let cursor_pt =  pt.matrixTransform(this.getScreenCTM().inverse());

            let r_value = $('#r-value').val()
            let x_value = (cursor_pt.x - 130) / 100 * r_value
            let y_value = (130 - cursor_pt.y) / 100 * r_value

            let hitResult = -1;
            $.ajax({
                type: "POST",
                url: $(this).attr('action'),
                data: `x-value=${x_value}&y-value=${y_value}&r-value=${r_value}`,
                success: function(data)
                {
                    $('#result-table tbody').empty().append(data);
                }
            });

            let element = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
            element.setAttribute('class', "svg-point")
            element.setAttribute('cx', cursor_pt.x)
            element.setAttribute('cy', cursor_pt.y)
            element.setAttribute('r', 3)
            element.setAttribute('fill', 'black')

            this.appendChild(element)
        }
    })
});
