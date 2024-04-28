//
//  AppView.swift
//  errorNil
//
//  Created by Yernur Adilbek on 10/7/23.
//

import Foundation
import UIKit

class AppView{
    func textLabel(text: String, fontSize: CGFloat = 16, weight: UIFont.Weight = .regular, color: UIColor = .black)-> UILabel{
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = color
        return label
    }
    
    func button(imageName: String, tintColor: UIColor = .black, backgroundColor: UIColor = .white, cornerRadius: CGFloat = 0)-> UIButton{
        let button = UIButton()
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        return button
    }
    
    func imageView(imageName: String, tintColor: UIColor = .gray, contentMode: UIView.ContentMode = .scaleAspectFit)-> UIImageView{
        let imageView = UIImageView(image: UIImage(systemName: imageName))
        imageView.tintColor = tintColor
        imageView.contentMode = contentMode
        return imageView
    }
    
    func view(backgroundColor: UIColor = .white, cornerRadius: CGFloat = 0)-> UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
}
