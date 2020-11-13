import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
    endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    dateFormat: "Y-m-d",
    enableTime: true,
    dateFormat: "H:i",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      dateFormat: "Y-m-d",
      enableTime: true,
      dateFormat: "H:i",
      });
    })
  };
};

export { initFlatpickr };
