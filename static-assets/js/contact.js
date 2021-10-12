$(document).ready(function () {
    $('form').submit(function (event) {
        event.preventDefault()

        if (!this.checkValidity()) {
            // If the form is invalid, submit it. The form won't actually submit;
            // this will just cause the browser to display the native HTML5 error messages.
            this.find('button[type="submit"]').click();

        } else {
            var values = $(this).serialize();
            $.ajax({
                type: this.method,
                url: this.action,
                data: values,
                success: function (data) {
                    if (data.success) {
                        $('#modal-spinner').modal('hide');
                        $('#success-dialog').modal('show');
                        $('form')[0].reset();
                    } else {
                        $('#fail-dialog').modal('show');
                    }
                },
                error: function (response) {
                    $('#modal-spinner').modal('hide');
                    $('#fail-dialog').modal('show');
                }
            });
        }
    });

});

function openSpinner() {
    $('#modal-spinner').modal('show');
    setTimeout(function () {
        $('.modal').modal('hide');
    }, 3000);
}
