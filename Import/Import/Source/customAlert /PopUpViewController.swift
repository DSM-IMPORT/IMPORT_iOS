//
//  PopUpViewController.swift
//  Import
//
//  Created by 박준하 on 2023/02/14.
//

import UIKit
import SnapKit
import Then

class PopUpViewController: UIViewController {
    
    private var titleText: String?
    private var messageText: String?
    private var attributedMessageText: NSAttributedString?
    private var contentView: UIView?
    
    private lazy var containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }
    
    private lazy var containerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12.0
        $0.alignment = .leading
    }

    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16.0
        view.distribution = .fillEqually

        return view
    }()

    private lazy var titleLabel: UILabel? = {
        let label = UILabel()
        label.text = titleText
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32.0, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .Gray800

        return label
    }()

    private lazy var messageLabel: UILabel? = {
        guard messageText != nil || attributedMessageText != nil else { return nil }

        let label = UILabel()
        label.text = messageText
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .gray
        label.numberOfLines = 0

        if let attributedMessageText = attributedMessageText {
            label.attributedText = attributedMessageText
        }

        return label
    }()
    
    convenience init(titleText: String? = nil,
                     messageText: String? = nil,
                     attributedMessageText: NSAttributedString? = nil) {
        self.init()

        self.titleText = titleText
        self.messageText = messageText
        self.attributedMessageText = attributedMessageText
        modalPresentationStyle = .overFullScreen
    }
    
    convenience init(contentView: UIView) {
        self.init()

        self.contentView = contentView
        modalPresentationStyle = .overFullScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        addSubviews()
        makeConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = true
        }
    }

    public func addActionToButton(title: String? = nil,
                                  titleColor: UIColor = .White,
                                  backgroundColor: UIColor = .Primary,
                                  completion: (() -> Void)? = nil) {
        guard let title = title else { return }

        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)

        // 허가 rigtButton
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.setBackgroundImage(backgroundColor.image(), for: .normal)

        // 불가 leftButton
        button.setTitleColor(.gray, for: .disabled)
        button.setBackgroundImage(UIColor.gray.image(), for: .disabled)

        //layer
        button.layer.cornerRadius = 8.0
        button.layer.masksToBounds = true

        button.addAction(for: .touchUpInside) { _ in
            completion?()
        }

        buttonStackView.addArrangedSubview(button)
    }

    private func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(containerStackView)
        view.backgroundColor = .black.withAlphaComponent(0.4)
    }

    private func addSubviews() {
        view.addSubview(containerStackView)

        if let contentView = contentView {
            containerStackView.addSubview(contentView)
        } else {
            if let titleLabel = titleLabel {
                containerStackView.addArrangedSubview(titleLabel)
            }

            if let messageLabel = messageLabel {
                containerStackView.addArrangedSubview(messageLabel)
            }
        }

        if let lastView = containerStackView.subviews.last {
            containerStackView.setCustomSpacing(24.0, after: lastView)
        }

        containerStackView.addArrangedSubview(buttonStackView)
    }
    
    private func makeConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 24),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -24),

            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),

            buttonStackView.heightAnchor.constraint(equalToConstant: 48),
            buttonStackView.widthAnchor.constraint(equalTo: containerStackView.widthAnchor)
        ])
    }
}
