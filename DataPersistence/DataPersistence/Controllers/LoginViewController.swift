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
    
    
    private func handleLogin() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        if userIsLoggedIn(email: email) {
            // check if password match
            if let _ = KeyChain.standard.read(service: password, account: email) {
                loginUser()
            }  else {
                showAlert(message: "Invalid password")
            }
        } else {
            UserDefaults.standard.setValue(true, forKey: email)
            saveNewUser(email: email, password: password)
            loginUser()
        }
        
    }
    
    private func userIsLoggedIn (email: String) -> Bool {
       UserDefaults.standard.bool(forKey: email)
    }

    
    
    private func saveNewUser(email: String, password: String) {
        KeyChain.standard.save(email.data(using: .utf8)!, service: email, account: email)
        KeyChain.standard.save(password.data(using: .utf8)!, service: password, account: email)
    }
    
    private func loginUser() {
        let vc = NoteListViewController(noteList: Note.initial)
        show(vc, sender: self)
    }
    

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
 
}


// MARK: - Style & Layout

extension LoginViewController {
    
    
    private func style() {
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
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        loginButton.addAction(
            UIAction(handler: { [weak self] _ in
            self?.handleLogin()
        }), for: .touchUpInside)
        
    }
    
    private func layout() {
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


