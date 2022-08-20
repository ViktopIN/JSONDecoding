import Foundation

func getCard(urlRequest: URL?) {
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Это ошибка\n\(error ?? fatalError())")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let data = data else { return }
            do {
                let dataAsDecodingString = try JSONDecoder().decode(Cards.self, from: data)
                print("""
                      Это код ответа
                      ---------------------------
                      \(response)
                      Это пришедшие данные
                      ---------------------------
                      """)
                dataAsDecodingString.cards.forEach { card in
                print("""
                      --------------------------------------------------
                      Имя карты: \(card.name ?? "имя отсутствует")
                      Тип: \(card.type ?? "без типа")
                      Мановая стоимость: \(card.cmc ?? 0)
                      Название сета: \(card.setName ?? "Вне сета")
                      Цвета: \(card.colors?.joined(separator: ",") ?? "Без цвета")
                      Редкость: \(card.rarity ?? "Редкость неопределена")
                      --------------------------------------------------
                      """)
                }
            }
            catch
            {
                print("error")
            }
        }
    }.resume()
}

// Карта Opt
let optURL = CardURL("Opt")
getCard(urlRequest: optURL.getURL())

