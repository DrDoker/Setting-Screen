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
}

extension Setting {
    static var settingCell: [[Setting]] = [
        [Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Wi-Fi"),
         Setting(icon: UIImage(systemName: "star")!, title: "Bluetooth"),
         Setting(icon: UIImage(systemName: "star")!, title: "Сотовая связь"),
         Setting(icon: UIImage(systemName: "star")!, title: "Режим модема"),
         Setting(icon: UIImage(systemName: "star")!, title: "VPN")],

        [Setting(icon: UIImage(systemName: "star")!, title: "Уведомления"),
         Setting(icon: UIImage(systemName: "star")!, title: "Звук, тактильные сигналы"),
         Setting(icon: UIImage(systemName: "star")!, title: "Фокусировка"),
         Setting(icon: UIImage(systemName: "star")!, title: "Экранное время")],

        [Setting(icon: UIImage(systemName: "star")!, title: "Основное"),
         Setting(icon: UIImage(systemName: "star")!, title: "Пункт управления"),
         Setting(icon: UIImage(systemName: "star")!, title: "Экран и яркость"),
         Setting(icon: UIImage(systemName: "star")!, title: "Экран \"Домой\""),
         Setting(icon: UIImage(systemName: "star")!, title: "Универсальный доступ"),
         Setting(icon: UIImage(systemName: "star")!, title: "Обои"),
         Setting(icon: UIImage(systemName: "star")!, title: "Siri и Поиск"),
         Setting(icon: UIImage(systemName: "star")!, title: "Face ID и код-пароль"),
         Setting(icon: UIImage(systemName: "star")!, title: "Экстренный вызов - SOS"),
         Setting(icon: UIImage(systemName: "star")!, title: "Аккумулятор"),
         Setting(icon: UIImage(systemName: "star")!, title: "Конфиденциальность и безопасность")],

        [Setting(icon: UIImage(systemName: "star")!, title: "App Store"),
         Setting(icon: UIImage(systemName: "star")!, title: "Wallet и Apple Pay")],

        [Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим")],

        [Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим"),
         Setting(icon: UIImage(systemName: "star")!, title: "Авиарежим")]
    ]
}
