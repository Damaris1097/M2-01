//
//  ViewController.swift
//  memorama
//
//  Created by Macbook Air 5 on 24/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    import UIKit
    2
    3class MemoryGameViewController: UIViewController {
    4    // Array de cartas
    5    var cards: [Card] = []
    6    // Array de cartas seleccionadas
    7    var selectedCards: [Card] = []
    8    // Tiempo de espera antes de voltear las cartas
    9    let waitTime: TimeInterval = 1.0
    10    // Vista de la carta
    11    @IBOutlet weak var cardView: UIView!
    12    // Label para mostrar el puntaje
    13    @IBOutlet weak var scoreLabel: UILabel!
    14
    15    override func viewDidLoad() {
    16        super.viewDidLoad()
    17        // Inicializar el juego
    18        initGame()
    19    }
    20
    21    func initGame() {
    22        // Crear un array de cartas con 12 elementos
    23        for _ in 1...12 {
    24            let card = Card()
    25            cards.append(card)
    26        }
    27        // Barajar las cartas
    28        cards.shuffle()
    29        // Asignar las cartas a la vista
    30        for (index, card) in cards.enumerated() {
    31            let cardView = UIView(frame: CGRect(x: 10 + (index % 3) * 100, y: 10 + (index / 3) * 150, width: 90, height: 130))
    32            cardView.backgroundColor = .white
    33            cardView.layer.cornerRadius = 10
    34            cardView.tag = index
    35            cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTapped)))
    36            self.view.addSubview(cardView)
    37        }
    38    }
    39
    40    @objc func cardTapped(_ gesture: UITapGestureRecognizer) {
    41        // Obtener la carta seleccionada
    42        let cardView = gesture.view!
    43        let cardIndex = cardView.tag
    44        let card = cards[cardIndex]
    45        // Verificar si la carta ya fue seleccionada
    46        if !selectedCards.contains(card) {
    47            // Agregar la carta a la lista de seleccionadas
    48            selectedCards.append(card)
    49            // Mostrar la carta
    50            showCard(cardView, card: card)
    51            // Verificar si se seleccionaron dos cartas
    52            if selectedCards.count == 2 {
    53                // Verificar si las cartas son iguales
    54                if selectedCards[0].image == selectedCards[1].image {
    55                    // Aumentar el puntaje
    56                    scoreLabel.text = "Puntaje: \(Int(scoreLabel.text ?? "0")! + 1)"
    57                    // Eliminar las cartas seleccionadas
    58                    selectedCards.removeAll()
    59                } else {
    60                    // Esperar un tiempo antes de voltear las cartas
    61                    DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
    62                        // Voltear las cartas
    63                        self.hideCards()
    64                    }
    65                }
    66            }
    67        }
    68    }
    69
    70    func showCard(_ cardView: UIView, card: Card) {
    71        // Mostrar la imagen de la carta
    72        let imageView = UIImageView(image: card.image)
    73        imageView.frame = cardView.bounds
    74        cardView.addSubview(imageView)
    75    }
    76
    77    func hideCards() {
    78        // Ocultar las cartas seleccionadas
    79        for cardView in selectedCards.map({ $0.view }) {
    80            cardView.subviews.forEach({ $0.removeFromSuperview() })
    81        }
    82        // Limpiar la lista de cartas seleccionadas
    83        selectedCards.removeAll()
    84    }
    85}
    86
    87class Card {
    88    // Imagen de la carta
    89    let image: UIImage
    90    // Vista de la carta
    91    weak var view: UIView?
    92
    93    init() {
    94        // Asignar una imagen aleatoria a la carta
    95        let images = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!]
    96        image = images.randomElement()!
    97    }
    98}

}

