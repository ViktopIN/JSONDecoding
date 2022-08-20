import Foundation

func getCard(urlRequest: URL?) {
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Это ошибка\n\(error ?? fatalError())")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let data = data else { return }
            print("""
                  Это код ответа
                  ---------------------------
                  \(response)
                  """)
            do {
                let dataAsDecodingString = try JSONDecoder().decode(Cards.self, from: data)
                print("""
                      Это пришедшие данные
                      ---------------------------
                      """)
                dataAsDecodingString.cards.forEach { card in
                    if card.name == "Black Lotus" || card.name == "Opt" {
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
                    } else {
                        print("Карты с таким названием отсутствуют")
                    }
                }
            } catch {
                print("error")
            }
        }
    }.resume()
}

// Запрос
let requestUrl = CardURL("Opt|Black Lotus")
getCard(urlRequest: requestUrl.getURL())

