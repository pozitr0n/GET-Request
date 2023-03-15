//
//  ViewController.swift
//  URLRequest1
//
//  Created by Raman Kozar on 15/03/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let createdImageViews = createStackViewWithImages()
        fillTheImages(createdImageViews)
        
    }
    
    func fillTheImages(_ createdImageViews: Array<UIImageView>) {
        
        let firstURL = URL(string: "https://www.4gamer.net/games/498/G049854/20210301046/TN/001.jpg")
        let secondURL = URL(string: "https://www.4gamer.net/games/411/G041107/20210301044/SS/001.jpg")
        
        guard let firstURL = firstURL else {
            return
        }
        
        guard let secondURL = secondURL else {
            return
        }
        
        var firstRequest = URLRequest(url: firstURL)
        firstRequest.httpMethod = "GET"
        
        var secondRequest = URLRequest(url: secondURL)
        secondRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: firstRequest) { data, responce, error in
        
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.sync {
                createdImageViews[0].image = UIImage(data: data)
            }
            
        }.resume()
        
        URLSession.shared.dataTask(with: secondRequest) { data, responce, error in
            
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.sync {
                createdImageViews[1].image = UIImage(data: data)
            }
            
        }.resume()
        
    }
    
    func createStackViewWithImages() -> Array<UIImageView> {
        
        let newStackView = UIStackView()
        newStackView.axis = .horizontal
        newStackView.distribution = .equalSpacing
        newStackView.alignment = .center
        newStackView.spacing = 10.0
        
        let pictureFirst = UIImageView()
        pictureFirst.heightAnchor.constraint(equalToConstant: 180.0).isActive = true
        pictureFirst.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        
        let pictureSecond = UIImageView()
        pictureSecond.heightAnchor.constraint(equalToConstant: 180.0).isActive = true
        pictureSecond.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        
        newStackView.addArrangedSubview(pictureFirst)
        newStackView.addArrangedSubview(pictureSecond)
        newStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(newStackView)
        
        newStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        newStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        var arrayOfImageViews: [UIImageView] = []
        arrayOfImageViews.append(pictureFirst)
        arrayOfImageViews.append(pictureSecond)
        
        return arrayOfImageViews
        
    }


}

