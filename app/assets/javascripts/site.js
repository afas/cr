function toggle(obj) {
    var el = document.getElementById(obj);
    el.style.display = (el.style.display != 'none' ? 'none' : '');
}

function hide(obj) {
    var el = document.getElementById(obj);
    el.style.display = 'none';
}

$(document).ready(function () {
//    writeSessionCookie("user_options_display", "block");

    $(".buildings a").hover(
        function () {
            $(".building-num").fadeIn("fast");
            posX = $(this).position().left + 20;
            posY = $(this).position().top - 30;
            $(".building-num").css("left", posX);
            $(".building-num").css("top", posY);
            numValue = $(this).attr("rel");
            $(".building-num").css("background-image", "url(/img/dot" + numValue + ".png)");
            $(".building-num").html($(this).html());
            $(".building-num").attr("id", numValue);
            //
        },
        function () {
            $('.building-num').css({"display":"none"});
            $(".building-num").removeAttr("id")
        }
    );

    //LocalNavigation is absolute positioned
    var subnavElement = document.getElementById('LocalNavigation');

    if (subnavElement) {
        NavPosition = $("#LocalNavigation").height() + $("#LocalNavigation").position().top;
        ContentPosition = $("#Content").position().top + $("#Content").height();
        if (ContentPosition < NavPosition) {
            $("#Content").css("height", NavPosition - $("#Content").position().top - 20);
        }
    }

    EnlargeImage();
    function EnlargeImage() {
        $('#Content.building-page').animate({
            height:"53px"
        }, 500);

        $(".building #LocalNavigation").css("display", "none");

        $(".opencontent").addClass("opened");
    }

    function ShowContent() {
        $('#ContentWrapper').animate({
            height:"370px"
        }, 500);
        $('#InnerContent').animate({
            height:"340px"
        }, 500);
        $('#Content.building-page').animate({
            height:"370px"
        }, 500);
        $(".building #LocalNavigation").css("display", "block");
        $(".opencontent").removeClass("opened");
    }

    //tooltip
    $(".opencontent").click(function () {
        if ($(".opencontent").hasClass("opened")) {
            ShowContent();
        } else {
            EnlargeImage();
        }
    });

});


