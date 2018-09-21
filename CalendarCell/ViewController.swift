//
//  ViewController.swift
//  CalendarCell
//
//  Created by Furkan Torun on 20.09.2018.
//  Copyright © 2018 Furkan Torun. All rights reserved.
//
import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section("WeekDay cell")
            
            <<< AlertRow<String>() {
                $0.title = "Etkinlik Seçiniz"
                $0.cancelTitle = "Dismiss"
                $0.selectorTitle = "Who is there?"
                $0.options = ["Kitap okuma Etkinliği", "Oyuncak Etkinliği", "Havuz Dersi"]
                $0.value = "Havuz Dersi"
                }.onChange { row in
                    print(row.value ?? "No Value")
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purple
            }
            
            <<< CalendarRow() {
                $0.value = nil
                //$0.value = [.monday, .wednesday, .friday]
            }
            
            <<< AlertRow<String>() {
                $0.title = "Sınıf Seçiniz"
                $0.cancelTitle = "İptal"
                $0.selectorTitle = "Sınıf Seçiniz?"
                $0.options = ["Kitap okuma Etkinliği", "Oyuncak Etkinliği", "Havuz Dersi"]
                $0.value = "03-4 A"
                }.onChange { row in
                    print(row.value ?? "No Value")
                }
                .onPresent{ _, to in
                    to.view.tintColor = .purple
            }
        

    }

}

