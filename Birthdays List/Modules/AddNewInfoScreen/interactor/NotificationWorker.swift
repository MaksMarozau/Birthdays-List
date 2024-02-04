import Foundation
import UserNotifications

//MARK: - Protocol for extention NotificationWorker to create and add notifications to the notification center

protocol NotificationWorkerInputProtocol {
    
    func addNotification(by date: Date)
}



//MARK: - Final class MainListView

final class NotificationWorker {
    
    
//MARK: - Properties of class

    private let notificationCenter = UNUserNotificationCenter.current()
    
    
//MARK: - Methods of class
    
    func createContent() -> UNMutableNotificationContent {
        
        let content = UNMutableNotificationContent()
        content.title = locText(by: "Greeting")
        content.body = locText(by: "Greeting body")
        content.sound = UNNotificationSound.default
        
        return content
    }
    
    func createTrigger(by date: Date) -> UNCalendarNotificationTrigger {
        
        let date = date
        var dateComponents = Calendar.current.dateComponents([.month, .day], from: date)
        dateComponents.hour = 9
        dateComponents.minute = 45
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        return trigger
    }
    
    
//MARK: - Localization for text by title
                
    private func locText(by key: String) -> String {
        let text = NSLocalizedString(key, comment: "")
        return text
    }
}


//MARK: - Implemendation of NotificationWorkerInputProtocol protocol for NotificationWorker class

extension NotificationWorker: NotificationWorkerInputProtocol {
    
    func addNotification(by date: Date) {
        
        let content = createContent()
        let trigger = createTrigger(by: date)
        
        let request = UNNotificationRequest(identifier: "birthday", content: content, trigger: trigger)
        notificationCenter.add(request) { error in
            print("Error. Request for adding of notification was failed.")
        }
    }
}
