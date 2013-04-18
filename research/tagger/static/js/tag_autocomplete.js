/*global document:false, $:false */
$(document).ready(function () {
    var affinityDataField = $("#affinity-data"),
        requirementDataField = $("#requirement-data"),
        affinityTagsList = $("#affinity-tags-list"),
        requirementTagsList = $("#requirement-tags-list");

    function split(val) {
        return val.split(/,\s*/);
    }
    function extractLast(term) {
        return split(term).pop();
    }

    $("#affinity-tags-list")
        .on("click", "li span.delete", function (event) {
            var parent = $($(this).parent()),
                term = $($(this).parent().find(".term")),
                terms = split($("#affinity-delete").val());
            parent.css("display", "none");
            if (terms[0] === "") {
                terms = terms.splice(1, terms.length);
            }
            terms.push(term.text());
            $("#affinity-delete").val(terms.join(", "));
        });

    $("#requirement-tags-list")
    .on("click", "li span.delete", function (event) {
        var parent = $($(this).parent()),
            term = $(this).parent().data("term"),
            save_terms = split($("#requirement-data").val()),
            delete_terms = split($("#requirement-delete").val());
        parent.css("display", "none");
        if (_.include(save_terms, term)) {
            save_terms = _.filter(save_terms, function (save_term) {
                return save_term !== term;
            });
            delete_terms = _.filter(delete_terms, function (delete_term) {
                return delete_term !== term;
            });
            if (save_terms[0] === "") {
                save_terms = save_terms.splice(1, save_terms.length);
            }           
            $("#requirement-data").val(save_terms.join(", "));
        } else {
            delete_terms.push(term);
        }
        if (delete_terms[0] === "") {
            delete_terms = delete_terms.splice(1, delete_terms.length);
        }
        $("#requirement-delete").val(delete_terms.join(", "));
    });

    $("#affinity-field")
    // don't navigate away from the field on tab when selecting an item
        .bind("keydown", function (event) {
            if (event.keyCode === $.ui.keyCode.TAB &&
                    $(this).data("autocomplete").menu.active) {
                event.preventDefault();
            }
        })
        .autocomplete({
            source: function (request, response) {
                $.getJSON(AFFINITY_TAGS_SOURCE_URL, {
                    term: extractLast(request.term)
                }, function (data, status, jqXHR) {
                    var names = [],
                        r;
                    if (data) {
                        for (r = 0; r < data.length; r++) {
                            names.push(data[r].name);
                        }
                    }                        
                    response(names);
                });
            },
            minLength: 0,
            focus: function () {
                // prevent value inserted on focus
                return false;
            },
            select: function (event, ui) {
                var terms = split(this.value);
                // remove the current input
                terms.pop();
                // add the selected item
                terms.push(ui.item.value);
                // add placeholder to get the comma-and-space at the end
                terms.push("");
                this.value = terms.join(", ");
                return false;
            }
        });
    $("#requirement-field")
        .bind("keydown", function (event) {
            if (event.keyCode === $.ui.keyCode.TAB &&
                    $(this).data("autocomplete").menu.active) {
                event.preventDefault();
            }
        })
        .autocomplete({
            source: function (request, response) {
                $.getJSON(REQUIREMENT_TAGS_SOURCE_URL, {
                    term: extractLast(request.term)
                }, function (data, status, jqXHR) {
                    var names = [],
                        r;
                    if (data) {
                        for (r = 0; r < data.length; r++) {
                            names.push(data[r].name);
                        }
                        $("#choice .description").text(data[0].description);
                    }
                        
                    response(names);
                });
            },
            minLength: 0,
            focus: function () {
                // prevent value inserted on focus
                return false;
            },
            select: function (event, ui) {
                var terms = split(this.value),
                    delete_terms = split($("#requirement-delete").val()),
                    pushData = function (value, level) {
                        var dataTerms = split(requirementDataField.val()),
                            dataTerm = value + '::' + level;
                        if (dataTerms[0] === "") {
                            dataTerms.splice(0, 1);
                        }
                        dataTerms.push(dataTerm);
                        requirementDataField.val(dataTerms.join(", "));
                        requirementTagsList.append("<li class=\"unsaved\" data-term=\""
                            + dataTerm
                            + "\"><span class=\"term\">"
                            + value
                            + ", Level "
                            + level
                            + "</span> <span class=\"delete\">X</span></li>");
                        delete_terms = _.filter(delete_terms, function (delete_term) {
                            return delete_term !== dataTerm;
                        });
                        if (delete_terms[0] === "") {
                            delete_terms = delete_terms.splice(1, delete_terms.length);
                        }
                        $("#requirement-delete").val(delete_terms.join(", "));
                    };
                // remove the current input
                terms.pop();
                // add the selected item
                //terms.push(ui.item.value);
                // add placeholder to get the comma-and-space at the end
                //terms.push("");
                
                //$.getJSON(REQUIREMENT_TAG_API);
                
                $("#choice").dialog({
                    buttons : {
                        "Level 1" : function () {
                            pushData(ui.item.value, 1);
                            $(this).dialog("close");
                        },
                        "Level 2" : function () {
                            pushData(ui.item.value, 2);
                            $(this).dialog("close");
                        },
                        "Level 3" : function () {
                            pushData(ui.item.value, 3);
                            $(this).dialog("close");
                        },
                        "Level 4" : function () {
                            pushData(ui.item.value, 4);
                            $(this).dialog("close");
                        },
                        "Level 5" : function () {
                            pushData(ui.item.value, 5);
                            $(this).dialog("close");
                        }
                    }
                });

                //alert("Pick a level");
                this.value = terms.join(", ");
                return false;
            }
        });
});
