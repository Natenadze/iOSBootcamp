//
//  SignInVC.swift
//  Navigation
//
//  Created by Davit Natenadze on 27.10.23.
//

import UIKit

final class SignInVC: UIViewController {
    
    // MARK: - Properties
    private let backgroundImageView = UIImageView()
    
    // Stacks
    private let superStack = UIStackView()
    private let topMainStack = UIStackView()
    private let bottomMainStack = UIStackView()
    
    private let profilePictureAndSignInStack = UIStackView()
    private let profileImageView = UIImageView()
    private let signInLabel = UILabel()
    
    //
    private let textFieldsStackView = UIStackView()
    private var userNameTextField = UITextField()
    private var passwordTextField = UITextField()
    private var forgotPasswordLabel = UILabel()
    
    
    private let doNotHaveAccountPlusSignUpButtonStack = UIStackView()


    // MARK: - Second Part
    
    private let signInButton = UIButton(type: .system)
    private let orLabel = UILabel()
    private let dividerView = UIView()
    private let googleIconButton = UIButton()
    private let facebookIconButton = UIButton()
    private let linkedInIconButton = UIButton()
    private let doNotHaveAccountLabel = UILabel()
    private var signUpButton = UIButton()
    
    private let socMediaButtonsStack = UIStackView()
    
    
    // MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleSignIn() {
        
            let vc = HomePageVC()
            show(vc, sender: self)
    }
    
    @objc func textFieldDidChange() {
        let isAnyTextFieldEmpty = userNameTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true
        signInButton.isEnabled = !isAnyTextFieldEmpty
    }
    
}


// MARK: - extensions

// MARK: - Style & Layout

extension SignInVC {
    
    func style() {
        translateMaskIntoConstraints()
        
        // MARK: - setup
        backgroundImageView.image = UIImage(named: "background")
        
        setupStacks()
        setupProfileImage()
        
        // SignIn Label
        signInLabel.text = "Sign In"
        signInLabel.font = .boldSystemFont(ofSize: 22)
        
        setupTextFields()
        setupForgotPasswordLabel()
        setupSignInButton()
        setupOrLabel()
        
        dividerView.backgroundColor = .gray
        
        setupSocMediaButtons()
        
        doNotHaveAccountLabel.text = "Don't have an account."
        
        setupSignUpButton()
    }
    func layout() {
        addSubviews()
        addAndActivateConstraints()
    }
}

// MARK: - Helper methods

// style
extension SignInVC {
    func translateMaskIntoConstraints() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        googleIconButton.translatesAutoresizingMaskIntoConstraints = false
        facebookIconButton.translatesAutoresizingMaskIntoConstraints = false
        socMediaButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        linkedInIconButton.translatesAutoresizingMaskIntoConstraints = false
        doNotHaveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        bottomMainStack.translatesAutoresizingMaskIntoConstraints = false
        doNotHaveAccountPlusSignUpButtonStack.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        topMainStack.translatesAutoresizingMaskIntoConstraints = false
        profilePictureAndSignInStack.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        superStack.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupSignInButton() {
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.tintColor = .white
        signInButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        signInButton.backgroundColor = .systemBlue
        signInButton.layer.cornerRadius = 16
        signInButton.isEnabled = false
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
    }
    func setupProfileImage() {
        profileImageView.image = UIImage(named: "jackie")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 80
        profileImageView.clipsToBounds = true
    }
    func setupTextFields() {
        userNameTextField = Utilities.createSignInTextField(withPlaceholder: "Username")
        userNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        passwordTextField = Utilities.createSignInTextField(withPlaceholder: "Password")
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.isSecureTextEntry = true
    }
    func setupForgotPasswordLabel() {
        forgotPasswordLabel.text = "Forgot Your Password?"
        forgotPasswordLabel.textAlignment = .right
        forgotPasswordLabel.font = .systemFont(ofSize: 14)
        forgotPasswordLabel.textColor = .systemGray
    }
    func setupOrLabel() {
        orLabel.text = "Or"
        orLabel.backgroundColor = .white
        orLabel.textAlignment = .center
    }
    func setupSocMediaButtons() {
        googleIconButton.setImage(UIImage(named: "google"), for: .normal)
        facebookIconButton.setImage(UIImage(named: "facebook"), for: .normal)
        linkedInIconButton.setImage(UIImage(named: "linkedIn"), for: .normal)
    }
    func setupStacks() {
        superStack.axis = .vertical
        superStack.spacing = 16
        
        topMainStack.axis = .vertical
        topMainStack.spacing = 24
        
        //
        profilePictureAndSignInStack.axis = .vertical
        profilePictureAndSignInStack.spacing = 16
        profilePictureAndSignInStack.alignment = .center
        //
        
        // stackView
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 16
        
        bottomMainStack.axis = .vertical
        bottomMainStack.spacing = 12
        bottomMainStack.alignment = .center
        
        //
        socMediaButtonsStack.spacing = 12
    }
    func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.gray, for: .normal)
    }
}

// layout
extension SignInVC {
    func addSubviews() {
        view.addSubview(backgroundImageView)
        
        profilePictureAndSignInStack.addArrangedSubview(profileImageView)
        profilePictureAndSignInStack.addArrangedSubview(signInLabel)
        topMainStack.addArrangedSubview(profilePictureAndSignInStack)
        
        textFieldsStackView.addArrangedSubview(userNameTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        textFieldsStackView.addArrangedSubview(forgotPasswordLabel)
        topMainStack.addArrangedSubview(textFieldsStackView)
        
        topMainStack.addArrangedSubview(signInButton)
        topMainStack.addArrangedSubview(dividerView)
//        topMainStack.addArrangedSubview(orLabel)
        superStack.addArrangedSubview(topMainStack)
        
        // MARK: - Bottom Main Stack

        socMediaButtonsStack.addArrangedSubview(googleIconButton)
        socMediaButtonsStack.addArrangedSubview(facebookIconButton)
        socMediaButtonsStack.addArrangedSubview(linkedInIconButton)
        bottomMainStack.addArrangedSubview(socMediaButtonsStack)
        
        doNotHaveAccountPlusSignUpButtonStack.addArrangedSubview(doNotHaveAccountLabel)
        doNotHaveAccountPlusSignUpButtonStack.addArrangedSubview(signUpButton)
        bottomMainStack.addArrangedSubview(doNotHaveAccountPlusSignUpButtonStack)
        superStack.addArrangedSubview(bottomMainStack)
        
       
        view.addSubview(superStack)
        view.addSubview(orLabel)
    }
    func addAndActivateConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 250),
            
            //super Stack
            superStack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            superStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: superStack.trailingAnchor, multiplier: 4),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: superStack.bottomAnchor, multiplier: 10),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            orLabel.centerXAnchor.constraint(equalTo: dividerView.centerXAnchor),
            orLabel.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor),
            orLabel.widthAnchor.constraint(equalToConstant: 30),
            
            googleIconButton.heightAnchor.constraint(equalToConstant: 42),
            googleIconButton.widthAnchor.constraint(equalToConstant: 42),
            facebookIconButton.heightAnchor.constraint(equalToConstant: 42),
            facebookIconButton.widthAnchor.constraint(equalToConstant: 42),
            linkedInIconButton.heightAnchor.constraint(equalToConstant: 42),
            linkedInIconButton.widthAnchor.constraint(equalToConstant: 42),
        ])
    }
}


// MARK: - Preview
#Preview {
    SignInVC()
}
