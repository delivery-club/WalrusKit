//
//  TypographyViewController.swift
//  DeliveryClubUIApp
//
//  Created by Sakhey Ignatyev on 26.11.2020.
//

import DeliveryClubUI
import SwiftUI
import UIKit

final class TypographyViewController: DemoViewController<TypographySampleUIKit, TypographySampleSwiftUI> {
    init() {
        super.init(uiKitView: TypographySampleUIKit(), swiftUIView: TypographySampleSwiftUI())
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct TypographySampleSwiftUI: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView([.vertical, .horizontal], showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Typography.Kind.allStyles.map { $0.style }, id: \.id) { style in
                        text(style.kind.sampleText, with: style.kind)
                            .withColor(.dcDefault)
                    }
                }
                .padding([.leading, .trailing], 10)
                .frame(minHeight: geometry.size.height, alignment: .top)
            }
        }
    }
}

final class TypographySampleUIKit: UIView {

    private let scrollView = UIScrollView()
    private let stackView = UIStackView()

    convenience init() {
        self.init(frame: .zero)
        setup()
    }

    private func setup() {

        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

        stackView.axis = .vertical
        stackView.spacing = 10

        Typography.Kind.allStyles.map { kind -> UIView in
            let wrapper = UIView()
            let label = UILabel()
            label.attributedText = text(kind.sampleText, with: kind)
                .withColor(.error)
            wrapper.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: 10),
                label.topAnchor.constraint(equalTo: wrapper.topAnchor),
                label.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: 10),
                label.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor),
            ])
            return wrapper
        }.forEach { view in
            stackView.addArrangedSubview(view)
        }
    }
}

struct TypographyStyle: Identifiable {
    var id = UUID()
    let kind: Typography.Kind
}

extension Typography.Kind {
    static var allStyles: [Typography.Kind] {
        [
            .header(size: .large),
            .header(size: .medium),
            .header(size: .small),
            .main(size: .large),
            .main(size: .medium),
            .main(size: .small),
            .small(size: .large),
            .small(size: .medium),
            .small(size: .small),
            .extraSmall(size: .large),
            .extraSmall(size: .medium),
            .extraSmall(size: .small),
        ]
    }

    var sampleText: String {
        switch self {

        case let .header(size):
            switch size {

            case .large:
                return "Come to decide that the things that I tried"
            case .medium:
                return "Were in my life just to get high on"
            case .small:
                return "When I sit alone, come get a little known"
            }
        case let .main(size):
            switch size {

            case .large:
                return "But I need more than myself this time"
            case .medium:
                return "Step from the road to the sea to the sky"
            case .small:
                return "And I do believe that we rely on"
            }
        case let .small(size):
            switch size {

            case .large:
                return "When I lay it on, come get to play it on"
            case .medium:
                return "All my life to sacrifice"
            case .small:
                return "Hey, oh"
            }
        case let .extraSmall(size):
            switch size {

            case .large:
                return "Listen what I say, oh"
            case .medium:
                return "I got your hey, oh"
            case .small:
                return "Now listen what I say, oh"
            }
        }
    }

    var style: TypographyStyle {
        TypographyStyle(id: UUID(), kind: self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TypographySampleSwiftUI()
    }
}
