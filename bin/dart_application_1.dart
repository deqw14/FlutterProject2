//5) Використання міксинів
mixin logger {
  void log(String message) => print(message);
}

class Client with logger {
  String? name;
  int age, id;

  //4.2) Конструктор ініціалізації
  Client() : name = "Артур", age = 18, id = 340202 {
    // 6) Використання ключового слова assert
    assert(age > 0, "Вік не може бути менше або рівний нулю");
  }

  // 4.1) Фабричний конструктор
  factory Client.teenager(String name, int id) {
    return Client()
      ..name = name
      ..age = 15
      ..id = id;
  }
  @override
  String toString() => "$name, $age, $id";
}

void main() {
  //1) Оператори "синтаксичного цукру"
  String? name;
  name ??= 'Артур';
  print(name);

  //2) Використання лямбда-функцій, замикань
  var cubed = (int x) => x * x * x;
  print(cubed(2));

  Function Calculator(x) {
    return (y) => x * y + x;
  }

  var calculatewith = Calculator(3);
  print(calculatewith(100));

  //3 Використання параметрів за замовчуванням
  void greeting(String name, {String year = '2024'}) {
    print("Привіт, $name. Ти навчаєшся з $year.");
  }

  greeting("Артур", year: "2026");
  
 
  var client1 = Client();
  var client2 = Client.teenager('Михайло', 101);
  var client3 = Client.teenager('Оля', 102);
  //вивід міксинів
  client1.log("Створено ноговго клієнта: ${client1.name}");
  client2.log("Створено ноговго клієнта: ${client2.name}");
  client3.log("Створено ноговго клієнта: ${client3.name}");
  print(client1);
  print(client2);

  // 7) Робота з різними типами колекцій.
  //list
  var list1 = [6, 7];
  var list2 = [40, 32, ...list1];
  var list = [1,2, 3, for (var x in list1) if (x == 6) x, 10,];
  list.add(15);
  print(list);
  print(list2);

  //set
  var set1 = <String>{'Gg', 'Ww', 'Ff'};
  var set = {'A', 'S', 'D'};
  set.addAll(set1);
  print(set);
  var clientSet = <Client>{};
  clientSet.add(client1);
  clientSet.addAll([client2, client3]);
  print(clientSet);

  //map
  var map = {1: 'first', 2: 'second', 3: 'third'};
  Map<int, String>;
  map[4] = 'fourth';
  map.forEach((key, value) => print("Ключ: $key, Значення: $value"));
}