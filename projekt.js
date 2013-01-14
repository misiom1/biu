/*jslint unparam: true, sloppy: true, devel: true, node: true, windows: true */
/*global $: false, document: false, console: false, window: false, FileReader: false, jNotify: false, CodeMirror: false */
var changeMode, editor, readfile, checkLength, updateTips, tips = $(".validateTips"), notify, appendLogout, language = 'javascript', loadCode, arr =  {clike : "C, C++, Java", javascript : "JavaScript", php : "PHP", http : "HTTP"}, deleteCode;
deleteCode = function (id) {
    $.get("main.php?deletecode&id=" + id);
    $.get('main.php?allcodes', function (data) {
        $('.modal-body').html(data);
    });
};
loadCode = function (id) {
    $.getJSON("main.php?getcode&id=" + id, function (json) {
        editor.setValue(json.code);
        //changeMode(json.jezyk, arr[json.jezyk]);
        //alert("JSON Data: " + json.users[3].name);
    });
    $("#kody").modal("hide");
};
notify = function (text) {
    jNotify(text, {
        autoHide : true, // added in v2.0
        clickOverlay : false, // added in v2.0
        MinWidth : 250,
        TimeShown : 1000,
        ShowTimeEffect : 200,
        HideTimeEffect : 200,
        LongTrip : 20,
        HorizontalPosition : 'center',
        VerticalPosition : 'top',
        ShowOverlay : true,
        ColorOverlay : '#000',
        OpacityOverlay : 0.3,
        onClosed : function () {
            // added in v2.0
        },
        onCompleted : function () {
            // added in v2.0
        }
    });
};
updateTips = function (t) {
    $(".validateTips").html(t).addClass("ui-state-highlight");
    setTimeout(function () {
        tips.removeClass("ui-state-highlight", 1500);
    }, 500);
};
checkLength = function (o, n, min, max) {
    if (o.val().length > max || o.val().length < min) {
        o.addClass("ui-state-error");
        updateTips("Długość " + n + " musi być pomiędzy " + min + " a " + max + ".");
        return false;
    }
    return true;
};
changeMode = function (text, jezyk) {
    editor.setOption("mode", {
        name : text,
        json : true
    });
    $("#jezyk").html(jezyk + ' <b class="caret"></b>');
    language = text;
};
readfile = function (evt) {
    'use strict';
    var file = evt.target.files[0], reader =  new FileReader();
    reader.readAsText(file);
    reader.onload = function (evt) {
        editor.setValue(evt.target.result);
    };
};
$(document).ready(function () {
    editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
        lineNumbers : true,
        lineWrapping : true
    });
    $("#toggler").hide();
    document.getElementById('plik').addEventListener('change', readfile, false);
    var hlLine = editor.addLineClass(0, "background", "activeline"),  allFields = $([]).add($("#name")).add($("#password")), loginFields = $([]).add($("#logname"), $("#logpassword")), login;
    editor.on("cursorActivity", function () {
        var cur = editor.getLineHandle(editor.getCursor().line);
        if (cur !== hlLine) {
            editor.removeLineClass(hlLine, "background", "activeline");
            hlLine = editor.addLineClass(cur, "background", "activeline");
        }
    });
    $("#regbutton").click(function () {
        $("#register-form").dialog("open");
		$(".validateTips").html("");
		loginFields.val("").removeClass("ui-state-error");
    });
    $("#register-form").dialog({
        autoOpen : false,
        height : 320,
        width : 350,
        modal : true,
        buttons : {
            "Rejestruj" : function () {
                allFields.removeClass("ui-state-error");
                var bValid = true;
				bValid =  bValid && $("#name").validateField();
				bValid =  bValid && $("#password").validateField();
                if (bValid) {
                    $.post("register.php", $("#register").serialize(), function (data) {
                        notify(data);
                    });
                    $(this).dialog("close");
                }
            },
            Cancel : function () {
                $(this).dialog("close");
            }
        },
        close : function () {
            allFields.val("").removeClass("ui-state-error");
        }
    });
    $("#logoutbutton").click(function () {
        $.get("main.php?logout");
        notify("Wylogowano");
        $("#login").html("Gość");
        $("#logoutli").html("");
        $("#mycodes").html("");
    });
    $("#logbutton").click(function () {
        $("#login-form").dialog("open");
		$(".validateTips").html("");
		loginFields.val("").removeClass("ui-state-error");
    });
    $("#login-form").dialog({
        autoOpen : false,
        height : 320,
        width : 350,
        modal : true,
        buttons : {
            "Loguj" : function () {
                login = $("#logname").val();
				$(".validateTips").html("");
                var bValid = true;
				bValid =  bValid && $("#logname").validateField();
				bValid =  bValid && $("#logpassword").validateField();
                if (bValid) {
                    $.post("main.php?checklogin", $("#loginform").serialize(), function (data) {
                        if (data === "true") {
                            $("#login").html(login);
                            $("#logoutli").html("<a href=\"#\" id=\"logoutbutton\">Wyloguj</a>");
                            $("#logoutbutton").click(function () {
                                $.get("main.php?logout");
                                notify("Wylogowano");
                                $("#login").html("Gość");
                                $("#logoutli").html("");
                                $("#mycodes").html("");
                            });
                            $("#mycodes").html("<a href=\"#kody\" id=\"mycodesbutton\" data-toggle=\"modal\">Moje kody</a>");
                            notify("Zalogowano");
                        } else {
                            notify("Zły login lub hasło!");
                        }
                    });
                    $(this).dialog("close");
                }
            },
            Cancel : function () {
                $(this).dialog("close");
            }
        },
        close : function () {
            loginFields.val("").removeClass("ui-state-error");
            $("#logpassword").val("");
			$("#logpassword").removeClass("ui-state-error");
        }
    });
    $("#savebutton").click(function () {
        $.get('main.php?iflogged', function (data) {
            if (data === 'true') {
                $("#zapisz-form").dialog("open");
            } else {
                notify("Zaloguj się najpierw!");
            }
        });
    });
    $("#zapisz-form").dialog({
        autoOpen : false,
        height : 250,
        width : 350,
        modal : true,
        buttons : {
            "Zapisz" : function () {
                $("#savename").removeClass("ui-state-error");
                var bValid = true;
                bValid = bValid && checkLength($("#savename"), "nazwy", 1, 50);
                if (bValid) {
                    $.post("main.php?addcode", {
                        code : editor.getValue(),
                        jezyk : language,
                        nazwa : $("#savename").val()
                    });
                    $(this).dialog("close");
                }
            },
            Anuluj : function () {
                $(this).dialog("close");
            }
        },
        close : function () {
            $("#savename").val("").removeClass("ui-state-error");
        }
    });
    $('#kody').on('show', function () {
        $.get('main.php?allcodes', function (data) {
            $('.modal-body').html(data);
        });
    });
});
