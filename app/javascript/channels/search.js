const input = document.querySelector('#search_form');
const results = document.querySelector('#results');

const drawResponseList = (data) => {
  console.log(data)
  results.innerHTML = '';
  data.forEach((word) => {
    results.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
  });
};

const autocomplete = (e) => {
  fetch(`/autocomplete?q=${e.target.value}`)
    .then(response => response.json())
    .then(data => drawResponseList(data));
  console.log('esto anda')
};

input.addEventListener('keyup', autocomplete);
