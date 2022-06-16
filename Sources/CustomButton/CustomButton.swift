import UIKit

public class CustomButton: UIView {

  public enum ImageOptions {
    case sfSymbol
    case assetImage
    case none
  }

  public let title: String
  public let subtitle: String?
  public let icon: String?
  public let titleFontSize: CGFloat
  public let subtitleFontSize: CGFloat?
  public let imageOptions: ImageOptions
  public var action: (() -> Void)? = nil


  lazy var horizontalStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: horizontalViews)
    stack.axis = .horizontal
    stack.alignment = .center
    stack.distribution = .fill
    stack.spacing = 8
    stack.contentMode = .scaleToFill
    stack.autoresizesSubviews = true
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.setContentHuggingPriority(.init(rawValue: 250), for: .horizontal)
    stack.setContentHuggingPriority(.init(rawValue: 250), for: .vertical)
    stack.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)
    stack.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
    stack.insetsLayoutMarginsFromSafeArea = true
    return stack
  }()

  lazy var buttonLabel: UILabel = {
    let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 70, height: 30)))
    label.translatesAutoresizingMaskIntoConstraints = false

    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0

    let titleAttributes = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: titleFontSize), NSAttributedString.Key.foregroundColor: UIColor.red])
    if let subtitle = subtitle, let subtitleFontSize = subtitleFontSize {
      let subtitleAttributes = NSMutableAttributedString(string: subtitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: subtitleFontSize), NSAttributedString.Key.foregroundColor: UIColor.gray])
      titleAttributes.append(NSAttributedString(string: "\n"))
      titleAttributes.append(subtitleAttributes)
    } else {
      // handle some error... or have a default setting.
    }
    label.attributedText = NSAttributedString(attributedString: titleAttributes)

    label.textAlignment = .center
    label.contentMode = .left
    label.setContentHuggingPriority(.init(rawValue: 249), for: .horizontal)
    label.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
    label.setContentCompressionResistancePriority(.init(rawValue: 751), for: .horizontal)
    label.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
    label.autoresizesSubviews = true
    return label
  }()

  lazy var buttonIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    let imageViewHeight = imageView.heightAnchor.constraint(equalToConstant: 32)
    imageViewHeight.priority = .init(rawValue: 999)
    imageViewHeight.isActive = true
    let imageViewWidth = imageView.widthAnchor.constraint(equalToConstant: 32)
    imageViewWidth.priority = .init(rawValue: 999)
    imageViewWidth.isActive = true

    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  var tapGesture: UITapGestureRecognizer!
  lazy var horizontalViews: [UIView] = [buttonLabel]

  public init(title: String,
       subtitle: String? = nil,
       icon: String? = nil,
       titleFontSize: CGFloat,
       subtitleFontSize: CGFloat? = nil,
       imageOptions: ImageOptions = .none)
  {
    self.title = title
    self.subtitle = subtitle
    self.icon = icon
    self.titleFontSize = titleFontSize
    self.subtitleFontSize = subtitleFontSize
    self.imageOptions = imageOptions
    super.init(frame: .zero)

    if icon != nil {
      setupButtonIcon()
      horizontalViews.insert(buttonIcon, at: 0)
    }
    addSubview(horizontalStack)
    setupConstraints()

    self.isUserInteractionEnabled = true
    tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
    self.addGestureRecognizer(tapGesture)
  }

  @objc private func didTap() {
    action?()
//    print(#line, #file.components(separatedBy: "/").last!, "tapped")
  }

  private func setupButtonIcon() {
    switch imageOptions {
      case .sfSymbol:
        buttonIcon.image = UIImage(systemName: icon!)
      case .assetImage:
        buttonIcon.image = UIImage(named: icon!)
      case .none:
        buttonIcon.image = makeImage()
    }
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
      horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
      horizontalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
      horizontalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
    ])
  }

  public override func layoutSubviews() {
    super.layoutSubviews()

    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = bounds.height / 2
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
