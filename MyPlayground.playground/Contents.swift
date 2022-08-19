import Foundation

func getCard(urlRequest: URL?) {
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Это ошибка\n\(error ?? fatalError())")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
//            guard let data = data else { return }
//            let dataAsString = String(data: data, encoding: .utf8)
//            print("""
//                  Это код ответа
//                  ---------------------------
//                  \(response)
//                  Это пришедшие данные
//                  ---------------------------
//                  \(dataAsString ?? "данные отсутствуют")
//                  ---------------------------
//                  """)
            guard let data = data else { return }
            do {
                let dataAsDecodingString = try JSONDecoder().decode(Cards.self, from: data)
                print("""
                      Это код ответа
                      ---------------------------
                      \(response)
                      Это пришедшие данные
                      ---------------------------
                      Имя карты: \(dataAsDecodingString.card.name ?? "имя отсутствует")
                      Тип: \(dataAsDecodingString.card.type ?? "без типа")
                      Мановая стоимость: \(dataAsDecodingString.card.cmc ?? 0)
                      Название сета: \(dataAsDecodingString.card.setName ?? "Вне сета")
                      Цвета: \(dataAsDecodingString.card.colors ?? ["Без цвета"])
                      Редкость: \(dataAsDecodingString.card.rarity ?? "Редкость неопределена")
                      """)
            } catch {
                print("error")
            }
        }
    }.resume()
}

// Карта Opt
let optURL = CardURL("485382")
getCard(urlRequest: optURL.getURL())

//// Карта Black Lotus
//let blackLotusURL = CardURL(with: "Black Lotus")
//getCard(urlRequest: blackLotusURL.getURL())
