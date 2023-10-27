//
//  HomePageVC.swift
//  Navigation
//
//  Created by Davit Natenadze on 27.10.23.
//

import UIKit


class HomePageVC: UIViewController {
    
    // MARK: - Properties
    
    private let stackView = UIStackView()
    
    let navButton = UIButton()
    let navButton2 = UIButton()
        

    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    @objc func presentColorPaletteVC(sender: UIButton) {
        
        let vc = ColorPalleteVC()
        vc.delegate = self
        vc.buttonsDelegate = self
        self.present(vc, animated: true)
    }
        
    @objc func pushColorPaletteVC(sender: UIButton) {

        let vc = ColorPalleteVC()
        vc.delegate = self
        vc.buttonsDelegate = self
        vc.isPushNavigation = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: - Style & Layout

extension HomePageVC {
    
    
    func style() {
        navButton.translatesAutoresizingMaskIntoConstraints = false
        navButton2.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //
        navButton.setTitle("Present Color Palette Page", for: .normal)
        navButton.setTitleColor(.white, for: .normal)
        navButton.backgroundColor = .link
        
        //
        navButton2.setTitle("Push color palette page", for: .normal)
        navButton2.setTitleColor(.white, for: .normal)
        navButton2.backgroundColor = .magenta
        
        //
        stackView.axis = .vertical
        stackView.spacing = 64
        
        navButton.addTarget(self, action: #selector(presentColorPaletteVC(sender:)), for: .touchUpInside)
        navButton2.addTarget(self, action: #selector(pushColorPaletteVC), for: .touchUpInside)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(navButton)
        stackView.addArrangedSubview(navButton2)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
           
            navButton.heightAnchor.constraint(equalToConstant: 150),
            navButton.widthAnchor.constraint(equalToConstant: 300),
            
            navButton2.heightAnchor.constraint(equalToConstant: 150),
            navButton2.widthAnchor.constraint(equalToConstant: 300),
        ])
        
    }
}


extension HomePageVC: ChangeColorDelegate {
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

extension HomePageVC: ChangeButtonsColorDelegate {
    func changeButtonsColor(_ color: UIColor) {
        navButton.backgroundColor = color
        navButton2.backgroundColor = color
    }
    
}

#Preview {
    HomePageVC()
}
