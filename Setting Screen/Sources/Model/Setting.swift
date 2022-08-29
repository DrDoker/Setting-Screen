//
//  Setting.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit

enum CellType {
    case userInfo
    case familyInfo
    case standart
    case cellWithSwitch
}

struct Setting: Hashable {
    var type: CellType
    var icon: UIImage?
    var title: String
    var additionalText: String?
    var imageBackgroundColor: UIColor? = .systemGray
}

extension Setting {
    static var settingCells: [[Setting]] = [
        [Setting(type: .userInfo , icon: UIImage(named: "serhii")!, title: "Serhii Tkachenko", additionalText: "Apple ID, iCloud+, контент и покупки", imageBackgroundColor: .black),
         Setting(type: .familyInfo , icon: UIImage(systemName: "person.2.fill")!, title: "Семья", imageBackgroundColor: .systemBlue)],

        [Setting(type: .cellWithSwitch, icon: UIImage(systemName: "airplane")!, title: "Авиарежим", imageBackgroundColor: .systemOrange),
         Setting(type: .standart, icon: UIImage(systemName: "wifi")!, title: "Wi-Fi", additionalText: "My Wifi", imageBackgroundColor: .systemBlue),
         Setting(type: .standart, icon: UIImage(named: "bt")!, title: "Bluetooth", additionalText: "Вкл.", imageBackgroundColor: .systemBlue),
         Setting(type: .standart, icon: UIImage(systemName: "antenna.radiowaves.left.and.right")!, title: "Сотовая связь", imageBackgroundColor: .systemGreen),
         Setting(type: .standart, icon: UIImage(systemName: "personalhotspot")!, title: "Режим модема", imageBackgroundColor: .systemGreen),
         Setting(type: .standart, icon: UIImage(named: "vpn")!, title: "VPN", additionalText: "Не подключен",imageBackgroundColor: .systemBlue)],

        [Setting(type: .standart, icon: UIImage(systemName: "bell.badge.fill")!, title: "Уведомления", imageBackgroundColor: .systemRed),
         Setting(type: .standart, icon: UIImage(systemName: "speaker.wave.3.fill")!, title: "Звук, тактильные сигналы", imageBackgroundColor: .systemRed),
         Setting(type: .standart, icon: UIImage(systemName: "moon.fill")!, title: "Фокусировка", imageBackgroundColor: .systemIndigo),
         Setting(type: .standart, icon: UIImage(systemName: "hourglass")!, title: "Экранное время", imageBackgroundColor: .systemIndigo)],

        [Setting(type: .standart, icon: UIImage(systemName: "gear")!, title: "Основное"),
         Setting(type: .standart, icon: UIImage(systemName: "switch.2")!, title: "Пункт управления"),
         Setting(type: .standart, icon: UIImage(systemName: "textformat.size")!, title: "Экран и яркость", imageBackgroundColor: .systemBlue),
         Setting(type: .standart, icon: UIImage(systemName: "square.grid.3x3.bottommiddle.filled")!, title: "Экран \"Домой\"", imageBackgroundColor: .systemTeal),
         Setting(type: .standart, icon: UIImage(systemName: "figure.wave.circle")!, title: "Универсальный доступ", imageBackgroundColor: .systemBlue),
         Setting(type: .standart, icon: UIImage(systemName: "camera.macro")!, title: "Обои", imageBackgroundColor: .systemCyan),
         Setting(type: .standart, icon: UIImage(named: "siri")!, title: "Siri и Поиск", imageBackgroundColor: .black),
         Setting(type: .standart, icon: UIImage(systemName: "faceid")!, title: "Face ID и код-пароль", imageBackgroundColor: .systemGreen),
         Setting(type: .standart, icon: UIImage(named: "sos")!, title: "Экстренный вызов - SOS", imageBackgroundColor: .systemRed),
         Setting(type: .standart, icon: UIImage(systemName: "battery.100")!, title: "Аккумулятор", imageBackgroundColor: .systemGreen),
         Setting(type: .standart, icon: UIImage(systemName: "hand.raised.fill")!, title: "Конфиденциальность", imageBackgroundColor: .systemBlue)],

        [Setting(type: .standart, icon: UIImage(named: "appstore")!, title: "App Store", imageBackgroundColor: .systemBlue),
         Setting(type: .standart, icon: UIImage(named: "wallet")!, title: "Wallet и Apple Pay", imageBackgroundColor: .black)]
    ]
}
