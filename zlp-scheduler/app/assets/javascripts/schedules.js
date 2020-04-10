
// Makes schedules on view terms page sortable
document.addEventListener('turbolinks:load', function() {
    $(".schedules").sortable();
});

//Adds rows to table on add schedule page
function add_class_row() {
    var schedTable = document.getElementByClassName("sched_table");
    var schedTableRow = document.getElementByClassName("sched_table_row")
    var cloneRow = schedTableRow.cloneNode(true);
    schedTable.appendChild(cloneRow);
}
