import UIKit

class MemoryGameViewController: UIViewController {
    // Configuración del juego
    let gridSize = 4 // Tamaño del grid (4x4)
    let cardCount = gridSize * gridSize // Número de cartas
    let cardWidth: CGFloat = 100 // Ancho de cada carta
    let cardHeight: CGFloat = 100 // Alto de cada carta
    let spacing: CGFloat = 10 // Espacio entre cartas

    // Arreglo de cartas
    var cards: [Card] = []

    // Vista del grid
    let gridView = UIView()

    // Timer para el juego
    var timer: Timer?

    // Puntuación
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configuración de la vista
        view.backgroundColor = .white

        // Crear grid
        gridView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        gridView.backgroundColor = .gray
        view.addSubview(gridView)

        // Crear cartas
        for _ in 0..<cardCount {
            let card = Card()
            cards.append(card)
        }

        // Mezclar cartas
        cards.shuffle()

        // Agregar cartas al grid
        for (index, card) in cards.enumerated() {
            let row = index / gridSize
            let col = index % gridSize
            let x = CGFloat(col) * (cardWidth + spacing)
            let y = CGFloat(row) * (cardHeight + spacing)
            card.frame = CGRect(x: x, y: y, width: cardWidth, height: cardHeight)
            gridView.addSubview(card)
        }

        // Agregar gestos a las cartas
        for card in cards {
            card.addTarget(self, action: #selector(cardTapped(_:)), for: .touchUpInside)
        }

        // Iniciar juego
        startGame()
    }

    // Iniciar juego
    func startGame() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkMatches), userInfo: nil, repeats: true)
    }

    // Verificar coincidencias
    @objc func checkMatches() {
        for card in cards {
            if card.isMatched {
                // Quitar carta del grid
                card.removeFromSuperview()
                cards.remove(at: cards.firstIndex(of: card)!)
            }
        }

        // Verificar si el juego ha terminado
        if cards.isEmpty {
            timer?.invalidate()
            print("¡Has ganado!")
        }
    }

    // Carta seleccionada
    @objc func cardTapped(_ sender: Card) {
        // Mostrar carta seleccionada
        sender.isSelected = true

        // Verificar coincidencia
        for card in cards {
            if card != sender && card.image == sender.image {
                // Coincidencia encontrada
                card.isSelected = true
                score += 1
                print("Coincidencia encontrada!")
                return
            }
        }

        // No hay coincidencia
        sender.isSelected = false
    }
}

class Card: UIButton {
    var image: UIImage?
    var isSelected = false
    var isMatched = false

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Configuración de la carta
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
