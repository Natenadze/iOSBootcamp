//
//  ColorPalleteVC.swift
//  Navigation
//
//  Created by Davit Natenadze on 27.10.23.
//

import UIKit

protocol ChangeColorDelegate: AnyObject {
    func changeColor(_ color: UIColor)
}

protocol ChangeButtonsColorDelegate: AnyObject {
    func changeButtonsColor(_ color: UIColor)
}

class ColorPalleteVC: UIViewController {
    
    // MARK: - Properties
    
    var isPushNavigation = false
    weak var delegate: ChangeColorDelegate?
    weak var buttonsDelegate: ChangeButtonsColorDelegate?

    // Stacks
    private let mainStackView = UIStackView()
    private let firstStackView = UIStackView()
    private let secondStackView = UIStackView()
    
    private let firstStackTopStackView = UIStackView()
    private let firstStackBottomStackView = UIStackView()
    
    private let secondStackTopStackView = UIStackView()
    private let secondStackBottomStackView = UIStackView()
    
    private let redButton = UIButton()
    private let blueButton = UIButton()
    private let yellowButton = UIButton()
    private let cyanButton = UIButton()
    private let whiteButton = UIButton()
    private let grayButton = UIButton()
    private let greenButton = UIButton()
    private let pinkButton = UIButton()
    private let purpleButton = UIButton()
    private let brownButton = UIButton()
    private let blackButton = UIButton()
    private let orangeButton = UIButton()
       
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        style()
        layout()
    }
    
    
    @objc func handleColorButtonPressed(sender: UIButton) {

        delegate?.changeColor(sender.backgroundColor ?? .black)
        
        if isPushNavigation {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
        
    @objc func handleColorButtonPressed2(sender: UIButton) {

        buttonsDelegate?.changeButtonsColor(sender.backgroundColor ?? .black)
        
        if isPushNavigation {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
}


// MARK: - Style & Layout

extension ColorPalleteVC {
    
    
    func style() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackTopStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackBottomStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackTopStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackBottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        yellowButton.translatesAutoresizingMaskIntoConstraints = false
        cyanButton.translatesAutoresizingMaskIntoConstraints = false
        whiteButton.translatesAutoresizingMaskIntoConstraints = false
        grayButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        pinkButton.translatesAutoresizingMaskIntoConstraints = false
        purpleButton.translatesAutoresizingMaskIntoConstraints = false
        brownButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        orangeButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 64
        
        
        firstStackView.axis = .vertical
        secondStackView.axis = .vertical
        
        redButton.backgroundColor = .red
        redButton.addTarget(self, action: #selector(handleColorButtonPressed(sender:)), for: .touchUpInside)
        blueButton.backgroundColor = .blue
        blueButton.addTarget(self, action: #selector(handleColorButtonPressed(sender:)), for: .touchUpInside)
        yellowButton.backgroundColor = .yellow
        yellowButton.addTarget(self, action: #selector(handleColorButtonPressed(sender:)), for: .touchUpInside)
        cyanButton.backgroundColor = .cyan
        cyanButton.addTarget(self, action: #selector(handleColorButtonPressed(sender:)), for: .touchUpInside)
        whiteButton.backgroundColor = .white
        whiteButton.addTarget(self, action: #selector(handleColorButtonPressed(sender:)), for: .touchUpInside)
        grayButton.backgroundColor = .gray
        grayButton.addTarget(self, action: #selector(handleColorButtonPressed(sender:)), for: .touchUpInside)
        greenButton.backgroundColor = .green
        greenButton.addTarget(self, action: #selector(handleColorButtonPressed2(sender:)), for: .touchUpInside)
        pinkButton.backgroundColor = .systemPink
        pinkButton.addTarget(self, action: #selector(handleColorButtonPressed2(sender:)), for: .touchUpInside)
        purpleButton.backgroundColor = .purple
        purpleButton.addTarget(self, action: #selector(handleColorButtonPressed2(sender:)), for: .touchUpInside)
        brownButton.backgroundColor = .brown
        brownButton.addTarget(self, action: #selector(handleColorButtonPressed2(sender:)), for: .touchUpInside)
        blackButton.backgroundColor = .black
        blackButton.addTarget(self, action: #selector(handleColorButtonPressed2(sender:)), for: .touchUpInside)
        orangeButton.backgroundColor = .orange
        orangeButton.addTarget(self, action: #selector(handleColorButtonPressed2(sender:)), for: .touchUpInside)
        
    }
    
    func layout() {
        
        firstStackTopStackView.addArrangedSubview(redButton)
        firstStackTopStackView.addArrangedSubview(blueButton)
        firstStackTopStackView.addArrangedSubview(yellowButton)
        
        firstStackBottomStackView.addArrangedSubview(cyanButton)
        firstStackBottomStackView.addArrangedSubview(whiteButton)
        firstStackBottomStackView.addArrangedSubview(grayButton)
        
        secondStackTopStackView.addArrangedSubview(greenButton)
        secondStackTopStackView.addArrangedSubview(pinkButton)
        secondStackTopStackView.addArrangedSubview(purpleButton)
        
        secondStackBottomStackView.addArrangedSubview(brownButton)
        secondStackBottomStackView.addArrangedSubview(blackButton)
        secondStackBottomStackView.addArrangedSubview(orangeButton)
        
        
        firstStackView.addArrangedSubview(firstStackTopStackView)
        firstStackView.addArrangedSubview(firstStackBottomStackView)
        
        secondStackView.addArrangedSubview(secondStackTopStackView)
        secondStackView.addArrangedSubview(secondStackBottomStackView)
        
        mainStackView.addArrangedSubview(firstStackView)
        mainStackView.addArrangedSubview(secondStackView)
        
        view.addSubview(mainStackView)
        
        
        
        NSLayoutConstraint.activate([
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        
        redButton.heightAnchor.constraint(equalToConstant: 90),
        redButton.widthAnchor.constraint(equalToConstant: 90),

        blueButton.widthAnchor.constraint(equalToConstant: 90),
//

        yellowButton.widthAnchor.constraint(equalToConstant: 90),
//
        cyanButton.heightAnchor.constraint(equalToConstant: 90),
        cyanButton.widthAnchor.constraint(equalToConstant: 90),
//

        whiteButton.widthAnchor.constraint(equalToConstant: 90),

//        
        greenButton.heightAnchor.constraint(equalToConstant: 90),
        greenButton.widthAnchor.constraint(equalToConstant: 90),

        pinkButton.widthAnchor.constraint(equalToConstant: 90),

//        
        brownButton.heightAnchor.constraint(equalToConstant: 90),
        brownButton.widthAnchor.constraint(equalToConstant: 90),

        blackButton.widthAnchor.constraint(equalToConstant: 90),

        ])
        
    }
}

// MARK: - Preview
#Preview {
    ColorPalleteVC()
}
