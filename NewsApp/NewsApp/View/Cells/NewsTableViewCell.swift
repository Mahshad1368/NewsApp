//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 24.07.24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let reuseID = "newsCell"
    
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.preferredFont(forTextStyle: .headline)
        lable.numberOfLines = 0
        return lable
    }()
    private let subtitleLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.preferredFont(forTextStyle: .subheadline)
        lable.numberOfLines = 0
        return lable
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI(){
        contentView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLable)
        titleStackView.addArrangedSubview(subtitleLable)
        titleStackView.pinToEdges(of: contentView, withPadding: 10)
        
        
    }
    func setCell(article: Article){
        self.titleLable.text = article.title ?? "N/A"
        subtitleLable.text = "\(article.publishedAt?.getStringRepreaentation() ?? "N/A") Uhr"
    }
}