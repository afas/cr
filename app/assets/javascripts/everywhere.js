$(document).ready(function () {
    if ($("select").length > 0) {
        $("select").selectBox();
    }

    if ($("#search-panel").length > 0) {
        $("#search-panel").draggable();

        $("#search-button").click(function () {
            runEffect();
            return false;
        });

        if (getCookieValue("search-panel") != "hide") {
            $("#search-panel").show();
            $("#search-button").html("Скрыть фильтр");
        } else {
            $("#search-button").html("Показать фильтр");
        }
    }

    if ($(".auto_metro").length > 0) {
        $(".auto_metro")
            .autocomplete({
                source:function (request, response) {
                    $.getJSON("/metros/by_metro", {
                        term:extractLast(request.term)
                    }, response);
                },
                search:function () {
                    var term = extractLast(this.value);
                    if (term.length < 2) {
                        return false;
                    }
                },
                select:function (event, ui) {
                    var terms = split(this.value);
                    terms.pop();
                    this.value = ui.item.value;
                    $(this).attr("object_name", ui.item.object);
                    $(this).attr("object_id", ui.item.id);
                    return false;
                }
            });
    }

    if ($(".auto_street").length > 0) {
        $(".auto_street")
            .autocomplete({
                source:function (request, response) {
                    $.getJSON("/flats/by_street", {
                        term:extractLast(request.term)
                    }, response);
                },
                search:function () {
                    var term = extractLast(this.value);
                    if (term.length < 2) {
                        return false;
                    }
                },
                select:function (event, ui) {
                    var terms = split(this.value);
                    terms.pop();
                    this.value = ui.item.value;
                    $(this).attr("object_name", ui.item.object);
                    $(this).attr("object_id", ui.item.id);
                    return false;
                }
            });
    }
});

function split(val) {
    return val.split(/,\s*/);
}

function extractLast(term) {
    return split(term).pop();
}

function validateAndGet(name, params) {
    value = $("#" + name).val();

    if (value && value != "undefined" && value != "") {
        if (params != "") {
            params = params + "&" + name + "=" + value
        } else {
            params = name + "=" + value
        }
    }
    return params;
}

function searchResults() {
    var params = "";
    params = validateAndGet("flat_rooms_count", params);
    params = validateAndGet("flat_rent_period", params);
    params = validateAndGet("flat_prepayment", params);
    params = validateAndGet("metro", params);
    params = validateAndGet("address", params);
    params = validateAndGet("flat_balkon", params);
    params = validateAndGet("living_space", params);
    params = validateAndGet("price_from", params);
    params = validateAndGet("price_to", params);
    params = validateAndGet("flat_flats_order", params);

    if (params != "") {
        $.get('/search.json/?' + params, function (newItemData) {
            Gmaps.map.replaceMarkers(newItemData);
        });
    }
}

function searchResultsList() {
    var params = "";
    params = validateAndGet("flat_rooms_count", params);
    params = validateAndGet("flat_rent_period", params);
    params = validateAndGet("flat_prepayment", params);
    params = validateAndGet("metro", params);
    params = validateAndGet("address", params);
    params = validateAndGet("flat_balkon", params);
    params = validateAndGet("living_space", params);
    params = validateAndGet("price_from", params);
    params = validateAndGet("price_to", params);
    params = validateAndGet("flat_flats_order", params);

    if (params != "") {
        window.location = "/flats?" + params;
    }
}

function runEffect() {
    hidden = getCookieValue("search-panel") == "hide";
    if (hidden) {
        $("#search-panel").show();
        callbackEffect();
    } else {
        speed = 500;
        options = { to:"#search-button", className:"search-panel" };
        $("#search-panel").effect("transfer", options, speed, callbackEffect()).hide();
    }
}

function callbackEffect() {
    hidden = getCookieValue("search-panel") == "hide";
    if (hidden) {
        if (writeSessionCookie("search-panel", "show")) {
            $("#search-button").html("Скрыть фильтр");
        }
        else {
            alert("В браузере выключены куки.");
        }
    } else {
        if (writeSessionCookie("search-panel", "hide")) {
            $("#search-button").html("Показать фильтр");
        }
        else {
            alert("В браузере выключены куки.");
        }
    }
}