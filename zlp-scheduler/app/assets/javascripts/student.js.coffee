$('#dept').change ->
    dept = $(this).val()
    $('#dept').html("<%= escape_javascript(options_for_select(@subject_options)) %>");
    

$('#course_num').change ->
    course_num = $(this).val()
    dept = $('#dept').val()
    $.ajax
        url: 'student/add_schedule',
        type: 'GET',
        headers: {'X-Subj': dept, 'X-Course': course_num},
        success: (response) ->
            $('#section_num').html(response)