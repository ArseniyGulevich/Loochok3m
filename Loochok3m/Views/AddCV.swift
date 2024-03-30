//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

struct AddCV: View {
    var body: some View {
        // Здесь будет экран для добавления новой идеи или туториала
        
        ZStack {
            // Фон
            Color.yellow
                .ignoresSafeArea()
            
            // Контент
            Text("Добавить идею/туториал")
                .font(.custom("SuisseIntl-Light.otf", size: 30))
        }
    }
}

struct AddCV_Previews: PreviewProvider {
    static var previews: some View {
        AddCV()
    }
}
