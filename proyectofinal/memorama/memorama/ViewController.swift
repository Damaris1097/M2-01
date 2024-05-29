import UIKit

class MemoryGameViewController: UIViewController {
// Array de cartas
     var cards: [Card] = []
        // Array de cartas seleccionadas
        var selectedCards: [Card] = []
        // Tiempo de espera antes de voltear las cartas
        let waitTime: TimeInterval = 1.0
        // Vista de la carta
        @IBOutlet weak var cardView: UIView!
        // Label para mostrar el puntaje
        @IBOutlet weak var scoreLabel: UILabel!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Inicializar el juego
            initGame()
        }
    
        func initGame() {
            // Crear un array de cartas con 12 elementos
            for _ in 1...12 {
               let card = Card()
               cards.append(card)
           }
           // Barajar las cartas
           cards.shuffle()
           // Asignar las cartas a la vista
           for (index, card) in cards.enumerated() {
               let cardView = UIView(frame: CGRect(x: 10 + (index % 3) * 100, y: 10 + (index / 3) * 150, width: 90, height: 130))
                cardView.backgroundColor = .white
                cardView.layer.cornerRadius = 10
                cardView.tag = index
                cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTapped)))
                self.view.addSubview(cardView)
            }
        }
    
        @objc func cardTapped(_ gesture: UITapGestureRecognizer) {
            // Obtener la carta seleccionada
            let cardView = gesture.view!
            let cardIndex = cardView.tag
            let card = cards[cardIndex]
            // Verificar si la carta ya fue seleccionada
            if !selectedCards.contains(: card) {
                // Agregar la carta a la lista de seleccionadas
                selectedCards.append(card)
                // Mostrar la carta
                showCard(cardView, card: card)
                // Verificar si se seleccionaron dos cartas
                if selectedCards.count == 2 {
                    // Verificar si las cartas son iguales
                    if selectedCards[0].image == selectedCards[1].image {
                        // Aumentar el puntaje
                        scoreLabel.text = "Puntaje: \(Int(scoreLabel.text ?? "0")! + 1)"
                        // Eliminar las cartas seleccionadas
                        selectedCards.removeAll()
                    } else {
                        // Esperar un tiempo antes de voltear las cartas
                        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
                            // Voltear las cartas
                            self.hideCards()
                        }
                    }
                }
            }
        }
    
        func showCard(_ cardView: UIView, card: Card) {
            // Mostrar la imagen de la carta
            let imageView = UIImageView(image: card.image)
            imageView.frame = cardView.bounds
            cardView.addSubview(imageView)
        }
    
        func hideCards() {
            // Ocultar las cartas seleccionadas
            for cardView in selectedCards.map({ $0.view }) {
                cardView?.subviews.forEach({ $0.removeFromSuperview() })
            }
            // Limpiar la lista de cartas seleccionadas
            selectedCards.removeAll()
        }
    }
    
    class Card {
        // Imagen de la carta
        let image: UIImage
        // Vista de la carta
        weak var view: UIView?
    
        init() {
            // Asignar una imagen aleatoria a la carta
            let images = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!]
            image = images.randomElement()!
        }
    }

