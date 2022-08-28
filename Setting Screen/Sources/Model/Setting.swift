//
//  Setting.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit

struct Setting: Hashable {
    var icon: UIImage
    var title: String
    var imageBackgroundColor: UIColor? = .systemGray
}

extension Setting {
    static var settingCells: [[Setting]] = [
        [Setting(icon: UIImage(systemName: "airplane")!, title: "Авиарежим", imageBackgroundColor: .systemOrange),
         Setting(icon: UIImage(systemName: "wifi")!, title: "Wi-Fi", imageBackgroundColor: .systemBlue),
         Setting(icon: UIImage(named: "bt")!, title: "Bluetooth", imageBackgroundColor: .systemBlue),
         Setting(icon: UIImage(systemName: "antenna.radiowaves.left.and.right")!, title: "Сотовая связь", imageBackgroundColor: .systemGreen),
         Setting(icon: UIImage(systemName: "personalhotspot")!, title: "Режим модема", imageBackgroundColor: .systemGreen),
         Setting(icon: UIImage(named: "vpn")!, title: "VPN", imageBackgroundColor: .systemBlue)],

        [Setting(icon: UIImage(systemName: "bell.badge.fill")!, title: "Уведомления", imageBackgroundColor: .systemRed),
         Setting(icon: UIImage(systemName: "speaker.wave.3.fill")!, title: "Звук, тактильные сигналы", imageBackgroundColor: .systemRed),
         Setting(icon: UIImage(systemName: "moon.fill")!, title: "Фокусировка", imageBackgroundColor: .systemIndigo),
         Setting(icon: UIImage(systemName: "hourglass")!, title: "Экранное время", imageBackgroundColor: .systemIndigo)],

        [Setting(icon: UIImage(systemName: "gear")!, title: "Основное"),
         Setting(icon: UIImage(systemName: "switch.2")!, title: "Пункт управления"),
         Setting(icon: UIImage(systemName: "textformat.size")!, title: "Экран и яркость", imageBackgroundColor: .systemBlue),
         Setting(icon: UIImage(systemName: "star")!, title: "Экран \"Домой\""),
         Setting(icon: UIImage(systemName: "star")!, title: "Универсальный доступ"),
         Setting(icon: UIImage(systemName: "star")!, title: "Обои"),
         Setting(icon: UIImage(systemName: "star")!, title: "Siri и Поиск"),
         Setting(icon: UIImage(systemName: "faceid")!, title: "Face ID и код-пароль", imageBackgroundColor: .systemGreen),
         Setting(icon: UIImage(named: "sos")!, title: "Экстренный вызов - SOS", imageBackgroundColor: .systemRed),
         Setting(icon: UIImage(systemName: "battery.100")!, title: "Аккумулятор", imageBackgroundColor: .systemGreen),
         Setting(icon: UIImage(systemName: "hand.raised.fill")!, title: "Конфиденциальность", imageBackgroundColor: .systemBlue)],

        [Setting(icon: UIImage(named: "appstore")!, title: "App Store", imageBackgroundColor: .systemBlue),
         Setting(icon: UIImage(systemName: "star")!, title: "Wallet и Apple Pay")]
    ]
}
