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
    
    //
    private let mainStackView = UIStackView()
    private let profilePictureAndSignInStack = UIStackView()
    
    private let profileImageView = UIImageView()
    private let signInLabel = UILabel()
    
    //
    private let textFieldsStackView = UIStackView()
    private var userNameTextField = UITextField()
    private var passwordTextField = UITextField()
    private var forgotPasswordLabel = UILabel()
    
    
    private let doNotHaveAccountPlusSignUpButtonStack = UIStackView()
    
    
    // MARK: -

    // MARK: - Second Part
    
    private let signInButton = UIButton()
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
    
    
    // MARK: - Methods
    
    @objc func handleSignIn() {
        let vc = HomePageVC()
        show(vc, sender: self)
    }
    
}


// MARK: - extensions

// MARK: - Style & Layout

extension SignInVC {
    
    
    func style() {
        untilForgotYourPasswordStyle()
        
        // MARK: -
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        googleIconButton.translatesAutoresizingMaskIntoConstraints = false
        facebookIconButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        socMediaButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        linkedInIconButton.translatesAutoresizingMaskIntoConstraints = false
        doNotHaveAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        doNotHaveAccountPlusSignUpButtonStack.translatesAutoresizingMaskIntoConstraints = false

        
        // MARK: -
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.tintColor = .white
        signInButton.backgroundColor = .systemBlue
        signInButton.layer.cornerRadius = 16
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
        orLabel.text = "Or"
        orLabel.textAlignment = .center
        
        //
        socMediaButtonsStack.spacing = 12
//        socMediaButtonsStack.alignment = .center
        socMediaButtonsStack.distribution = .equalSpacing
        
        
        googleIconButton.setImage(UIImage(named: "google"), for: .normal)
        facebookIconButton.setImage(UIImage(named: "facebook"), for: .normal)
        linkedInIconButton.setImage(UIImage(named: "linkedIn"), for: .normal)
        
//        doNotHaveAccountPlusSignUpButtonStack.spacing = 0
        
        doNotHaveAccountLabel.text = "Don't have an account."
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.gray, for: .normal)

        
    }
    
    func layout() {
        untilForgotYourPassword()
      
        
        // MARK: -
        mainStackView.addArrangedSubview(signInButton)
        mainStackView.addArrangedSubview(orLabel)
        
        socMediaButtonsStack.addArrangedSubview(googleIconButton)
        socMediaButtonsStack.addArrangedSubview(facebookIconButton)
        socMediaButtonsStack.addArrangedSubview(linkedInIconButton)
        
        mainStackView.addArrangedSubview(socMediaButtonsStack)
        
        doNotHaveAccountPlusSignUpButtonStack.addArrangedSubview(doNotHaveAccountLabel)
        doNotHaveAccountPlusSignUpButtonStack.addArrangedSubview(signUpButton)
        mainStackView.addArrangedSubview(doNotHaveAccountPlusSignUpButtonStack)
        
        view.addSubview(mainStackView)
        
        // MARK: -
        untilForgotYourPasswordConstraints()
        NSLayoutConstraint.activate([
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            googleIconButton.heightAnchor.constraint(equalToConstant: 42),
            googleIconButton.widthAnchor.constraint(equalToConstant: 42), facebookIconButton.heightAnchor.constraint(equalToConstant: 42),
            facebookIconButton.widthAnchor.constraint(equalToConstant: 42), linkedInIconButton.heightAnchor.constraint(equalToConstant: 42),
            linkedInIconButton.widthAnchor.constraint(equalToConstant: 42),
            
        ])
        
    }
}

extension SignInVC {
    
    func untilForgotYourPasswordStyle() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        profilePictureAndSignInStack.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Stacks
        mainStackView.axis = .vertical
        mainStackView.spacing = 32
//        mainStackView.alignment = .center
        
        //
        profilePictureAndSignInStack.axis = .vertical
        profilePictureAndSignInStack.spacing = 16
        profilePictureAndSignInStack.alignment = .center
        //
        textFieldsStackView.spacing = 32
        
        //
        backgroundImageView.image = UIImage(named: "background")
        
        //
//        profileImageView.image = UIImage(systemName: "person")
        profileImageView.image = UIImage(named: "jackie")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 80
        profileImageView.clipsToBounds = true
        
        // SignIn Label
        signInLabel.text = "Sign In"
        signInLabel.font = .boldSystemFont(ofSize: 22)
        
        // stackView
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 16
        
        //
        userNameTextField = Utilities.createSignInTextField(withPlaceholder: "Username")
        //
        passwordTextField = Utilities.createSignInTextField(withPlaceholder: "Password")
        passwordTextField.isSecureTextEntry = true
        
        // forgot password Label
        forgotPasswordLabel.text = "Forgot Your Password?"
        forgotPasswordLabel.textAlignment = .right
        forgotPasswordLabel.font = .systemFont(ofSize: 14)
        forgotPasswordLabel.textColor = .systemGray2
    }
    
    func untilForgotYourPassword() {
        view.addSubview(backgroundImageView)
        
        profilePictureAndSignInStack.addArrangedSubview(profileImageView)
        profilePictureAndSignInStack.addArrangedSubview(signInLabel)
        
        textFieldsStackView.addArrangedSubview(userNameTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        textFieldsStackView.addArrangedSubview(forgotPasswordLabel)
        
        
        mainStackView.addArrangedSubview(profilePictureAndSignInStack)
        mainStackView.addArrangedSubview(textFieldsStackView)
        
    }
    
    func untilForgotYourPasswordConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 250),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            
            //main Stack
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            mainStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: mainStackView.trailingAnchor, multiplier: 4),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: mainStackView.bottomAnchor, multiplier: 12),
            
            
            
        ])
    }
}






// MARK: - Preview
#Preview {
    SignInVC()
}
