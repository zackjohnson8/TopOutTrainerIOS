//
//  MainModel.swift
//  TopOutTrainer
//
//  Created by Zachary Johnson on 1/14/21.
//
import UIKit

protocol MainViewModelDelegate: AnyObject {

}

class MainViewModel {

    weak var delegate: MainViewModelDelegate?

    init() {

    }

}


//public enum ButtonType {
//    case timer,
//         weights,
//         stats,
//         calendar
//}
//
//private enum SelectedViewGesture {
//    case tripleView,
//         lowerView,
//         calendarView
//}
//
//protocol MainViewModelDelegate: AnyObject {
//    func onMainButtonPressed(buttonType: ButtonType)
//}
//
//class MainViewModel
//{
//    var rightBarItem: UIBarButtonItem!
//    var title: String!
//    var parent: MainViewController!
//    var mainView: MainUIView!
//    var calendarView: CalendarView!
//    var tripleLineImageView: UIImageView!
//
//    var lowerView: LowerUIView!
//    private var lowerViewTopAnchor: NSLayoutConstraint!
//
//    weak var delegate: MainViewModelDelegate?
//
//    init(_ parent: MainViewController)
//    {
//        self.parent = parent
//        setRightBarItem()
//        setMainView()
//    }
//
//    private func setMainView()
//    {
//        // Main view
//        self.mainView = MainUIView(frame: .zero)
//        self.mainView.delegate = self
//            // Gesture (mainView holds gesture to determine location of first touch to each subview. This simplifies the gesture event.)
//        let panGesture = UIPanGestureRecognizerMainView(target: self, action: #selector(panGestureAction(_:)))
//        self.mainView.addGestureRecognizer(panGesture)
//
//        // Lower view
//        self.lowerView = LowerUIView(frame: .zero)
//        self.lowerView.delegate = self
//        self.mainView.addSubview(self.lowerView)
//
//        // Lower view draggable triple line
//            // Creation
//        tripleLineImageView = UIImageView(image: UIImage(systemName: "line.horizontal.3.decrease"))
//        tripleLineImageView.tintColor = .secondaryColor()
//            // Constraints
//        self.lowerView.addSubview(tripleLineImageView)
//        tripleLineImageView.translatesAutoresizingMaskIntoConstraints = false
//        tripleLineImageView.centerXAnchor.constraint(equalTo: self.lowerView.centerXAnchor).isActive = true
//        tripleLineImageView.widthAnchor.constraint(equalTo: lowerView.widthAnchor, multiplier: 0.1).isActive = true
//        tripleLineImageView.heightAnchor.constraint(equalTo: lowerView.widthAnchor, multiplier: 0.1).isActive = true
//
//        // Calendar on upp view
//        calendarView = CalendarView(frame: .zero)
//        self.mainView.addSubview(calendarView)
//
//        // Vertical scroll workouts done
//
//
//        // Horizontal select your workout
//    }
//
//    private func setRightBarItem()
//    {
//        let userImage = UIImage(systemName: "person.crop.circle")
//        self.rightBarItem = UIBarButtonItem(image: userImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
//        self.rightBarItem.tintColor = .systemBlue
//    }
//

//
//    var initialTopConstant: CGFloat = 0.0
//    var centerHeight: CGFloat? = nil
//    fileprivate var selectedViewGesture: SelectedViewGesture? = nil
//    @objc private func panGestureAction(_ panGesture: UIPanGestureRecognizerMainView)
//    {
//        guard panGesture.view != nil else {return}
//
//        let translation = panGesture.translation(in: panGesture.view)
//        panGesture.setTranslation(.zero, in: panGesture.view)
//
//        //let xTouch = panGesture.initialTouchLocation.x
//        let yTouch = panGesture.initialTouchLocation.y
//
//        let tripleLineYBegin = lowerView.frame.origin.y
//        let tripleLineYEnd = lowerView.frame.origin.y + (lowerView.frame.width * 0.1)
//        let lowerViewYBegin = lowerView.frame.origin.y + (lowerView.frame.width * 0.1)
//        let lowerViewYEnd = lowerView.frame.origin.y + lowerView.frame.height
//        //let calendarViewYBegin = calendarView.frame.origin.y
//        //let calendarViewYEnd = lowerView.frame.origin.y
//
//        if selectedViewGesture == nil {
//            if tripleLineYBegin < yTouch && tripleLineYEnd > yTouch // tripleLine gesture
//            {
//                selectedViewGesture = SelectedViewGesture.tripleView
//            }else if lowerViewYBegin < yTouch && lowerViewYEnd > yTouch // lowerView gesture
//            {
//                selectedViewGesture = SelectedViewGesture.lowerView
//            }else // calendarView gesture
//            {
//                selectedViewGesture = SelectedViewGesture.calendarView
//            }
//        }
//
//        switch selectedViewGesture {
//        case .tripleView:
//            print("yTouch: \(yTouch)")
//            print("between: \(tripleLineYBegin) & \(tripleLineYEnd)")
//
//            let velocity = panGesture.velocity(in: self.mainView)
//            //print(velocity.y)
//
//            if panGesture.state == .began {
//                initialTopConstant = lowerViewTopAnchor.constant
//                if centerHeight == nil { centerHeight = lowerView.frame.height}
//
//                if lowerView.frame.size.height <= mainView.frame.size.height && lowerView.frame.size.height >= centerHeight! {
//                    lowerViewTopAnchor.constant += translation.y
//                }else
//                {
//                    // Stretching the lowerView above the final location for consistancy with iOS products
//                    if lowerView.frame.size.height >= mainView.frame.size.height
//                    {
//                        let heightGreaterBy = lowerView.frame.size.height - mainView.frame.size.height
//                        lowerViewTopAnchor.constant += translation.y / heightGreaterBy
//                    }else
//                    {
//                        let heightGreaterBy = centerHeight! - lowerView.frame.size.height
//                        lowerViewTopAnchor.constant += translation.y / (heightGreaterBy*2)
//                    }
//                }
//            }
//
//            if panGesture.state == .changed {
//                if centerHeight == nil { centerHeight = lowerView.frame.height}
//
//                if lowerView.frame.size.height <= mainView.frame.size.height && lowerView.frame.size.height >= centerHeight! {
//                    lowerViewTopAnchor.constant += translation.y
//                }else
//                {
//                    // Stretching the lowerView above the final location for consistancy with iOS products
//                    if lowerView.frame.size.height >= mainView.frame.size.height
//                    {
//                        let heightGreaterBy = lowerView.frame.size.height - mainView.frame.size.height
//                        lowerViewTopAnchor.constant += translation.y / heightGreaterBy
//                    }else
//                    {
//                        let heightGreaterBy = centerHeight! - lowerView.frame.size.height
//                        lowerViewTopAnchor.constant += translation.y / (heightGreaterBy*2)
//                    }
//                }
//            }
//
//            if panGesture.state == .ended {
//                selectedViewGesture = nil
//
//                // First who are we closer to?
//                let topHeight = mainView.frame.size.height
//                let centerBetweenTopAndCenter = topHeight * 0.75
//
//                // Return to center else go to top
//                if velocity.y > 800 || velocity.y < -800 // down || up
//                {
//                    if velocity.y > 0 // down
//                    {
//                        self.lowerViewTopAnchor.isActive = false
//                        self.lowerViewTopAnchor = self.lowerView.topAnchor.constraint(equalTo: self.parent.view.centerYAnchor)
//                        self.lowerViewTopAnchor.isActive = true
//                    }else // up
//                    {
//                        self.lowerViewTopAnchor.isActive = false
//                        self.lowerViewTopAnchor = self.lowerView.topAnchor.constraint(equalTo: self.parent.view.safeAreaLayoutGuide.topAnchor)
//                        self.lowerViewTopAnchor.isActive = true
//                    }
//                    UIView.animate(withDuration: 0.2, animations: {
//                        self.mainView.layoutIfNeeded()
//                        self.lowerView.layoutIfNeeded()
//                    })
//                    return
//                }
//
//
//                if self.lowerView.frame.size.height <= centerBetweenTopAndCenter {
//                    self.lowerViewTopAnchor.isActive = false
//                    self.lowerViewTopAnchor = self.lowerView.topAnchor.constraint(equalTo: self.parent.view.centerYAnchor)
//                    self.lowerViewTopAnchor.isActive = true
//                }else
//                {
//                    self.lowerViewTopAnchor.isActive = false
//                    self.lowerViewTopAnchor = self.lowerView.topAnchor.constraint(equalTo: self.parent.view.safeAreaLayoutGuide.topAnchor)
//                    self.lowerViewTopAnchor.isActive = true
//                }
//
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.mainView.layoutIfNeeded()
//                    self.lowerView.layoutIfNeeded()
//                })
//            }
//            break
//        case .lowerView:
//            print("lowerView Gesture")
//            selectedViewGesture = nil
//            break
//        case .calendarView:
//            print("calendarView Gesture")
//            selectedViewGesture = nil
//            break
//        default:
//            break
//        }
//    }
//}
//
//extension MainViewModel: MainUIViewDelegate, LowerUIViewDelegate
//{
//    func addedLowerUIViewToWindow() {
//        self.lowerView.translatesAutoresizingMaskIntoConstraints = false
//        self.lowerView.widthAnchor.constraint(equalTo: parent.view.widthAnchor).isActive = true
//        self.lowerView.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor).isActive = true
//
//        // Used in the pan gesture movement
//        lowerViewTopAnchor = self.lowerView.topAnchor.constraint(equalTo: parent.view.centerYAnchor)
//        lowerViewTopAnchor.isActive = true
//
//        let screenWidth = parent.view.layer.bounds.size.width
//        self.lowerView.layer.cornerRadius = screenWidth * 0.03
//        self.lowerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        self.lowerView.layer.zPosition = 1
//        self.lowerView.layoutIfNeeded()
//    }
//
//    func addedMainUIViewToWindow() {
//        self.mainView.translatesAutoresizingMaskIntoConstraints = false
//        self.mainView.widthAnchor.constraint(equalTo: parent.view.widthAnchor).isActive = true
//        self.mainView.topAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.topAnchor).isActive = true
//        self.mainView.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor).isActive = true
//        self.mainView.layoutIfNeeded()
//
//        //let width = self.mainView.frame.size.width
//        //let height = self.mainView.frame.size.height - lowerView.frame.size.height
//        self.calendarView.translatesAutoresizingMaskIntoConstraints = false
//        self.calendarView.widthAnchor.constraint(equalTo: parent.view.widthAnchor).isActive = true
//        self.calendarView.bottomAnchor.constraint(equalTo: parent.view.centerYAnchor).isActive = true
//        self.calendarView.leftAnchor.constraint(equalTo: parent.view.leftAnchor).isActive = true
//        self.calendarView.topAnchor.constraint(equalTo: parent.view.safeAreaLayoutGuide.topAnchor).isActive = true
//        self.calendarView.layoutIfNeeded()
//    }
//}
