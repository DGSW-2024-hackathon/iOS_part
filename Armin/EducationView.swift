import SwiftUI

struct EducationView: View {
    @State private var selectedIndex: Int? = 0
    let videoTitles = [
        ["Basic Korean I, You...", "Basic Korean - Verb", "Basic Korean - Adjectives", "Basic Korean - Inspection", "Basic Korean - So, And..."],
        ["What Are Competencies?", "Interview Questions and...", "5 Competency Based...", "Skills vs Competency", "Finding Your Company's..."],
        ["Top 5 Online Certifications...", "11 High Paying Certifications...", "How to get started with...", "Project Certifications - the...", "Professional Engineering..."]
    ]
    let videoURLs = [
        ["https://example.com/korean1", "https://example.com/korean2", "https://example.com/korean3", "https://example.com/korean4", "https://example.com/korean5"],
        ["https://example.com/competency1", "https://example.com/competency2", "https://example.com/competency3", "https://example.com/competency4", "https://example.com/competency5"],
        ["https://example.com/certification1", "https://example.com/certification2", "https://example.com/certification3", "https://example.com/certification4", "https://example.com/certification5"]
    ]
    let buttonTitles = ["언어", "직업 역량", "자격증"]

    var body: some View {
        VStack {
            Text("Education")
                .font(.system(size: 30, weight: .ultraLight))
                .padding(.top)
            
            HStack {
                VStack(spacing: 20) {
                    ForEach(0..<buttonTitles.count, id: \.self) { index in
                        Button(action: {
                            selectedIndex = index
                        }) {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(selectedIndex == index ? Color.accentColor : Color.accentColorUltraLight)
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Text(buttonTitles[index])
                                        .foregroundColor(selectedIndex == index ? Color.accentColorUltraLight : Color.accentColor)
                                        .font(.headline)
                                )
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 10) {
                        if let selectedIndex = selectedIndex {
                            ForEach(0..<5) { videoIndex in
                                VStack {
                                    Link(destination: URL(string: videoURLs[selectedIndex][videoIndex])!) {
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(Color.gray)
                                            .frame(height: 200)
                                            .overlay(
                                                Text("\(buttonTitles[selectedIndex]) \(videoIndex + 1)")
                                                    .foregroundColor(.white)
                                                    .font(.largeTitle)
                                            )
                                    }
                                    Text(videoTitles[selectedIndex][videoIndex])
                                        .font(.subheadline)
                                        .padding([.top, .bottom], 5)
                                }
                            }
                        } else {
                            Text("Select a square to see videos")
                                .font(.headline)
                                .padding()
                        }
                    }
                }
                .padding()
            }
            .padding(.bottom, 0)
        }
    }
}

struct EducationView_Previews: PreviewProvider {
    static var previews: some View {
        EducationView()
    }
}
