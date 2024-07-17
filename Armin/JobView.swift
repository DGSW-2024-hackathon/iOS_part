import SwiftUI

enum SortOrder: String, CaseIterable, Identifiable {
    case abcd = "ABCD"
    case liked = "Popular"
    case recent = "Recent"
    
    var id: String { self.rawValue }
}

struct Job: Identifiable {
    let id: Int
    let companyName: String
    var description: String
    var views: Int
}

struct JobView: View {
    @State private var jobCount = 162
    @State private var selectedSortOrder: SortOrder = .abcd
    @State private var jobs: [Job] = []

    init() {
        let companyNames = ["Alphabet", "Apple", "Samsung", "Naver", "Coupang", "Valve Corp.", "Stark Industries", "Tesla", "Space X", "LEMMiNO", "CHANNEL", "NVIDIA", "Dumbledore's Army", "Ministry of Magic", "KFC", "LG", "GS", "Seltrion", "Toyota", "Shaomi", "ASUS", "AMD", "Autodesk", "Microsoft", "META", "Intel", "X", "Twitch", "Amazon.com", "Macdonald", "DB", "Hyundai", "Shinhan", "KB", "SK Hynix", "Posco", "Hana", "KIA", "SM", "Nexon", "PBS", "USPS", "MTA", "Mobifone", "VRT", "Proximus"]
        
        _jobs = State(initialValue: (1...jobCount).map { id in
            Job(id: id, companyName: companyNames[id % companyNames.count], description: "Description for job \(id)", views: Int.random(in: 1...100000))
        })
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Job List")
                    .padding(.top, 30)
                    .font(.system(size: 30, weight: .ultraLight))
                HStack {
                    Text("Total: \(jobCount)")
                        .padding(.leading, 30)
                        .padding(.top, -15)
                    
                    Spacer()
                    
                    Picker("Sort Order", selection: $selectedSortOrder) {
                        ForEach(SortOrder.allCases) { order in
                            Text(order.rawValue).tag(order)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.trailing, 30)
                    .padding(.top, -15)
                    .font(.title3)
                }
                
                Divider()
                    .frame(height: 3)
                
                ScrollView {
                    LazyVStack {
                        ForEach(sortedJobs(), id: \.id) { job in
                            NavigationLink(destination: JobDescriptionView(job: job, onAppear: {
                                increaseViews(of: job)
                            })) {
                                JobComponentView(job: job)
                                    .foregroundColor(.black)
                            }
                            Divider()
                                .frame(height: 2)
                        }
                    }
                }
            }
        }
    }

    func sortedJobs() -> [Job] {
        switch selectedSortOrder {
        case .abcd:
            return jobs.sorted { $0.companyName < $1.companyName }
        case .liked:
            return jobs.sorted { $0.views > $1.views }
        case .recent:
            return jobs.sorted { $0.id > $1.id }
        }
    }

    func increaseViews(of job: Job) {
        if let index = jobs.firstIndex(where: { $0.id == job.id }) {
            jobs[index].views += 1
        }
    }
}

#Preview {
    JobView()
}
