//
//  ColorsView.swift
//  WalrusKitExampleApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import WalrusKit
import SwiftUI

final class ColorsViewController: DemoViewController<ColorsViewUIKit, ColorsView> {
    init() {
        super.init(uiKitView: ColorsViewUIKit(), swiftUIView: ColorsView())
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class ColorsCollectionViewCell: UICollectionViewCell {

    private let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(color: UIColor, name: String, textColor: UIColor) {
        contentView.backgroundColor = color
        label.attributedText = text(name, with: .main(size: .medium))
        label.textColor = textColor
    }
}

final class ColorsViewUIKit: UICollectionView {
    private let flowLayout = UICollectionViewFlowLayout()

    private let colors: [(color: UIColor, name: String, textColor: UIColor)] = WalrusColor.allCases.map {
        (color: $0.uiColor, name: $0.description, textColor: $0.uiColor.inverted)
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        let size = UIScreen.main.bounds.width / 3 - 20
        flowLayout.itemSize = CGSize(width: size, height: size)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        delegate = self
        dataSource = self
        backgroundColor = .clear
        register(ColorsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorsViewUIKit: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorsCollectionViewCell
        let (color, name, textColor) = colors[indexPath.row]
        cell.configure(color: color, name: name, textColor: textColor)
        return cell
    }
}

struct ColorsView: View {
    private enum Constants {
        static let columnsCount: Int = 3
        static let vSpacing: CGFloat = 10
        static let hSpacing: CGFloat = 10
        static let side: CGFloat = UIScreen.main.bounds.width / 3 - 20
    }

    private let colors: [(color: Color, name: String, textColor: Color)] = WalrusColor.allCases.map {
        (color: $0.color, name: $0.description, textColor: $0.color)
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            GridStack(
                itemsNumber: colors.count,
                columns: Constants.columnsCount,
                vSpacing: Constants.vSpacing,
                hSpacing: Constants.hSpacing) { index in

                    if let index = index {
                        text(colors[index].name, with: .main(size: .medium))
                            .foregroundColor(colors[index].textColor).colorInvert()
                            .multilineTextAlignment(.center)
                            .frame(width: Constants.side, height: Constants.side)
                            .background(colors[index].color)
                            .cornerRadius(20)
                    }
            }
        }
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView()
    }
}

extension WalrusColor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .primary:
            return "primary"
        case .secondaryHigh:
            return "secondary High"
        case .secondaryDefault:
            return "secondary Default"
        case .secondaryLow:
            return "secondary Low"
        case .dcHigh:
            return "dc High"
        case .dcDefault:
            return "dc Default"
        case .dcLow:
            return "dc Low"
        case .error:
            return "error"
        case .attention:
            return "attention"
        case .accent96:
            return "accent96"
        case .accent90:
            return "accent90"
        case .accent85:
            return "accent85"
        case .accent75:
            return "accent75"
        case .accent60:
            return "accent60"
        }
    }
}

extension UIColor {
    fileprivate var inverted: UIColor {
        var alpha: CGFloat = 1.0
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        if getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: 1.0 - red, green: 1.0 - green, blue: 1.0 - blue, alpha: alpha)
        }
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: 1.0 - hue, saturation: 1.0 - saturation, brightness: 1.0 - brightness, alpha: alpha)
        }
        var white: CGFloat = 0.0
        if getWhite(&white, alpha: &alpha) {
            return UIColor(white: 1.0 - white, alpha: alpha)
        }
        return self
    }
}
