import Foundation
import UserNotifications

protocol NotificationWorkerInputProtocol {
    
    func addNotification(by date: Date)
}


final class NotificationWorker {
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    
    func createContent() -> UNMutableNotificationContent {
        
        let content = UNMutableNotificationContent()
        content.title = "Whaaat's UP!!!"
        content.body = "Don't forget to congratulat your friend!"
        content.sound = UNNotificationSound.default
        
        return content
    }
        
    
    func createTrigger(by date: Date) -> UNCalendarNotificationTrigger {
        
        let date = date
        var dateComponents = Calendar.current.dateComponents([.month, .day], from: date)
        dateComponents.hour = 17
        dateComponents.minute = 59
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        return trigger
    }
}


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
