//
//  LoginViewController.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let stackView = UIStackView()

    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    // MARK: - Helper Methods
    
    
    @objc func handleLogin() {
//        guard let email    = emailTextField.text    else { return }
//        guard let password = passwordTextField.text else { return }
//
        let vc = NoteListViewController(noteList: Note.initial)
        show(vc, sender: self)
            
    }

    
}


// MARK: - Style & Layout

extension LoginViewController {
    
    
    func style() {
        view.backgroundColor = .appColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField = UITextField.textField(withPlaceholder: "Email")
        
        passwordTextField = UITextField.textField(withPlaceholder: "Password")
        passwordTextField.isSecureTextEntry = true
        
        stackView.axis = .vertical
        stackView.spacing = 30
        
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 5
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
    }
    
    func layout() {
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }
}




// MARK: - Preview
#Preview {
    UINavigationController(rootViewController: LoginViewController())
}


