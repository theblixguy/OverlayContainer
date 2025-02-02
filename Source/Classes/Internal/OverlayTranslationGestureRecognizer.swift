//
//  OverlayScrollViewTranslationController.swift
//  OverlayContainer
//
//  Created by Gaétan Zanella on 20/11/2018.
//

import UIKit

public class OverlayTranslationGestureRecognizer: UIPanGestureRecognizer {

    weak var drivingScrollView: UIScrollView?

    private(set) var startingLocation: CGPoint = .zero

    // MARK: - Public

    func cancel() {
        isEnabled = false
        isEnabled = true
    }

    // MARK: - UIGestureRecognizer

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        startingLocation = location(in: view)
    }

    public override func shouldRequireFailure(of otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let gestures = drivingScrollView?.gestureRecognizers else {
            return super.shouldRequireFailure(of: otherGestureRecognizer)
        }
        if gestures.contains(otherGestureRecognizer) {
            return true
        } else {
            return super.shouldRequireFailure(of: otherGestureRecognizer)
        }
    }
}
