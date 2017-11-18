//
//  MOBTableViewController.swift
//  MOBCore
//
//  Created by Jason Morcos on 12/4/15.
//  Copyright © 2017 Moballo, LLC. All rights reserved.
//

import UIKit

@objc open class MOBTableViewController: UITableViewController {
    fileprivate var statusLabelView: UILabel?
    override open func viewDidLoad() {
        self.extendedLayoutIncludesOpaqueBars = false;
        self.tableView.keyboardDismissMode = .interactive
        statusLabelView = UILabel()
        if let searchLabel = statusLabelView {
            searchLabel.text = ""
            searchLabel.textColor = UIColor.black
            searchLabel.textAlignment = .center
            searchLabel.font = UIFont.boldSystemFont(ofSize: 18)
            searchLabel.numberOfLines = 0;
            searchLabel.backgroundColor = UIColor.clear
            self.view.addSubview(searchLabel)
            searchLabel.isHidden = true
            searchLabel.translatesAutoresizingMaskIntoConstraints = false;
            let topPadding:CGFloat
            if UIApplication.isExtension {
                topPadding = max(5, (self.tableView.rowHeight-searchLabel.frame.height)/2)
            } else {
                topPadding = 55.0
            }
            var constraints = [NSLayoutConstraint]()
            constraints.append(NSLayoutConstraint(item: searchLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
            constraints.append(NSLayoutConstraint(item: searchLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: topPadding))
            constraints.append(NSLayoutConstraint(item: searchLabel, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: topPadding))
            constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|->=padding-[statusLabel(<=maxWidth)]->=padding-|", options: NSLayoutFormatOptions(), metrics: ["padding" : 15, "maxWidth" : 290], views: ["statusLabel" : searchLabel]))
            self.view.addConstraints(constraints)
        }
        super.viewDidLoad()
    }
    public func setStatusLabelColor(_ color: UIColor) {
        if let searchLabel = statusLabelView {
            searchLabel.textColor = color
        }
    }
    public func showStatusLabel(message: String, color: UIColor? = nil) {
        if let searchLabel = statusLabelView {
            searchLabel.text = message
            searchLabel.isHidden = false
            if let desiredColor = color {
                searchLabel.textColor = desiredColor
            }
        }
    }
    public func hideStatusLabel() {
        if let searchLabel = statusLabelView {
            searchLabel.isHidden = true
        }
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.deselectAllCells()
    }
}

open class MOBTableViewControllerWithSearch: MOBTableViewController, UISearchControllerDelegate, UISearchResultsUpdating {
    public var searchController = UISearchController(searchResultsController: nil)
    fileprivate var privateSearchEnabled = false;
    public var searchEnabled: Bool {
        return privateSearchEnabled;
    }
    public var searchBar: UISearchBar {
        return searchController.searchBar;
    }
    open func filterSearchResults(searchTerm: String?) {
        //OVERRIDE IN SUBCLASS
    }
    override open func viewDidLoad() {
        setupSearchController()
        super.viewDidLoad()
    }
    
    public func enableSearch() {
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
            self.navigationItem.hidesSearchBarWhenScrolling = true
        } else {
            self.tableView.tableHeaderView = searchBar
            //self.navigationItem.titleView = searchController.searchBar
        }
        privateSearchEnabled = true;
    }
    public func disableSearch() {
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = nil
        } else {
            self.tableView.tableHeaderView = nil
            //self.navigationItem.titleView = nil
        }
        privateSearchEnabled = false;
    }
    fileprivate func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
    }
    public func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchBar.isEmpty
    }
    
    public var isSearching: Bool {
        return searchEnabled && searchController.isActive
    }
    
    public func setSearchColorscheme(barBackgroundColor: UIColor, barTintColor: UIColor, tintColor: UIColor, textboxBackgroundColor: UIColor, textColor: UIColor, cursorColor: UIColor, translucent: Bool, opaque: Bool) {
        self.searchBar.setColorscheme(barBackgroundColor: barBackgroundColor, barTintColor: barTintColor, tintColor: tintColor, textboxBackgroundColor: textboxBackgroundColor, textColor: textColor, cursorColor: cursorColor, translucent: translucent, opaque: opaque)
    }
    public func updateSearchResults(for searchController: UISearchController) {
        filterSearchResults(searchTerm: searchController.searchBar.text)
    }
    public func didPresentSearchController(_ searchController: UISearchController) {
        if #available(iOS 11.0, *) {
            self.navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    public func didDismissSearchController(_ searchController: UISearchController) {
        if #available(iOS 11.0, *) {
            self.navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
}

