const closeAllLists = () => {
  var x = document.getElementsByClassName("autocomplete");
    for (var i = 0; i < x.length; i++) {
      x[i].parentNode.removeChild(x[i]);
  }
}

const drawResponseList = (data) => {
  closeAllLists()
  let lista = document.createElement("UL");
  lista.setAttribute("id", data["date"]);
  lista.setAttribute("class", "card autocomplete")
  document.getElementById('search_form').parentNode.appendChild(lista);
  data["products"].forEach((product) => {
    lista.insertAdjacentHTML('beforeend', `<li><a href="${product.path}">${product.name}</a></li>`);
  });
};

const autocomplete = (e) => {

  fetch(`/autocomplete?q=${e.target.value}`)
    .then(response => response.json())
    .then(data => drawResponseList(data));
};

const auto = () => { document.getElementById('search_form').addEventListener('input', autocomplete) };

export {auto, closeAllLists};
