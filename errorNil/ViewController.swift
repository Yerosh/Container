//
//  ViewController.swift
//  errorNil
//
//  Created by Yernur Adilbek on 10/7/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    let appView = AppView()
    
    let groups = [
        Group(title: "asfddsafsad", numberOfGroups: 3, numberOfStudents: 102),
        Group(title: "asfddsafsad", numberOfGroups: 4, numberOfStudents: 56),
        Group(title: "asfddsafsad", numberOfGroups: 5, numberOfStudents: 89)]

    let scrollView = UIScrollView()
    
    var containerView = UIView()
    var containers: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfigure()
    }
    
    
    @objc func addButtonTapped(){
        
    }

}


//MARK: - setup
extension ViewController{
    
    
    func setupConfigure(){
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        
        containerView.snp.makeConstraints{ make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        view.backgroundColor = .systemBackground
        
        let titleLabel = appView.textLabel(text: "Name of the univer", weight: .light)
        containerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(containerView.snp.top).offset(80)
            make.leading.equalTo(containerView.snp.leading).offset(34)
        }
        
        let groupsLabel = appView.textLabel(text: "Groups", fontSize: 32, weight: .bold)
        containerView.addSubview(groupsLabel)
        
        groupsLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        let containerSpacing = [30, 26, 26]
        
        for (index, group) in groups.enumerated(){
            let myView = appView.view(backgroundColor: .systemGray, cornerRadius: 20)
            
            self.containerView.addSubview(myView)
            
            myView.snp.makeConstraints{ make in
                make.top.equalTo(index == 0 ? groupsLabel.snp.bottom : containers[index-1].snp.bottom).offset(containerSpacing[index])
                make.centerX.equalTo(containerView)
                make.width.equalTo(containerView).offset(-48)
                make.height.equalTo(143)
                
            }
            
            configureConstrainerView(myView, with: group)
            
            containers.append(myView)
        }
        
        let addButton = appView.button(imageName: "plus", tintColor: .black, backgroundColor: .lightGray, cornerRadius: 30)
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        containerView.addSubview(addButton)
        
        let lastContainer = containers[containers.count-1]
        
        addButton.snp.makeConstraints{make in
            make.top.equalTo(lastContainer.snp.bottom).offset(34)
            make.centerX.equalTo(lastContainer)
            make.height.width.equalTo(60)
        }
        
        let addlabel = appView.textLabel(text: "Add group", fontSize: 19, color: .black)
        containerView.addSubview(addlabel)
        
        addlabel.snp.makeConstraints{ make in
            make.top.equalTo(addButton.snp.bottom).offset(12)
            make.centerX.equalTo(addButton.snp.centerX)
        }
    }
    
    func configureConstrainerView(_ view: UIView, with group: Group){
        let titleTheme = appView.textLabel(text: group.title, fontSize: 16, weight: .bold)
        titleTheme.numberOfLines = 0
        view.addSubview(titleTheme)
        titleTheme.snp.makeConstraints{make in
            make.top.equalTo(view.snp.top).offset(34)
            make.leading.equalTo(view.snp.leading).offset(34)
            make.trailing.equalTo(view.snp.trailing).offset(-35)
        }
        
        var chevronImageButton = appView.button(imageName: "chevron.right", tintColor: .gray)
        view.addSubview(chevronImageButton)
        chevronImageButton.backgroundColor = .systemGray
        chevronImageButton.snp.makeConstraints{make in
            make.top.equalTo(titleTheme.snp.top)
            make.leading.equalTo(titleTheme.snp.trailing).offset(9)
        }
        
        let groupLabel = appView.textLabel(text: "Group: \(group.numberOfGroups)", fontSize: 19, color: .black)
        view.addSubview(groupLabel)
        groupLabel.snp.makeConstraints{make in
            make.top.equalTo(titleTheme.snp.bottom).offset(14)
            make.leading.equalTo(titleTheme.snp.leading)
        }
        
        let studentLabel = appView.textLabel(text: "Students: \(group.numberOfStudents)", fontSize: 19, color: .black)
        view.addSubview(studentLabel)
        studentLabel.snp.makeConstraints{make in
            make.top.equalTo(titleTheme.snp.bottom).offset(14)
            make.leading.equalTo(groupLabel.snp.trailing).offset(30)
        }
    }
}
