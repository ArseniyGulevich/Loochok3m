//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

struct ProfileCV: View {
    @State var games = [Game]()
    
    var body: some View {
        UserProfileCV()
    }
}

struct ProfileCV_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCV()
    }
}
