import Foundation

struct OnbordingM: Identifiable {
    var id: Int
    var titleImage: String
    var image: String
    var heading: String
}

extension OnbordingM {
    static var data: [OnbordingM] = [
        OnbordingM(id: 0, titleImage: "scr1", image: "scrImage1", heading: "Вдохновляйся идеями"),
        OnbordingM(id: 1, titleImage: "scr2", image: "scrImage2", heading: "Читай туториалы и учись новому"),
        OnbordingM(id: 2, titleImage: "scr3", image: "scrImage3", heading: "Пробуй и расскажи о себе")
    ]
}
