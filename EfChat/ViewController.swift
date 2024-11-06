//
//  ViewController.swift
//  EfChat
//
//  Created by 1111 on 05.11.2024.
//

import UIKit

struct Message {
    let text: String
    let sender: String
    let timestamp: Date
}

class ViewController: UIViewController, UITableViewDataSource {
   
    // Массив для хранения сообщений
    var messages: [Message] = []
    
    
    // Ссылаемся на текстовое поле и таблицу
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Устанавливаем источник данных для таблицы
        tableView.dataSource = self
        
    }
    
    // Метод для отправки сообщения
    @IBAction func sendMessage(_ sender: UIButton) {
        // Проверяем, что текстовое поле не пустое
        guard  let text = textField.text, !text.isEmpty else { return }
        
        // Создаем новое сообщение
        let newMessage = Message(text: text, sender: "User", timestamp: Date())
        
        // Доблвляем сообщение в массив
        messages.append(newMessage)
        
        // Обновляем таблицу, чтобы отобразить новое сообщение
        tableView.reloadData()
        
        // Очищаем текстовое поле
        textField.text = ""
        
        // Прокручиваем таблицу вниз чтобы увидеть новое сообщение
        let IndexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: IndexPath, at: .bottom, animated: true)
    }
    
    // MARK:  - UITableViewDataSource методы
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        let messenger = messages[indexPath.row]
        
        // Настроим ячейку для отображения текста сообщения
        cell.textLabel?.text = messenger.text
        
        return cell
    }
    
    


}

