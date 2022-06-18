//
//  ViewController.swift
//  Example
//
//  Created by Mohamad Rahmani on 16.06.22.
//

import UIKit
import CustomButton

class ViewController: UIViewController {

  lazy var testButton: CustomButton = {
    let button = CustomButton(title: "Register", titleFontSize: 17)
    button.action = handleRegister
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  lazy var testButton2: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: "would you like to register in our awesome app?!", icon: nil, titleFontSize: 17, subtitleFontSize: 12, imageOptions: .none)
    button.action = handleRegister
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  lazy var testButton3: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: nil, icon: "something that doesn't exist.", titleFontSize: 17, subtitleFontSize: nil, imageOptions: .none)
    button.action = handleRegister
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  lazy var testButton4: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: nil, icon: "ss", titleFontSize: 17, subtitleFontSize: nil, imageOptions: .assetImage)
    button.action = handleRegister
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  lazy var testButton5: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: nil, icon: "square.and.arrow.up.circle.fill", titleFontSize: 17, subtitleFontSize: nil, imageOptions: .sfSymbol)
    button.action = handleRegister
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  lazy var testButton6: CustomButton = {
    let button = CustomButton(title: "Register", subtitle: nil, icon: "square.and.arrow.up.circle.fill", titleFontSize: 17, subtitleFontSize: nil, imageOptions: .sfSymbol)
    button.action = handleRegister
    button.isEnabled = false
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    view.addSubview(testButton)
    view.addSubview(testButton2)
    view.addSubview(testButton3)
    view.addSubview(testButton4)
    view.addSubview(testButton5)
    view.addSubview(testButton6)
    setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      testButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      testButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      testButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      testButton.heightAnchor.constraint(equalToConstant: 44),

      testButton2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      testButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      testButton2.topAnchor.constraint(equalTo: testButton.bottomAnchor, constant: 38),
      testButton2.heightAnchor.constraint(equalToConstant: 44),

      testButton3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      testButton3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      testButton3.topAnchor.constraint(equalTo: testButton2.bottomAnchor, constant: 38),
      testButton3.heightAnchor.constraint(equalToConstant: 44),

      testButton4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      testButton4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      testButton4.topAnchor.constraint(equalTo: testButton3.bottomAnchor, constant: 38),
      testButton4.heightAnchor.constraint(equalToConstant: 44),

      testButton5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      testButton5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      testButton5.topAnchor.constraint(equalTo: testButton4.bottomAnchor, constant: 38),
      testButton5.heightAnchor.constraint(equalToConstant: 44),

      testButton6.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      testButton6.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      testButton6.topAnchor.constraint(equalTo: testButton5.bottomAnchor, constant: 38),
      testButton6.heightAnchor.constraint(equalToConstant: 44),
      ])
  }

  private func handleRegister() {
      print(#line, #file.components(separatedBy: "/").last!, "Got tapped...")
  }
}
