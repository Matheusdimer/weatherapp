String parseTitle(Object object) {
  var string = object.toString();
  return string[0].toUpperCase() + string.substring(1);
}

String parseTemperature(Object object) {
  if (object is double) {
    return object.toStringAsFixed(0) + "°";
  }

  return object.toString();
}

const weekDays = [
  "Domingo",
  "Segunda",
  "Terça",
  "Quarta",
  "Quinta",
  "Sexta",
  "Sábado",
];
const monthNames = [
  "jan",
  "fev",
  "mar",
  "abr",
  "maio",
  "jun",
  "jul",
  "ago",
  "set",
  "out",
  "nov",
  "dez",
];
